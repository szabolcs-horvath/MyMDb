using MyMDb.Server.DAL.Entities;
using MyMDb.Shared.DTOs.Rating;

namespace MyMDb.Server.DAL.Repositories.RatingRepository
{
    public class RatingRepository : IRatingRepository
    {
        private readonly MyMDbDbContext _db;

        public RatingRepository(MyMDbDbContext db)
        {
            _db = db;
        }

        public async Task<Rating?> Get(int id)
        {
            var result = await _db.Rating.FindAsync(id);

            return result;
        }

        public async Task<Rating?> GetExtended(int id)
        {
            var dbRecord = await _db.Rating
                .Include(r => r.Movie)
                .Include(r => r.MyMDbUser)
                .FirstOrDefaultAsync(r => r.Id == id);

            return dbRecord;
        }

        public async Task<ICollection<Rating>> GetAllForMovie(int movieId)
        {
            var result = await _db.Rating
                .Include(r => r.MyMDbUser)
                .Where(r => r.MovieId == movieId)
                .ToListAsync();

            return result;
        }

        public async Task<ICollection<Rating>> GetAllForUser(int userId)
        {
            var result = await _db.Rating
                .Include(r => r.Movie)
                .Where(r => r.MyMDbUserId == userId)
                .ToListAsync();

            return result;
        }

        public async Task<Rating?> Insert(RatingCreateDto value)
        {
            var toInsert = new Rating
            {
                MovieId = value.MovieId,
                MyMDbUserId = value.MyMDbUserId,
                Score = value.Score
            };

            await _db.Rating.AddAsync(toInsert);
            await _db.SaveChangesAsync();
            var result = await _db.Rating
                .FindAsync(toInsert.Id);

            return result;
        }

        public async Task<Rating?> Update(int id, RatingUpdateDto value)
        {
            var dbRecord = await _db.Rating.FindAsync(id);

            if (dbRecord is null)
            {
                return null;
            }

            dbRecord.MovieId = value.MovieId ?? dbRecord.MovieId;
            dbRecord.MyMDbUserId = value.MyMDbUserId ?? dbRecord.MyMDbUserId;
            dbRecord.Score = value.Score ?? dbRecord.Score;

            await _db.SaveChangesAsync();

            return dbRecord;
        }

        public async Task<Rating?> Delete(int id)
        {
            var result = await _db.Rating.FindAsync(id);

            if (result is null)
            {
                return null;
            }
            
            _db.Remove(result);
            await _db.SaveChangesAsync();

            return result;
        }
    }
}
