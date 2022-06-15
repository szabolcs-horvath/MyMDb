namespace MyMDb.Shared.CreateModel
{
    public class CreateMovie
    {
        public int? YourRating { get; init; }
        public string? DateRated { get; init; }
        public string Title { get; init; } = string.Empty;
        public string URL { get; init; } = string.Empty;
        public string TitleType { get; init; } = string.Empty;
        public double IMDbRating { get; init; }
        public int Runtimemins { get; init; }
        public int Year { get; init; }
        public string Genres { get; init; } = string.Empty;
        public string? ReleaseDate { get; init; }
        public string? Directors { get; init; }
        public string? Cast { get; init; }
    }
}
