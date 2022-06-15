using MyMDb.Shared.CreateModel;
using MyMDb.Shared.SearchModel;
using MyMDb.Server.DAL.Entities;
using MyMDb.Shared.DTOs;

namespace MyMDb.Server.DAL.Repositories
{
    public class MovieRepository : IMovieRepository
    {
        private readonly MyMDbDbContext _db;

        public MovieRepository(MyMDbDbContext db)
        {
            _db = db;
        }

        public async Task<MovieDto?> Delete(int id)
        {
            var dbRecord = await _db.Movie
                .Include(m => m.Person)
                .FirstOrDefaultAsync(x => x.Id == id);

            if (dbRecord != null)
            {
                _db.Remove(dbRecord);
                await _db.SaveChangesAsync();
            }

            return dbRecord?.ToDto();
        }

        public async Task<MovieDto?> Get(int id)
        {
            var dbRecord = await _db.Movie
                .Include(m => m.Person)
                .FirstOrDefaultAsync(x => x.Id == id);

            return dbRecord?.ToDto();
        }

        public async Task<IReadOnlyCollection<MovieDto>> GetAll()
        {
            return await _db.Movie
                .Include(m => m.Person)
                .Select(m => m.ToDto())
                .ToListAsync();
        }

        public async Task<MovieDto> Insert(CreateMovie value)
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
            var result = await _db.Movie
                .Include(m => m.Person)
                .FirstOrDefaultAsync(m => m.Id == toInsert.Id);

            return result?.ToDto() ?? toInsert.ToDto();
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

        public async Task<MovieDto?> Update(MovieDto value)
        {
            var dbRecord = await _db.Movie
                .Include(m => m.Person)
                .FirstOrDefaultAsync(x => x.Id == value.Id);
            
            if (dbRecord == null)
            {
                return null;
            }

            dbRecord.YourRating = value.YourRating ?? 0;
            dbRecord.DateRated = value.DateRated ?? "";
            dbRecord.Title = value.Title;
            dbRecord.URL = value.URL;
            dbRecord.TitleType = value.TitleType;
            dbRecord.IMDbRating = value.IMDbRating;
            dbRecord.Runtimemins = value.Runtimemins;
            dbRecord.Year = value.Year;
            dbRecord.Genres = string.Join(", ", value.Genres);
            dbRecord.ReleaseDate = value.ReleaseDate;
            if (value.Directors != null) dbRecord.Directors = string.Join(", ", value.Directors);
            if (value.Cast != null) dbRecord.Cast = string.Join(", ", value.Cast);

            await _db.SaveChangesAsync();

            return dbRecord.ToDto();
        }
    }
}
