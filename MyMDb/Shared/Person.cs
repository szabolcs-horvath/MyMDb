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

        public int Id { get; }
        public string FullName { get; }
        public string Birthdate { get; }
        public string Birthplace { get; }
        public IEnumerable<string>? Movies { get; }
    }
}
