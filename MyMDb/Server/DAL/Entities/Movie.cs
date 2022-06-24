using MyMDb.Shared.ResponseModel.Movie;

namespace MyMDb.Server.DAL.Entities
{
    public class Movie
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string URL { get; set; }
        public string TitleType { get; set; }
        public double IMDbRating { get; set; }
        public int Runtimemins { get; set; }
        public int Year { get; set; }
        public string Genres { get; set; }
        public string? ReleaseDate { get; set; }
        public string? Directors { get; set; }
        public string? Cast { get; set; }

        public ICollection<Person>? Person { get; set; }
        public ICollection<Rating>? Ratings { get; set; }
        public ICollection<Review>? Reviews { get; set; }

        public MovieResponse ToResponse()
        {
            return new MovieResponse
            {
                Id = this.Id,
                Title = this.Title,
                URL = this.URL,
                TitleType = this.TitleType,
                IMDbRating = this.IMDbRating,
                Runtimemins = this.Runtimemins,
                Year = this.Year,
                Genres = this.Genres.Split(",").Select(s => s.Trim()).ToList(),
                ReleaseDate = this.ReleaseDate,
                Directors = this.Directors?.Split(",").Select(s => s.Trim()).ToList(),
                Cast = this.Cast?.Split(",").Select(s => s.Trim()).ToList(),
                People = this.Person?.Select(p => p.ToBasicResponse()),
                Ratings = this.Ratings?.Select(r => r.ToBasicResponse()),
                Reviews = this.Reviews?.Select(r => r.ToBasicResponse())
            };
        }

        public MovieBasicResponse ToBasicResponse()
        {
            return new MovieBasicResponse
            {
                Id = this.Id,
                Title = this.Title,
                URL = this.URL,
                TitleType = this.TitleType,
                IMDbRating = this.IMDbRating,
                Runtimemins = this.Runtimemins,
                Year = this.Year,
                Genres = this.Genres.Split(",").Select(s => s.Trim()).ToList(),
                ReleaseDate = this.ReleaseDate,
                Directors = this.Directors?.Split(",").Select(s => s.Trim()).ToList(),
                Cast = this.Cast?.Split(",").Select(s => s.Trim()).ToList()
            };
        }
    }
}
