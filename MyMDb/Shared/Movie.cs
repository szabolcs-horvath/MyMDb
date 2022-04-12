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

        public int Id { get; set; }
        public int YourRating { get; set; }
        public string DateRated { get; set; }
        public string Title { get; set; }
        public string URL { get; set; }
        public string TitleType { get; set; }
        public double IMDbRating { get; set; }
        public int Runtimemins { get; set; }
        public int Year { get; set; }
        public string Genres { get; set; }
        public string ReleaseDate { get; set; }
        public string Directors { get; set; }
        public string Cast { get; set; }

        public ICollection<Person> Person { get; set; } = new List<Person>();
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
