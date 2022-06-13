using MyMDb.Shared.CreateModel;
using MyMDb.Shared.SearchModel;
using MyMDb.Server.DAL.Entities;

namespace MyMDb.Server.DAL.Repositories
{
    public class MovieRepository : IMovieRepository
    {
        private readonly MyMDbDbContext _db;

        public MovieRepository(MyMDbDbContext db)
        {
            _db = db;
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

        public async Task<IReadOnlyCollection<SearchMovie>> SearchByTitle(string title)
        {
            return await _db.Movie.Where(m => m.Title.Contains(title)).Select(m => new SearchMovie(m.Id, m.Title)).ToListAsync();
        }

        public async Task<Movie?> Update(Movie value)
        {
            var dbRecord = await _db.Movie.Include(m => m.Person).FirstOrDefaultAsync(x => x.Id == value.Id);
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
                Title = value.Title,
                URL = value.URL,
                TitleType = value.TitleType,
                IMDbRating = value.IMDbRating,
                Runtimemins = value.Runtimemins,
                Year = value.Year,
                Genres = value.Genres.Split(",").Select(s => s.Trim()).ToList(),
                ReleaseDate = value.ReleaseDate,
                Directors = value.Directors?.Split(",").Select(s => s.Trim()).ToList(),
                Cast = value.Cast?.Split(",").Select(s => s.Trim()).ToList(),
                People = value.Person.Select(p => p.FullName ?? "")
            };
        }
    }
}
