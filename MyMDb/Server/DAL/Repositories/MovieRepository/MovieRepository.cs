using MyMDb.Shared.CreateModel;
using MyMDb.Shared.SearchModel;
using MyMDb.Server.DAL.Entities;
using MyMDb.Shared.DTOs.Movie;

namespace MyMDb.Server.DAL.Repositories.MovieRepository
{
    public class MovieRepository : IMovieRepository
    {
        private readonly MyMDbDbContext _db;

        public MovieRepository(MyMDbDbContext db)
        {
            _db = db;
        }

        public ICollection<Movie> GetAll()
        {
            var result = _db.Movie
                .ToList();

            return result;
        }

        public async Task<Movie?> Get(int id)
        {
            var dbRecord = await _db.Movie.FindAsync(id);

            return dbRecord;
        }

        public async Task<Movie?> GetExtended(int id)
        {
            var dbRecord = await _db.Movie
                .Include(m => m.Person)
                .Include(m => m.Ratings).ThenInclude(r => r.MyMDbUser)
                .Include(m => m.Reviews).ThenInclude(r => r.MyMDbUser)
                .FirstOrDefaultAsync(x => x.Id == id);

            return dbRecord;
        }

        public async Task<Movie?> Insert(CreateMovie value)
        {
            var toInsert = new Movie()
            {
                YourRating = value.YourRating,
                DateRated = value.DateRated,
                Title = value.Title,
                URL = value.URL,
                TitleType = value.TitleType,
                IMDbRating = value.IMDbRating,
                Runtimemins = value.Runtimemins,
                Year = value.Year,
                Genres = value.Genres,
                ReleaseDate = value.ReleaseDate,
                Directors = value.Directors ?? "",
                Cast = value.Cast ?? ""
            };

            await _db.Movie.AddAsync(toInsert);
            await _db.SaveChangesAsync();
            var result = await _db.Movie.FindAsync(toInsert.Id);

            return result;
        }

        public async Task<Movie?> Update(int id, MovieUpdateDto value)
        {
            var dbRecord = await _db.Movie.FindAsync(id);

            if (dbRecord == null)
            {
                return null;
            }

            dbRecord.YourRating = value.YourRating ?? dbRecord.YourRating;
            dbRecord.DateRated = value.DateRated ?? dbRecord.DateRated;
            dbRecord.Title = value.Title ?? dbRecord.Title;
            dbRecord.URL = value.URL ?? dbRecord.URL;
            dbRecord.TitleType = value.TitleType ?? dbRecord.TitleType;
            dbRecord.IMDbRating = value.IMDbRating ?? dbRecord.IMDbRating;
            dbRecord.Runtimemins = value.Runtimemins ?? dbRecord.Runtimemins;
            dbRecord.Year = value.Year ?? dbRecord.Year;
            if (value.Genres is not null)
            {
                dbRecord.Genres = string.Join(", ", value.Genres);
            }
            dbRecord.ReleaseDate = value.ReleaseDate ?? dbRecord.ReleaseDate;
            if (value.Directors is not null)
            {
                dbRecord.Directors = string.Join(", ", value.Directors);
            }
            if (value.Cast is not null)
            {
                dbRecord.Cast = string.Join(", ", value.Cast);
            }

            await _db.SaveChangesAsync();

            return dbRecord;
        }

        public async Task<Movie?> Delete(int id)
        {
            var dbRecord = await _db.Movie.FindAsync(id);

            if (dbRecord != null)
            {
                _db.Remove(dbRecord);
                await _db.SaveChangesAsync();
            }

            return dbRecord;
        }

        public async Task<IReadOnlyCollection<SearchMovie>> SearchByTitle(string title)
        {
            return await _db.Movie
                .Where(m => m.Title.Contains(title))
                .Select(m => new SearchMovie
                {
                    Id = m.Id,
                    Title = m.Title
                })
                .ToListAsync();
        }
    }
}
