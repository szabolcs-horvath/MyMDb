using MyMDb.Server.DAL.Entities;
using MyMDb.Shared.DTOs;

namespace MyMDb.Server.DAL.Repositories.ReviewRepository
{
    public interface IReviewRepository
    {
        Task<Review?> Get(int id);
        Task<ICollection<Review>> GetAllForMovie(int movieId);
        Task<ICollection<Review>> GetAllForUser(int userId);
        Task<Review?> Insert(Review value);
        Task<Review?> Update(ReviewUpdateDto value);
        Task<Review?> Delete(int id);
    }
}
