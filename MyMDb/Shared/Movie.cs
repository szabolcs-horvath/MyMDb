namespace MyMDb.Shared
{
    public class Movie
    {
        public int Id { get; init; }
        public int? YourRating { get; init; }
        public string? DateRated { get; init; }
        public string Title { get; init; }
        public string URL { get; init; }
        public string TitleType { get; init; }
        public double IMDbRating { get; init; }
        public int Runtimemins { get; init; }
        public int Year { get; init; }
        public IEnumerable<string> Genres { get; init; }
        public string? ReleaseDate { get; init; }
        public IEnumerable<string>? Directors { get; init; }
        public IEnumerable<string>? Cast { get; init; }
        public IEnumerable<string>? People { get; init; }
    }
}
