using MyMDb.Server.DAL.Entities;
using MyMDb.Shared.DTOs;

namespace MyMDb.Server
{
    public static class MyExtensions
    {
        public static UserDto ToDto(this User value)
        {
            return new UserDto
            {
                Id = value.Id,
                Username = value.Username,
                PasswordHash = value.PasswordHash,
                PasswordSalt = value.PasswordSalt
            };
        }

        public static PersonResponse ToResponse(this Person value)
        {
            return new PersonResponse
            {
                Id = value.Id,
                FullName = value.FullName,
                Birthdate = value.Birthdate,
                Birthplace = value.Birthplace,
                Movies = value.Movie.Select(m => m.ToBasic()) // Ez Cycle-t okoz
            };
        }

        public static MovieResponse ToResponse(this Movie value)
        {
            return new MovieResponse
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
                People = value.Person.Select(p => p.ToBasic()), // Ez Cycle-t okoz
                Ratings = value.Ratings.Select(r => r.ToResponse()),
                Reviews = value.Reviews.Select(r => r.ToResponse())
            };
        }

        public static RatingResponse ToResponse(this Rating value)
        {
            return new RatingResponse
            {
                Id = value.Id,
                MovieId = value.MovieId,
                UserId = value.UserId,
                Score = value.Score,
                Movie = value.Movie.ToResponse()
            };
        }

        public static ReviewResponse ToResponse(this Review value)
        {
            return new ReviewResponse
            {
                Id = value.Id,
                MovieId = value.MovieId,
                UserId = value.UserId,
                Headline = value.Headline,
                Description = value.Description,
                Spoiler = value.Spoiler,
                Movie = value.Movie.ToResponse()
            };
        }

        public static MovieBasic ToBasic(this Movie value)
        {
            return new MovieBasic
            {
                Id = value.Id,
                Title = value.Title
            };
        }

        public static PersonBasic ToBasic(this Person value)
        {
            return new PersonBasic
            {
                Id = value.Id,
                FullName = value.FullName
            };
        }
    }
}
