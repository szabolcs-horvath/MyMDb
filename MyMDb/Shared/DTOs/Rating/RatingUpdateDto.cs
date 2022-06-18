namespace MyMDb.Shared.DTOs.Rating
{
    public class RatingUpdateDto
    {
        public int? MovieId { get; set; }
        public int? MyMDbUserId { get; set; }
        public int? Score { get; set; }
    }
}
