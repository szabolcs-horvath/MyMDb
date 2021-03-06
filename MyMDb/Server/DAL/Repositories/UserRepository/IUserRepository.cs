using MyMDb.Server.DAL.Entities;
using MyMDb.Shared.DTOs.MyMDbUser;

namespace MyMDb.Server.DAL.Repositories.UserRepository
{
    public interface IUserRepository
    {
        IReadOnlyCollection<MyMDbUser> GetAll();
        Task<MyMDbUser?> Get(int id);
        Task<MyMDbUser?> GetExtended(int id); 
        Task<MyMDbUser?> Get(string username);
        Task<MyMDbUser?> GetExtended(string username);
        Task<MyMDbUser?> Insert(MyMDbUserCreateDto value);
        Task<MyMDbUser?> Update(int id, MyMDbUserUpdateDto value);
        Task<MyMDbUser?> Delete(int id);
    }
}
