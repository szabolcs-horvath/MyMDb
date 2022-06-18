namespace MyMDb.Shared.DTOs.Review
{
    public class ReviewUpdateDto
    {
        public int? MovieId { get; set; }
        public int? MyMDbUserId { get; set; }
        public string? Headline { get; set; } = string.Empty;
        public string? Description { get; set; } = string.Empty;
        public bool? Spoiler { get; set; }
    }
}
