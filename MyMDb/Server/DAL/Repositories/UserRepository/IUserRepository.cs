using MyMDb.Shared.DTOs.MyMDbUser;

namespace MyMDb.Server.DAL.Repositories.UserRepository
{
    public interface IUserRepository
    {
        Task<MyMDbUser?> Get(int id);
        Task<MyMDbUser?> GetExtended(int id); 
        Task<MyMDbUser?> Get(string username);
        Task<MyMDbUser?> Insert(MyMDbUserDto value);
        Task<MyMDbUser?> Update(int id, MyMDbUserUpdateDto value);
        Task<MyMDbUser?> Delete(int id);
    }
}
