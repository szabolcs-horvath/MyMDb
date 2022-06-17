using MyMDb.Server.DAL.Entities;
using MyMDb.Shared.CreateModel;
using MyMDb.Shared.DTOs;
using MyMDb.Shared.SearchModel;

namespace MyMDb.Server.DAL.Repositories.MovieRepository
{
    public interface IMovieRepository
    {
        //Has to be synchronous, otherwise serialization throws weird errors
        IReadOnlyCollection<MovieDto> GetAll();
        Task<Movie?> Get(int id);
        Task<MovieDto?> GetExtended(int id);
        Task<MovieDto?> Insert(CreateMovie value);
        Task<MovieDto?> Update(MovieDto value);
        Task<MovieDto?> Delete(int id);
        Task<IReadOnlyCollection<SearchMovie>> SearchByTitle(string title);
    }
}
