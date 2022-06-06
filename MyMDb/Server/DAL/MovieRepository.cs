using Microsoft.EntityFrameworkCore;
using MyMDb.Shared.CreateModel;
using MyMDb.Shared.SearchModel;
using MyMDb.Server.DAL.Entities;

namespace MyMDb.Server.DAL
{
    public class MovieRepository : IMovieRepository
    {
        private readonly MyMDbDbContext _db;

        public MovieRepository(MyMDbDbContext db)
        {
            this._db = db;
        }

        public async Task<Movie?> Delete(int id)
        {
            var dbRecord = await _db.Movie.Include(m => m.Person).FirstOrDefaultAsync(x => x.Id == id);
            if (dbRecord != null)
            {
                _db.Remove(dbRecord);
                await _db.SaveChangesAsync();
            }
            return dbRecord == null ? null : ToModel(dbRecord);
        }

        public async Task<Movie?> Get(int id)
        {
            var dbRecord = await _db.Movie.Include(m => m.Person).FirstOrDefaultAsync(x => x.Id == id);
            return dbRecord == null ? null : ToModel(dbRecord);
        }

        public IReadOnlyCollection<Movie> GetAll()
        {
            return _db.Movie.Include(m => m.Person).Select(ToModel).ToList();
        }

        public async Task<Movie> Insert(CreateMovie value)
        {
            var toInsert = new DbMovie()
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
            var result = await _db.Movie.Include(m => m.Person).FirstOrDefaultAsync(m => m.Id == toInsert.Id);

            return ToModel(result ?? toInsert);
        }

        public async Task<IReadOnlyCollection<SearchMovie>> SearchByTitle(string name)
        {
            return await _db.Movie.Where(m => m.Title != null && m.Title.Contains(name)).Select(m => ToSearchModel(m)).ToListAsync();
        }

        public async Task<Movie?> Update(Movie value)
        {
            var dbRecord = await _db.Movie.Include(m => m.Person).FirstOrDefaultAsync(x => x.Id == value.Id);
            if (dbRecord == null)
            {
                return null;
            } else
            {
                dbRecord.YourRating = value.YourRating ?? 0;
                dbRecord.DateRated = value.DateRated ?? "";
                dbRecord.Title = value.Title;
                dbRecord.URL = value.URL;
                dbRecord.TitleType = value.TitleType;
                dbRecord.IMDbRating = value.IMDbRating;
                dbRecord.Runtimemins = value.Runtimemins;
                dbRecord.Year = value.Year;
                if (value.Genres != null) dbRecord.Genres = string.Join(", ", value.Genres);
                dbRecord.ReleaseDate = value.ReleaseDate;
                if (value.Directors != null) dbRecord.Directors = string.Join(", ", value.Directors);
                if (value.Cast != null) dbRecord.Cast = string.Join(", ", value.Cast);

                await _db.SaveChangesAsync();
            }

            return ToModel(dbRecord);
        }

        private static Movie ToModel(DbMovie value)
        {
            if (value is null)
            {
                throw new ArgumentNullException(nameof(value));
            }

            return new Movie
            {
                Id = value.Id,
                YourRating = value.YourRating,
                DateRated = value.DateRated?.Trim(),
                Title = value.Title ?? throw new InvalidOperationException(),
                URL = value.URL ?? throw new InvalidOperationException(),
                TitleType = value.TitleType ?? throw new InvalidOperationException(),
                IMDbRating = value.IMDbRating ?? throw new InvalidOperationException(),
                Runtimemins = value.Runtimemins ?? throw new InvalidOperationException(),
                Year = value.Year ?? throw new InvalidOperationException(),
                Genres = value.Genres?.Split(",").Select(s => s.Trim()).ToList() ?? throw new InvalidOperationException(),
                ReleaseDate = value.ReleaseDate ?? throw new InvalidOperationException(),
                Directors = value.Directors?.Split(",").Select(s => s.Trim()).ToList(),
                Cast = value.Cast?.Split(",").Select(s => s.Trim()).ToList(),
                People = value.Person.Select(p => p.FullName ?? "")
            };
        }

        private static SearchMovie ToSearchModel(DbMovie value)
        {
            if (value.Title is null)
            {
                throw new ArgumentNullException(nameof(value));
            }

            return new SearchMovie(value.Id, value.Title);
        }
    }
}
