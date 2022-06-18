namespace MyMDb.Shared.DTOs
{
    public class RatingBasicResponse
    {
        public int Id { get; set; }
        public int MovieId { get; set; }
        public int MyMDbUserId { get; set; }
        public int Score { get; set; }
    }
}
