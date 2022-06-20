namespace MyMDb.Shared.DTOs.Review
{
    public class ReviewCreateDto
    {
        public int MovieId { get; init; }
        public int MyMDbUserId { get; init; }
        public string Headline { get; init; }
        public string Description { get; init; }
        public bool Spoiler { get; init; }
    }
}
