using MyMDb.Server.DAL.Entities;
using MyMDb.Shared.DTOs.Review;

namespace MyMDb.Server.DAL.Repositories.ReviewRepository
{
    public interface IReviewRepository
    {
        Task<Review?> Get(int id);
        Task<Review?> GetExtended(int id);
        Task<ICollection<Review>> GetAllForMovie(int movieId);
        Task<ICollection<Review>> GetAllForUser(int userId);
        Task<Review?> Insert(Review value);
        Task<Review?> Update(int id, ReviewUpdateDto value);
        Task<Review?> Delete(int id);
    }
}
