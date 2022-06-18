namespace MyMDb.Server.DAL.Entities
{
    public class Rating
    {
        public int Id { get; set; }
        public int MovieId { get; set; }
        public int MyMDbUserId { get; set; }
        public int Score { get; set; }

        public Movie Movie { get; set; } = new Movie();
        public MyMDbUser MyMDbUser { get; set; } = new MyMDbUser();
    }
}
