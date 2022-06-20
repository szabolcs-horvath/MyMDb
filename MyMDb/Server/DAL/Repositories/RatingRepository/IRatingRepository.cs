using MyMDb.Server.DAL.Entities;
using MyMDb.Shared.DTOs.Rating;

namespace MyMDb.Server.DAL.Repositories.RatingRepository
{
    public interface IRatingRepository
    {
        Task<Rating?> Get(int id);
        Task<Rating?> GetExtended(int id);
        Task<ICollection<Rating>> GetAllForMovie(int movieId);
        Task<ICollection<Rating>> GetAllForUser(int userId);
        Task<Rating?> Insert(RatingCreateDto value);
        Task<Rating?> Update(int id, RatingUpdateDto value);
        Task<Rating?> Delete(int id);
    }
}
