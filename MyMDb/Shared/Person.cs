using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyMDb.Shared
{
    public class Person
    {
        public Person(string fullName, string birthdate, string birthplace)
        {
            FullName = fullName;
            Birthdate = birthdate;
            Birthplace = birthplace;
        }

        public int Id { get; private set; }
        public string FullName { get; private set; } = string.Empty;
        public string Birthdate { get; private set; } = string.Empty;
        public string Birthplace { get; private set; } = string.Empty;

        //This annotation isn't ideal, if we want to access movies through a person using the REST API,
        //but it is necessary to prevent circular references when we request movies
        //[System.Text.Json.Serialization.JsonIgnore]
        public ICollection<Movie> Movie { get; private set; } = new List<Movie>();

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
