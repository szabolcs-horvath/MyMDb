using MyMDb.Server.DAL.Entities;
using MyMDb.Shared.DTOs.MyMDbUser;
using MyMDb.Shared.ResponseModel.Movie;
using MyMDb.Shared.ResponseModel.MyMDbRole;
using MyMDb.Shared.ResponseModel.MyMDbUser;
using MyMDb.Shared.ResponseModel.Person;
using MyMDb.Shared.ResponseModel.Rating;
using MyMDb.Shared.ResponseModel.Review;

namespace MyMDb.Server
{
    public static class MyExtensions
    {
        public static MyMDbUserResponse ToResponse(this MyMDbUser value)
        {
            return new MyMDbUserResponse
            {
                Id = value.Id,
                Username = value.Username,
                MyMDbRoleId = value.MyMDbRoleId,
                Ratings = value.Ratings.Select(r => r.ToBasicResponse()),
                Reviews = value.Reviews.Select(r => r.ToBasicResponse()),
                MyMDbRole = value.MyMDbRole.ToBasicResponse()
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
                MyMDbUserId = value.MyMDbUserId,
                Score = value.Score,
                Movie = value.Movie.ToBasicResponse(),
                MyMDbUser = value.MyMDbUser.ToBasicResponse()
            };
        }

        public static ReviewResponse ToResponse(this Review value)
        {
            return new ReviewResponse
            {
                Id = value.Id,
                MovieId = value.MovieId,
                MyMDbUserId = value.MyMDbUserId,
                Headline = value.Headline,
                Description = value.Description,
                Spoiler = value.Spoiler,
                Movie = value.Movie.ToBasicResponse(),
                MyMDbUser = value.MyMDbUser.ToBasicResponse()
            };
        }


        public static MyMDbUserBasicResponse ToBasicResponse(this MyMDbUser value)
        {
            return new MyMDbUserBasicResponse
            {
                Id = value.Id,
                Username = value.Username
            };
        }

        public static MyMDbRoleBasicResponse ToBasicResponse(this MyMDbRole value)
        {
            return new MyMDbRoleBasicResponse
            {
                Id = value.Id,
                Rolename = value.Rolename
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
                MyMDbUserId = value.MyMDbUserId,
                Score = value.Score
            };
        }

        public static ReviewBasicResponse ToBasicResponse(this Review value)
        {
            return new ReviewBasicResponse
            {
                Id = value.Id,
                MovieId = value.MovieId,
                MyMDbUserId = value.MyMDbUserId,
                Headline = value.Headline,
                Description = value.Description,
                Spoiler = value.Spoiler
            };
        }
    }
}
