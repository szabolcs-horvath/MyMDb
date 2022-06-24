using MyMDb.Shared.ResponseModel.Rating;

namespace MyMDb.Server.DAL.Entities
{
    public class Rating
    {
        public int Id { get; set; }
        public int MovieId { get; set; }
        public int MyMDbUserId { get; set; }
        public int Score { get; set; }

        public Movie Movie { get; set; }
        public MyMDbUser MyMDbUser { get; set; }

        public RatingResponse ToResponse()
        {
            return new RatingResponse
            {
                Id = Id,
                MovieId = MovieId,
                MyMDbUserId = MyMDbUserId,
                Score = Score,
                Movie = Movie?.ToBasicResponse(),
                MyMDbUser = MyMDbUser?.ToBasicResponse()
            };
        }

        public RatingBasicResponse ToBasicResponse()
        {
            return new RatingBasicResponse
            {
                Id = Id,
                MovieId = MovieId,
                MyMDbUserId = MyMDbUserId,
                Score = Score
            };
        }
    }
}
