namespace MyMDb.Shared.DTOs
{
    public class RatingUpdateDto
    {
        public int Id { get; set; }
        public int MovieId { get; set; }
        public int UserId { get; set; }
        public int Score { get; set; }
    }
}
