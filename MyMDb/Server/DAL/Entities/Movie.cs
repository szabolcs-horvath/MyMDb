namespace MyMDb.Server.DAL.Entities
{
    public class Movie
    {
        public int Id { get; set; }
        public int? YourRating { get; set; }
        public string? DateRated { get; set; }
        public string Title { get; set; }
        public string URL { get; set; }
        public string TitleType { get; set; }
        public double IMDbRating { get; set; }
        public int Runtimemins { get; set; }
        public int Year { get; set; }
        public string Genres { get; set; }
        public string? ReleaseDate { get; set; }
        public string? Directors { get; set; }
        public string? Cast { get; set; }

        public ICollection<Person> Person { get; set; } = new List<Person>();
        public ICollection<Rating> Ratings { get; set; } = new List<Rating>();
        public ICollection<Review> Reviews { get; set; } = new List<Review>();
    }
}
