using MyMDb.Shared.ResponseModel.Review;

namespace MyMDb.Server.DAL.Entities
{
    public class Review
    {
        public int Id { get; set; }
        public int MovieId { get; set; }
        public int MyMDbUserId { get; set; }
        public string Headline { get; set; }
        public string Description { get; set; }
        public bool Spoiler { get; set; }

        public Movie Movie { get; set; }
        public MyMDbUser MyMDbUser { get; set; }

        public ReviewResponse ToResponse()
        {
            return new ReviewResponse
            {
                Id = Id,
                MovieId = MovieId,
                MyMDbUserId = MyMDbUserId,
                Headline = Headline,
                Description = Description,
                Spoiler = Spoiler,
                Movie = Movie?.ToBasicResponse(),
                MyMDbUser = MyMDbUser?.ToBasicResponse()
            };
        }

        public ReviewBasicResponse ToBasicResponse()
        {
            return new ReviewBasicResponse
            {
                Id = Id,
                MovieId = MovieId,
                MyMDbUserId = MyMDbUserId,
                Headline = Headline,
                Description = Description,
                Spoiler = Spoiler
            };
        }
    }
}
