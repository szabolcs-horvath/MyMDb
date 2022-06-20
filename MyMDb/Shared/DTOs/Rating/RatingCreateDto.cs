namespace MyMDb.Shared.DTOs.Rating
{
    public class RatingCreateDto
    {
        public int MovieId { get; init; }
        public int MyMDbUserId { get; init; }
        public int Score { get; init; }
    }
}
