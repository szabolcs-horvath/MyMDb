using MyMDb.Shared.DTOs;

namespace MyMDb.Server.DAL.Repositories.UserRepository
{
    public class UserRepository : IUserRepository
    {
        private readonly MyMDbDbContext _db;

        public UserRepository(MyMDbDbContext db)
        {
            _db = db;
        }

        public async Task<MyMDbUserDto?> Get(int id)
        {
            var result = await _db.MyMDbUser.FindAsync(id);

            return result?.ToDto();
        }

        public async Task<MyMDbUser?> GetExtended(int id)
        {
            var dbRecord = await _db.MyMDbUser
                .Include(u => u.Ratings)
                .Include(u => u.Reviews)
                .FirstOrDefaultAsync(u => u.Id == id);

            return dbRecord;
        }

        public async Task<MyMDbUserDto?> Get(string username)
        {
            var result = await _db.MyMDbUser.FirstOrDefaultAsync(u => u.Username == username);

            return result?.ToDto();
        }

        public async Task<MyMDbUserDto> Insert(MyMDbUserDto value)
        {
            var toInsert = new MyMDbUser
            {
                Username = value.Username,
                PasswordHash = value.PasswordHash,
                PasswordSalt = value.PasswordSalt,
                MyMDbRoleId = value.MyMDbRoleId
            };

            await _db.MyMDbUser.AddAsync(toInsert);
            await _db.SaveChangesAsync();
            var result = await _db.MyMDbUser.FirstOrDefaultAsync(u => u.Username == toInsert.Username);

            return result?.ToDto() ?? toInsert.ToDto();
        }

        public async Task<MyMDbUserDto?> Update(MyMDbUserDto value)
        {
            var dbRecord = await _db.MyMDbUser.FindAsync(value.Id);

            if (dbRecord is null)
            {
                return null;
            }

            dbRecord.Username = value.Username;
            dbRecord.PasswordHash = value.PasswordHash;
            dbRecord.PasswordSalt = value.PasswordSalt;

            await _db.SaveChangesAsync();

            return dbRecord.ToDto();
        }

        public async Task<MyMDbUserDto?> Delete(int id)
        {
            var result = await _db.MyMDbUser.FindAsync(id);

            if (result is null)
            {
                return null;
            }

            _db.Remove(result);
            await _db.SaveChangesAsync();

            return result?.ToDto();
        }
    }
}
