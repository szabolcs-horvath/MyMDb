using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyMDb.Shared
{
    public class Movie
    {
        public int Id { get; set; }
        public int YourRating { get; set; }
        public string DateRated { get; set; } = string.Empty;
        public string Title { get; set; } = string.Empty;
        public string URL { get; set; } = string.Empty;
        public string TitleType { get; set; } = string.Empty;
        public double IMDbRating { get; set; }
        public int Runtimemins { get; set; }
        public int Year { get; set; }
        public string Genres { get; set; } = string.Empty;
        public string ReleaseDate { get; set; } = string.Empty;
        public string Directors { get; set; } = string.Empty;
        public string Cast { get; set; } = string.Empty;

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
