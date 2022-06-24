using MyMDb.Server.DAL.Entities;
using MyMDb.Shared.DTOs.Movie;

namespace MyMDb.Server.DAL.Repositories.MovieRepository
{
    public interface IMovieRepository
    {
        //Has to be synchronous, otherwise serialization throws weird errors
        ICollection<Movie> GetAll();
        Task<Movie?> Get(int id);
        Task<Movie?> GetExtended(int id);
        Task<Movie?> Insert(MovieCreateDto value);
        Task<Movie?> Update(int id, MovieUpdateDto value);
        Task<Movie?> Delete(int id);
        Task<IReadOnlyCollection<Movie>> SearchByTitle(string title);
    }
}
