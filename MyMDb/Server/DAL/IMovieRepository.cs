using MyMDb.Shared.CreateModel;
using MyMDb.Shared.SearchModel;

namespace MyMDb.Server.DAL
{
    public interface IMovieRepository
    {
        IReadOnlyCollection<Movie> GetAll();
        Task<Movie?> Get(int id);
        Task<Movie> Insert(CreateMovie value);
        Task<Movie?> Update(Movie value);
        Task<Movie?> Delete(int id);
        Task<IReadOnlyCollection<SearchMovie>> SearchByTitle(string name);
    }
}
