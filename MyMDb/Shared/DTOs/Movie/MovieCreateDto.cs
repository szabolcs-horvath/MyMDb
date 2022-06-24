namespace MyMDb.Shared.DTOs.Movie
{
    public class MovieCreateDto
    {
        public string Title { get; init; }
        public string URL { get; init; }
        public string TitleType { get; init; }
        public double IMDbRating { get; init; }
        public int Runtimemins { get; init; }
        public int Year { get; init; }
        public string Genres { get; init; }
        public string? ReleaseDate { get; init; }
        public string? Directors { get; init; }
        public string? Cast { get; init; }
    }
}
