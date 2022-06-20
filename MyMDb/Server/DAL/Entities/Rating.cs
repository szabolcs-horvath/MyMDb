using MyMDb.Shared.ResponseModel.Rating;

namespace MyMDb.Server.DAL.Entities
{
    public class Rating
    {
        public int Id { get; set; }
        public int MovieId { get; set; }
        public int MyMDbUserId { get; set; }
        public int Score { get; set; }

        public Movie Movie { get; set; } = new Movie();
        public MyMDbUser MyMDbUser { get; set; } = new MyMDbUser();

        public RatingResponse ToResponse()
        {
            return new RatingResponse
            {
                Id = this.Id,
                MovieId = this.MovieId,
                MyMDbUserId = this.MyMDbUserId,
                Score = this.Score,
                Movie = this.Movie.ToBasicResponse(),
                MyMDbUser = this.MyMDbUser.ToBasicResponse()
            };
        }

        public RatingBasicResponse ToBasicResponse()
        {
            return new RatingBasicResponse
            {
                Id = this.Id,
                MovieId = this.MovieId,
                MyMDbUserId = this.MyMDbUserId,
                Score = this.Score
            };
        }
    }
}
