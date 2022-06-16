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

        public async Task<UserDto?> Get(int id)
        {
            var result = await _db.User.FindAsync(id);

            return result?.ToDto();
        }

        public async Task<UserDto?> Get(string username)
        {
            var result = await _db.User.FirstOrDefaultAsync(u => u.Username == username);

            return result?.ToDto();
        }

        public async Task<UserDto> Insert(UserDto value)
        {
            var toInsert = new User
            {
                Username = value.Username,
                PasswordHash = value.PasswordHash,
                PasswordSalt = value.PasswordSalt
            };

            await _db.User.AddAsync(toInsert);
            await _db.SaveChangesAsync();
            var result = await _db.User.FirstOrDefaultAsync(u => u.Username == toInsert.Username);

            return result?.ToDto() ?? toInsert.ToDto();
        }

        public async Task<UserDto?> Update(UserDto value)
        {
            var dbRecord = await _db.User.FindAsync(value.Id);

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

        public async Task<UserDto?> Delete(int id)
        {
            var result = await _db.User.FindAsync(id);

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
