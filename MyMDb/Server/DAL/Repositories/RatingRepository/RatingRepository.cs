using MyMDb.Server.DAL.Entities;
using MyMDb.Shared.DTOs;

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
            var result = await _db.Rating
                .Include(r => r.Movie)
                .Include(r => r.User)
                .FirstOrDefaultAsync(r => r.Id == id);

            return result;
        }

        public async Task<ICollection<Rating>> GetAllForMovie(int movieId)
        {
            var result = await _db.Rating
                .Include(r => r.User)
                .Where(r => r.MovieId == movieId)
                .ToListAsync();

            return result;
        }

        public async Task<ICollection<Rating>> GetAllForUser(int userId)
        {
            var result = await _db.Rating
                .Include(r => r.Movie)
                .Where(r => r.UserId == userId)
                .ToListAsync();

            return result;
        }

        public async Task<Rating?> Insert(Rating value)
        {
            var toInsert = new Rating
            {
                MovieId = value.MovieId,
                UserId = value.UserId,
                Score = value.Score
            };

            await _db.Rating.AddAsync(toInsert);
            await _db.SaveChangesAsync();
            var result = await _db.Rating
                .Include(r => r.Movie)
                .Include(r => r.User)
                .FirstOrDefaultAsync(r => r.Id == toInsert.Id);

            return result;
        }

        public async Task<Rating?> Update(RatingUpdateDto value)
        {
            var dbRecord = await _db.Rating.FindAsync(value.Id);

            if (dbRecord is null)
            {
                return null;
            }

            dbRecord.MovieId = value.MovieId;
            dbRecord.UserId = value.UserId;
            dbRecord.Score = value.Score;

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
