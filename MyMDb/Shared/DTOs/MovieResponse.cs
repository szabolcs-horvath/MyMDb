namespace MyMDb.Shared.DTOs
{
    public class MovieResponse
    {
        public int Id { get; set; }
        public int? YourRating { get; set; }
        public string? DateRated { get; set; }
        public string Title { get; set; } = string.Empty;
        public string URL { get; set; } = string.Empty;
        public string TitleType { get; set; } = string.Empty;
        public double IMDbRating { get; set; }
        public int Runtimemins { get; set; }
        public int Year { get; set; }
        public IEnumerable<string> Genres { get; set; } = Enumerable.Empty<string>();
        public string? ReleaseDate { get; set; }
        public IEnumerable<string>? Directors { get; set; }
        public IEnumerable<string>? Cast { get; set; }
        public IEnumerable<PersonResponse>? People { get; set; }
        public IEnumerable<RatingResponse>? Ratings { get; set; }
        public IEnumerable<ReviewResponse>? Reviews { get; set; }
    }
}
