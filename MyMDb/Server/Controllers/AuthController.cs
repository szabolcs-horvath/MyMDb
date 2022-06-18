using System.Security.Claims;
using Microsoft.AspNetCore.Mvc;
using MyMDb.Server.DAL.Repositories.UserRepository;
using MyMDb.Server.DAL.Services.AuthService;
using MyMDb.Shared.DTOs;
using MyMDb.Shared.DTOs.MyMDbUser;

namespace MyMDb.Server.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AuthController : ControllerBase
    {
        private readonly IAuthService _authService;
        private readonly IUserRepository _repository;

        public AuthController(IAuthService authService, IUserRepository repository)
        {
            _authService = authService;
            _repository = repository;
        }

        [HttpPost("login")]
        public async Task<ActionResult<string>> Login(MyMDbUserLoginDto request)
        {
            var user = await _repository.Get(request.Username);

            if (user is null)
            {
                return BadRequest();
            }

            var hash = new HashDto
            {
                PasswordHash = user.PasswordHash,
                PasswordSalt = user.PasswordSalt
            };

            if (!await _authService.VerifyPasswordHash(request.Password, hash))
            {
                return BadRequest();
            }

            var claims = _authService.CreateClaims(user);

            var token = _authService.CreateToken(claims);

            return Ok(token);
        }

        [HttpPost("register")]
        public async Task<ActionResult<MyMDbUser>> Register(MyMDbUserRegisterDto request)
        {
            var hash = await _authService.CreatePasswordHash(request.Password);

            var user = new MyMDbUserDto
            {
                Username = request.Username,
                PasswordHash = hash.PasswordHash,
                PasswordSalt = hash.PasswordSalt,
                MyMDbRoleId = request.MyMDbRoleId
            };

            await _repository.Insert(user);

            return Ok("Successful registration!");
        }
    }
}
