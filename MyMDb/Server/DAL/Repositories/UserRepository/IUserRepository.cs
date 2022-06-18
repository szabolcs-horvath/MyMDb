using MyMDb.Shared.DTOs;

namespace MyMDb.Server.DAL.Repositories.UserRepository
{
    public interface IUserRepository
    {
        Task<MyMDbUserDto?> Get(int id);
        Task<MyMDbUser?> GetExtended(int id); 
        Task<MyMDbUserDto?> Get(string username);
        Task<MyMDbUserDto> Insert(MyMDbUserDto value);
        Task<MyMDbUserDto?> Update(MyMDbUserDto value);
        Task<MyMDbUserDto?> Delete(int id);
    }
}
