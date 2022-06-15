using MyMDb.Shared.CreateModel;
using MyMDb.Shared.DTOs;
using MyMDb.Shared.SearchModel;

namespace MyMDb.Server.DAL.Repositories.MovieRepository
{
    public interface IMovieRepository
    {
        Task<IReadOnlyCollection<MovieDto>> GetAll();
        Task<MovieDto?> Get(int id);
        Task<MovieDto> Insert(CreateMovie value);
        Task<MovieDto?> Update(MovieDto value);
        Task<MovieDto?> Delete(int id);
        Task<IReadOnlyCollection<SearchMovie>> SearchByTitle(string title);
    }
}
