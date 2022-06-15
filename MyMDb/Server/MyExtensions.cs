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

        public static PersonDto ToDto(this Person value)
        {
            return new PersonDto
            {
                Id = value.Id,
                FullName = value.FullName,
                Birthdate = value.Birthdate,
                Birthplace = value.Birthplace,
                Movies = value.Movie.Select(m => m.Title ?? "")
            };
        }

        public static MovieDto ToDto(this Movie value)
        {
            return new MovieDto
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
