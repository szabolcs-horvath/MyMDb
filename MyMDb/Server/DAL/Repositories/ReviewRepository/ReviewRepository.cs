using MyMDb.Server.DAL.Entities;
using MyMDb.Shared.DTOs;

namespace MyMDb.Server.DAL.Repositories.ReviewRepository
{
    public class ReviewRepository : IReviewRepository
    {
        private readonly MyMDbDbContext _db;

        public ReviewRepository(MyMDbDbContext db)
        {
            _db = db;
        }

        public async Task<Review?> Get(int id)
        {
            var result = await _db.Review.FindAsync(id);

            return result;
        }

        public async Task<Review?> GetExtended(int id)
        {
            var dbRecord = await _db.Review
                .Include(r => r.Movie)
                .Include(r => r.MyMDbUser)
                .FirstOrDefaultAsync(r => r.Id == id);

            return dbRecord;
        }

        public async Task<ICollection<Review>> GetAllForMovie(int movieId)
        {
            var result = await _db.Review
                .Include(r => r.MyMDbUser)
                .Where(r => r.MovieId == movieId)
                .ToListAsync();

            return result;
        }

        public async Task<ICollection<Review>> GetAllForUser(int userId)
        {
            var result = await _db.Review
                .Include(r => r.Movie)
                .Where(r => r.MyMDbUserId == userId)
                .ToListAsync();

            return result;
        }

        public async Task<Review?> Insert(Review value)
        {
            var toInsert = new Review
            {
                MovieId = value.MovieId,
                MyMDbUserId = value.MyMDbUserId,
                Headline = value.Headline,
                Description = value.Description,
                Spoiler = value.Spoiler
            };

            await _db.AddAsync(toInsert);
            await _db.SaveChangesAsync();
            var result = await _db.Review.FindAsync(toInsert.Id);

            return result;
        }

        public async Task<Review?> Update(ReviewUpdateDto value)
        {
            var dbRecord = await _db.Review.FindAsync(value.Id);

            if (dbRecord is null)
            {
                return null;
            }

            dbRecord.MovieId = value.MovieId;
            dbRecord.MyMDbUserId = value.MyMDbUserId;
            dbRecord.Headline = value.Headline;
            dbRecord.Description = value.Description;
            dbRecord.Spoiler = value.Spoiler;

            await _db.SaveChangesAsync();

            return dbRecord;
        }

        public async Task<Review?> Delete(int id)
        {
            var result = await _db.Review.FindAsync(id);

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
