using MyMDb.Shared.DTOs;

namespace MyMDb.Server.DAL.Repositories.UserRepository
{
    public interface IUserRepository
    {
        Task<MyMDbUser?> Get(int id);
        Task<MyMDbUser?> GetExtended(int id); 
        Task<MyMDbUser?> Get(string username);
        Task<MyMDbUser?> Insert(MyMDbUserDto value);
        Task<MyMDbUser?> Update(MyMDbUserDto value);
        Task<MyMDbUser?> Delete(int id);
    }
}
