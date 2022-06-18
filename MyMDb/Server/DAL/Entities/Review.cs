namespace MyMDb.Server.DAL.Entities
{
    public class Review
    {
        public int Id { get; set; }
        public int MovieId { get; set; }
        public int MyMDbUserId { get; set; }
        public string Headline { get; set; }
        public string Description { get; set; }
        public bool Spoiler { get; set; }

        public Movie Movie { get; set; } = new Movie();
        public MyMDbUser MyMDbUser { get; set; } = new MyMDbUser();
    }
}
