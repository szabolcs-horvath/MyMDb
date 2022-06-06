using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyMDb.Shared
{
    public class Person
    {
        public Person(int id, string? fullName, string? birthdate, string? birthplace, IEnumerable<string>? movies)
        {
            Id = id;
            FullName = fullName;
            Birthdate = birthdate;
            Birthplace = birthplace;
            Movies = movies;
        }

        public int Id { get; init; }
        public string FullName { get; init; }
        public string Birthdate { get; init; }
        public string Birthplace { get; init; }
        public IEnumerable<string>? Movies { get; init; }
    }
}
