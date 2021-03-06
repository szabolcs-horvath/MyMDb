using MyMDb.Shared.ResponseModel.Movie;
using MyMDb.Shared.ResponseModel.MyMDbUser;

namespace MyMDb.Shared.ResponseModel.Review
{
    public class ReviewResponse
    {
        public int Id { get; set; }
        public int MovieId { get; set; }
        public int MyMDbUserId { get; set; }
        public string Headline { get; set; }
        public string Description { get; set; }
        public bool Spoiler { get; set; }
        public MovieBasicResponse? Movie { get; set; }
        public MyMDbUserBasicResponse? MyMDbUser { get; set; }
    }
}
