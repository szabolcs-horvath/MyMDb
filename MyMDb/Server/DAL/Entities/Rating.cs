namespace MyMDb.Server.DAL.Entities
{
    public class Rating
    {
        public int Id { get; set; }
        public int MovieId { get; set; }
        public int UserId { get; set; }
        public int Score { get; set; }

        public Movie Movie { get; set; } = new Movie();
        public User User { get; set; } = new User();
    }
}
