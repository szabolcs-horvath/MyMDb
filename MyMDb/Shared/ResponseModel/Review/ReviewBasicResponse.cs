namespace MyMDb.Shared.ResponseModel.Review
{
    public class ReviewBasicResponse
    {
        public int Id { get; set; }
        public int MovieId { get; set; }
        public int MyMDbUserId { get; set; }
        public string Headline { get; set; }
        public string Description { get; set; }
        public bool Spoiler { get; set; }
    }
}
