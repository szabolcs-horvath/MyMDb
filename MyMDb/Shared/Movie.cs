using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyMDb.Shared
{
    public class Movie
    {
        public Movie(int yourRating, string dateRated, string title, string uRL, string titleType, double iMDbRating, int runtimemins, int year, string genres, string releaseDate, string directors, string cast)
        {
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
        }

        public int Id { get; private set; }
        public int YourRating { get; private set; }
        public string DateRated { get; private set; } = string.Empty;
        public string Title { get; private set; } = string.Empty;
        public string URL { get; private set; } = string.Empty;
        public string TitleType { get; private set; } = string.Empty;
        public double IMDbRating { get; private set; }
        public int Runtimemins { get; private set; }
        public int Year { get; private set; }
        public string Genres { get; private set; } = string.Empty;
        public string ReleaseDate { get; private set; } = string.Empty;
        public string Directors { get; private set; } = string.Empty;
        public string Cast { get; private set; } = string.Empty;

        public ICollection<Person> Person { get; private set; } = new List<Person>();
        public override string ToString()
        {
            return GetType().GetProperties()
                .Select(info => (info.Name, Value: info.GetValue(this, null) ?? "(null)"))
                .Aggregate(
                    new StringBuilder(),
                    (sb, pair) => sb.AppendLine($"{pair.Name}: {pair.Value}"),
                    sb => sb.ToString());
        }
    }
}
