using System.Security.Claims;
using MyMDb.Shared.DTOs;

namespace MyMDb.Server.DAL.Services.AuthService
{
    public interface IAuthService
    {
        public string CreateToken(MyMDbUserDto myMDbUser, List<Claim> claims);
        public Task<HashDto> CreatePasswordHash(string password);
        public Task<bool> VerifyPasswordHash(string password, HashDto hash);
    }
}
