using MyMDb.Shared.CreateModel;

namespace MyMDb.Server.DAL
{
    public interface IMovieRepository
    {
        IReadOnlyCollection<Movie> GetAll();
        Task<Movie?> Get(int id);
        Task<Movie> Insert(CreateMovie value);
        Task<Movie?> Update(Movie value);
        Task<Movie?> Delete(int id);
    }
}
