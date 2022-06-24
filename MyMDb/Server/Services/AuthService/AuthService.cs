using System.Diagnostics;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;
using Microsoft.IdentityModel.Tokens;
using MyMDb.Server.DAL.Entities;
using MyMDb.Shared.DTOs;

namespace MyMDb.Server.Services.AuthService
{
    public class AuthService : IAuthService
    {
        private readonly IConfiguration _configuration;

        public AuthService(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public string CreateToken(List<Claim> claims)
        {
            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(
                _configuration.GetSection("AppSettings:Token").Value));

            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha512Signature);

            var token = new JwtSecurityToken(
                claims: claims,
                expires: DateTime.Now.AddHours(1),
                signingCredentials: creds
            );

            var jwt = new JwtSecurityTokenHandler().WriteToken(token);

            return jwt;
        }

        public List<Claim> CreateClaims(MyMDbUser user)
        {
            var claims = new List<Claim>
            {
                new Claim(ClaimTypes.NameIdentifier, user.Id.ToString()),
                new Claim(ClaimTypes.Name, user.Username),
                new Claim(ClaimTypes.Role, user.MyMDbRole?.Rolename ?? "Undefined")
            };

            return claims;
        }

        public async Task<HashDto> CreatePasswordHash(string password)
        {
            using var hmac = new HMACSHA512();

            var passwordSalt = hmac.Key;
            var passwordHash = Array.Empty<byte>();

            var stopwatch = new Stopwatch();
            stopwatch.Start();

            for (var i = 0; i < 1_000_000; i++) //Should calculate the hash in about 1-2 seconds depending on environment
            {
                passwordHash = await hmac.ComputeHashAsync(
                    new MemoryStream(Encoding.UTF8.GetBytes(password)));
            }

            stopwatch.Stop();
            Console.WriteLine($"Elapsed time at registration: {stopwatch.ElapsedMilliseconds} milliseconds");

            return new HashDto
            {
                PasswordHash = passwordHash,
                PasswordSalt = passwordSalt
            };
        }

        public async Task<bool> VerifyPasswordHash(string password, HashDto hash)
        {
            using var hmac = new HMACSHA512(hash.PasswordSalt);
            var computedHash = Array.Empty<byte>();

            var stopwatch = new Stopwatch();
            stopwatch.Start();

            for (var i = 0; i < 1_000_000; i++)
            {
                computedHash = await hmac.ComputeHashAsync(
                    new MemoryStream(Encoding.UTF8.GetBytes(password)));
            }

            stopwatch.Stop();
            Console.WriteLine($"Elapsed time at login: {stopwatch.ElapsedMilliseconds} milliseconds");

            return computedHash.SequenceEqual(hash.PasswordHash);
        }
    }
}
