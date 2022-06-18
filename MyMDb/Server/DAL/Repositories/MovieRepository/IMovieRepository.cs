using MyMDb.Server.DAL.Entities;
using MyMDb.Shared.CreateModel;
using MyMDb.Shared.DTOs.Movie;
using MyMDb.Shared.SearchModel;

namespace MyMDb.Server.DAL.Repositories.MovieRepository
{
    public interface IMovieRepository
    {
        //Has to be synchronous, otherwise serialization throws weird errors
        ICollection<Movie> GetAll();
        Task<Movie?> Get(int id);
        Task<Movie?> GetExtended(int id);
        Task<Movie?> Insert(CreateMovie value);
        Task<Movie?> Update(int id, MovieUpdateDto value);
        Task<Movie?> Delete(int id);
        Task<IReadOnlyCollection<SearchMovie>> SearchByTitle(string title);
    }
}
