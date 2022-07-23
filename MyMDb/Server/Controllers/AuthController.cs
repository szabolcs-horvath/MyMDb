using Microsoft.AspNetCore.Mvc;
using MyMDb.Server.DAL.Repositories.UserRepository;
using MyMDb.Server.Services.AuthService;
using MyMDb.Shared.DTOs;
using MyMDb.Shared.DTOs.MyMDbUser;
using MyMDb.Shared.ResponseModel.MyMDbUser;

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
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult<string>> Login(MyMDbUserRegisterLoginDto request)
        {
            var user = await _repository.GetExtended(request.Username);

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
        [ProducesResponseType(StatusCodes.Status200OK)]
        public async Task<ActionResult<MyMDbUserBasicResponse>> Register(MyMDbUserRegisterLoginDto request)
        {
            var hash = await _authService.CreatePasswordHash(request.Password);

            var user = new MyMDbUserCreateDto
            {
                Username = request.Username,
                PasswordHash = hash.PasswordHash,
                PasswordSalt = hash.PasswordSalt,
                MyMDbRoleId = 2 //Default
            };

            var result = await _repository.Insert(user);

            return Ok(result?.ToBasicResponse());
        }
    }
}
