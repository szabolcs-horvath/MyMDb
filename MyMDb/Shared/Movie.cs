namespace MyMDb.Shared
{
    public class Movie
    {
        public Movie(int id, int? yourRating, string? dateRated, string title, string uRL, string titleType,
            double iMDbRating, int runtimemins, int year, IEnumerable<string>? genres, string releaseDate,
            IEnumerable<string>? directors, IEnumerable<string>? cast, IEnumerable<string>? people)
        {
            Id = id;
            YourRating = yourRating;
            DateRated = dateRated;
            Title = title;
            URL = uRL;
            TitleType = titleType;
            IMDbRating = iMDbRating;
            Runtimemins = runtimemins;
            Year = year;
            Genres = genres;
            ReleaseDate = releaseDate;
            Directors = directors;
            Cast = cast;
            People = people;
        }

        public int Id { get; init; }
        public int? YourRating { get; init; }
        public string? DateRated { get; init; }
        public string Title { get; init; }
        public string URL { get; init; }
        public string TitleType { get; init; }
        public double IMDbRating { get; init; }
        public int Runtimemins { get; init; }
        public int Year { get; init; }
        public IEnumerable<string>? Genres { get; init; }
        public string ReleaseDate { get; init; }
        public IEnumerable<string>? Directors { get; init; }
        public IEnumerable<string>? Cast { get; init; }
        public IEnumerable<string>? People { get; init; }
    }
}
