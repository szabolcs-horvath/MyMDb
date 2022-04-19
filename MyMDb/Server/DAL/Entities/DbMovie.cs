using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyMDb.Server
{
    public class DbMovie
    {
        public int Id { get; set; }
        public int? YourRating { get; set; }
        public string? DateRated { get; set; }
        public string? Title { get; set; }
        public string? URL { get; set; }
        public string? TitleType { get; set; }
        public double? IMDbRating { get; set; }
        public int? Runtimemins { get; set; }
        public int? Year { get; set; }
        public string? Genres { get; set; }
        public string? ReleaseDate { get; set; }
        public string? Directors { get; set; }
        public string? Cast { get; set; }

        public ICollection<DbPerson> Person { get; set; } = new List<DbPerson>();
    }
}
