using MyMDb.Server.DAL.Entities;
using MyMDb.Shared.DTOs;

namespace MyMDb.Server.DAL.Repositories.RatingRepository
{
    public interface IRatingRepository
    {
        Task<Rating?> Get(int id);
        Task<ICollection<Rating>> GetAllForMovie(int movieId);
        Task<ICollection<Rating>> GetAllForUser(int userId);
        Task<Rating?> Insert(Rating value);
        Task<Rating?> Update(RatingUpdateDto value);
        Task<Rating?> Delete(int id);
    }
}
