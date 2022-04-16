namespace MyMDb.Shared
{
    public class Movie
    {
        public Movie(int id, int? yourRating, string? dateRated, string title,
            string url, string titleType, double iMDbRating, int runtimemins,
            int year, IEnumerable<string> genres, string releaseDate,
            IEnumerable<string> directors, IEnumerable<string> cast)
        {
            Id = id;
            YourRating = yourRating;
            DateRated = dateRated;
            Title = title;
            URL = url;
            TitleType = titleType;
            IMDbRating = iMDbRating;
            Runtimemins = runtimemins;
            Year = year;
            Genres = genres;
            ReleaseDate = releaseDate;
            Directors = directors;
            Cast = cast;
        }

        public int Id { get; }
        public int? YourRating { get; }
        public string? DateRated { get; }
        public string Title { get; }
        public string URL { get; }
        public string TitleType { get; }
        public double IMDbRating { get; }
        public int Runtimemins { get; }
        public int Year { get; }
        public IEnumerable<string> Genres { get; }
        public string ReleaseDate { get; }
        public IEnumerable<string>? Directors { get; }
        public IEnumerable<string>? Cast { get; }
    }
}
