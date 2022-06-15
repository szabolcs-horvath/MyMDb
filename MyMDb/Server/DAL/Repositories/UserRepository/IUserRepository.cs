using MyMDb.Shared.DTOs;

namespace MyMDb.Server.DAL.Repositories.UserRepository
{
    public interface IUserRepository
    {
        Task<UserDto?> Get(int id);
        Task<UserDto?> Get(string username);
        Task<UserDto> Insert(UserDto value);
        Task<UserDto?> Update(UserDto value);
        Task<UserDto?> Delete(int id);
    }
}
