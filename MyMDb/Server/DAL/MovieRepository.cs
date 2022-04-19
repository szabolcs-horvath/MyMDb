using Microsoft.EntityFrameworkCore;
using MyMDb.Server.Controllers.CreateModel;
using System.Globalization;

namespace MyMDb.Server.DAL
{
    public class MovieRepository : IMovieRepository
    {
        private readonly MyMDbDbContext db;

        public MovieRepository(MyMDbDbContext db)
        {
            this.db = db;
        }

        public async Task<Movie?> Delete(int id)
        {
            var dbRecord = await db.Movie.Include(m => m.Person).FirstOrDefaultAsync(x => x.Id == id);
            if (dbRecord != null)
            {
                db.Remove(dbRecord);
                await db.SaveChangesAsync();
            }
            return dbRecord == null ? null : ToModel(dbRecord);
        }

        public async Task<Movie?> Get(int id)
        {
            var dbRecord = await db.Movie.Include(m => m.Person).FirstOrDefaultAsync(x => x.Id == id);
            return dbRecord == null ? null : ToModel(dbRecord);
        }

        public IReadOnlyCollection<Movie> GetAll()
        {
            return db.Movie.Include(m => m.Person).Select(ToModel).ToList();
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

            await db.Movie.AddAsync(toInsert);
            await db.SaveChangesAsync();
            var result = await db.Movie.Include(m => m.Person).FirstOrDefaultAsync(m => m.Id == toInsert.Id);

            return ToModel(result ?? toInsert);
        }

        public async Task<Movie?> Update(Movie value)
        {
            var dbRecord = await db.Movie.Include(m => m.Person).FirstOrDefaultAsync(x => x.Id == value.Id);
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
                dbRecord.Genres = string.Join(", ", value.Genres);
                dbRecord.ReleaseDate = value.ReleaseDate;
                dbRecord.Directors = string.Join(", ", value.Directors);
                dbRecord.Cast = string.Join(", ", value.Cast);

                await db.SaveChangesAsync();
            }

            return ToModel(dbRecord);
        }

        private static Movie ToModel(DbMovie value)
        {
            if (value is null)
            {
                throw new ArgumentNullException(nameof(value));
            }

            return new Movie(
                value.Id,
                value.YourRating,
                value.DateRated?.Trim(),
                value.Title,
                value.URL,
                value.TitleType,
                value.IMDbRating,
                value.Runtimemins,
                value.Year,
                value.Genres?.Split(",").Select(s => s.Trim()).ToList(),
                value.ReleaseDate?.Trim(),
                value.Directors?.Split(",").Select(s => s.Trim()).ToList(),
                value.Cast?.Split(",").Select(s => s.Trim()).ToList(),
                value.Person?.Select(p => p.FullName ?? ""));
        }
    }
}
