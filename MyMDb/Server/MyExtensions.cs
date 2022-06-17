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
                People = value.Person.Select(p => p.ToBasicResponse()),
                Ratings = value.Ratings.Select(r => r.ToBasicResponse()),
                Reviews = value.Reviews.Select(r => r.ToBasicResponse())
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
                Movies = value.Movie.Select(m => m.ToBasicResponse())
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
                Movie = value.Movie.ToBasicResponse()
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
                Movie = value.Movie.ToBasicResponse()
            };
        }

        public static MovieBasicResponse ToBasicResponse(this Movie value)
        {
            return new MovieBasicResponse
            {
                Id = value.Id,
                Title = value.Title
            };
        }

        public static PersonBasicResponse ToBasicResponse(this Person value)
        {
            return new PersonBasicResponse
            {
                Id = value.Id,
                FullName = value.FullName
            };
        }

        public static RatingBasicResponse ToBasicResponse(this Rating value)
        {
            return new RatingBasicResponse
            {
                Id = value.Id,
                MovieId = value.MovieId,
                UserId = value.UserId,
                Score = value.Score
            };
        }

        public static ReviewBasicResponse ToBasicResponse(this Review value)
        {
            return new ReviewBasicResponse
            {
                Id = value.Id,
                MovieId = value.MovieId,
                UserId = value.UserId,
                Headline = value.Headline,
                Description = value.Description,
                Spoiler = value.Spoiler
            };
        }
    }
}
