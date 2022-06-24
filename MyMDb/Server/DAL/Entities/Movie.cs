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

        public ICollection<Person> Person { get; set; }
        public ICollection<Rating> Ratings { get; set; }
        public ICollection<Review> Reviews { get; set; }

        public MovieResponse ToResponse()
        {
            return new MovieResponse
            {
                Id = Id,
                Title = Title,
                URL = URL,
                TitleType = TitleType,
                IMDbRating = IMDbRating,
                Runtimemins = Runtimemins,
                Year = Year,
                Genres = Genres.Split(",").Select(s => s.Trim()).ToList(),
                ReleaseDate = ReleaseDate,
                Directors = Directors?.Split(",").Select(s => s.Trim()).ToList(),
                Cast = Cast?.Split(",").Select(s => s.Trim()).ToList(),
                People = Person?.Select(p => p.ToBasicResponse()),
                Ratings = Ratings?.Select(r => r.ToBasicResponse()),
                Reviews = Reviews?.Select(r => r.ToBasicResponse())
            };
        }

        public MovieBasicResponse ToBasicResponse()
        {
            return new MovieBasicResponse
            {
                Id = Id,
                Title = Title,
                URL = URL,
                TitleType = TitleType,
                IMDbRating = IMDbRating,
                Runtimemins = Runtimemins,
                Year = Year,
                Genres = Genres.Split(",").Select(s => s.Trim()).ToList(),
                ReleaseDate = ReleaseDate,
                Directors = Directors?.Split(",").Select(s => s.Trim()).ToList(),
                Cast = Cast?.Split(",").Select(s => s.Trim()).ToList()
            };
        }
    }
}
