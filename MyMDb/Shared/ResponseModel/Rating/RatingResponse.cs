using MyMDb.Shared.ResponseModel.Movie;
using MyMDb.Shared.ResponseModel.MyMDbUser;

namespace MyMDb.Shared.ResponseModel.Rating
{
    public class RatingResponse
    {
        public int Id { get; set; }
        public int MovieId { get; set; }
        public int MyMDbUserId { get; set; }
        public int Score { get; set; }

        public MovieBasicResponse Movie { get; set; }
        public MyMDbUserBasicResponse MyMDbUser { get; set; }
    }
}
