namespace MyMDb.Shared.DTOs
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
