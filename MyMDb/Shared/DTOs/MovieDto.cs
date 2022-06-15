namespace MyMDb.Shared.DTOs
{
    public class MovieDto
    {
        public int Id { get; init; }
        public int? YourRating { get; init; }
        public string? DateRated { get; init; }
        public string Title { get; init; } = string.Empty;
        public string URL { get; init; } = string.Empty;
        public string TitleType { get; init; } = string.Empty;
        public double IMDbRating { get; init; }
        public int Runtimemins { get; init; }
        public int Year { get; init; }
        public IEnumerable<string> Genres { get; init; } = Enumerable.Empty<string>();
        public string? ReleaseDate { get; init; }
        public IEnumerable<string>? Directors { get; init; }
        public IEnumerable<string>? Cast { get; init; }
        public IEnumerable<string>? People { get; init; }
    }
}
