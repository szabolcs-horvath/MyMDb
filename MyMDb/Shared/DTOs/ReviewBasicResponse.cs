namespace MyMDb.Shared.DTOs
{
    public class ReviewBasicResponse
    {
        public int Id { get; set; }
        public int MovieId { get; set; }
        public int UserId { get; set; }
        public string Headline { get; set; } = string.Empty;
        public string Description { get; set; } = string.Empty;
        public bool Spoiler { get; set; }
    }
}
