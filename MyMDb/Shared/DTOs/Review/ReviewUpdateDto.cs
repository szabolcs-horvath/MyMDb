namespace MyMDb.Shared.DTOs.Review
{
    public class ReviewUpdateDto
    {
        public int? MovieId { get; set; }
        public int? MyMDbUserId { get; set; }
        public string? Headline { get; set; }
        public string? Description { get; set; }
        public bool? Spoiler { get; set; }
    }
}
