namespace MyMDb.Shared.DTOs
{
    public class ReviewResponse
    {
        public int Id { get; set; }
        public int MovieId { get; set; }
        public int MyMDbUserId { get; set; }
        public string Headline { get; set; } = string.Empty;
        public string Description { get; set; } = string.Empty;
        public bool Spoiler { get; set; }
        public MovieBasicResponse Movie { get; set; }
        public MyMDbUserBasicResponse MyMDbUser { get; set; }
    }
}
