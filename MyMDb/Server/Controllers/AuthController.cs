using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using MyMDb.Server.DAL.Repositories.UserRepository;
using MyMDb.Shared.DTOs;

namespace MyMDb.Server.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AuthController : ControllerBase
    {
        private readonly IUserRepository _repository;
        private readonly IConfiguration _configuration;

        public AuthController(IUserRepository repository, IConfiguration configuration)
        {
            _repository = repository;
            _configuration = configuration;
        }

        [HttpPost("login")]
        public async Task<ActionResult<string>> Login(UserLoginDto request)
        {
            var user = await _repository.Get(request.Username);

            if (user is null ||
                !VerifyPasswordHash(request.Password, user.PasswordHash, user.PasswordSalt))
            {
                return BadRequest();
            }

            var token = CreateToken(user);
            return Ok(token);
        }

        [HttpPost("register")]
        public async Task<ActionResult<User>> Register(UserRegisterDto request)
        {
            if (request.Password != request.ConfirmPassword)
            {
                return BadRequest("Confirm password doesn't match");
            }

            CreatePasswordHash(request.Password, out var passwordHash, out var passwordSalt);

            var user = new UserDto
            {
                Username = request.Username,
                PasswordHash = passwordHash,
                PasswordSalt = passwordSalt
            };

            await _repository.Insert(user);

            return Ok("Successful registration!");
        }

        private string CreateToken(UserDto user)
        {
            var claims = new List<Claim>
            {
                new Claim(ClaimTypes.NameIdentifier, user.Id.ToString()),
                new Claim(ClaimTypes.Name, user.Username),
                new Claim(ClaimTypes.Role, "Admin"),
            };

            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(
                _configuration.GetSection("AppSettings:Token").Value));

            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha512Signature);

            var token = new JwtSecurityToken(
                claims: claims,
                expires: DateTime.Now.AddDays(1),
                signingCredentials: creds
                );

            var jwt = new JwtSecurityTokenHandler().WriteToken(token);

            return jwt;
        }

        private void CreatePasswordHash(string password, out byte[] passwordHash, out byte[] passwordSalt)
        {
            using var hmac = new HMACSHA512();

            passwordSalt = hmac.Key;
            passwordHash = Array.Empty<byte>();

            //var stopwatch = new Stopwatch();
            //stopwatch.Start();
            for (var i = 0; i < 1_000_000; i++) //Should calculate the hash in about 1-2 seconds depending on environment
            {
                passwordHash = hmac.ComputeHash(Encoding.UTF8.GetBytes(password));
            }
            //stopwatch.Stop();
            //Console.WriteLine($"Elapsed time: {stopwatch.ElapsedMilliseconds} milliseconds");
        }

        private bool VerifyPasswordHash(string password, byte[] passwordHash, byte[] passwordSalt)
        {
            //TODO Get User's salt from DB with username, initialize hmac with that
            using var hmac = new HMACSHA512(passwordSalt);
            var computedHash = Array.Empty<byte>();
            for (var i = 0; i < 1_000_000; i++)
            {
                computedHash = hmac.ComputeHash(Encoding.UTF8.GetBytes(password));
            }
            return computedHash.SequenceEqual(passwordHash);
        }
    }
}
