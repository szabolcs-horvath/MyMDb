using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyMDb.Server
{
    public class DbPerson
    {
        public int Id { get; set; }
        public string? FullName { get; set; }
        public string? Birthdate { get; set; }
        public string? Birthplace { get; set; }

        // This annotation is only necessary if we want to prevent circular references when we request movies
        // [System.Text.Json.Serialization.JsonIgnore]
        public ICollection<DbMovie> Movie { get; set; } = new List<DbMovie>();
    }
}
