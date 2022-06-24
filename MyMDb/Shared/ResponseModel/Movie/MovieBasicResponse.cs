namespace MyMDb.Shared.ResponseModel.Movie
{
    public class MovieBasicResponse
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string URL { get; set; }
        public string TitleType { get; set; }
        public double IMDbRating { get; set; }
        public int Runtimemins { get; set; }
        public int Year { get; set; }
        public IEnumerable<string> Genres { get; set; }
        public string? ReleaseDate { get; set; }
        public IEnumerable<string>? Directors { get; set; }
        public IEnumerable<string>? Cast { get; set; }
    }
}
