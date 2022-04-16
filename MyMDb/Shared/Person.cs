using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyMDb.Shared
{
    public class Person
    {
        public Person(int id, string fullName, DateTime birthdate, string birthplace)
        {
            Id = id;
            FullName = fullName;
            Birthdate = birthdate;
            Birthplace = birthplace;
        }

        public int Id { get; set; }
        public string FullName { get; set; }
        public DateTime Birthdate { get; set; }
        public string Birthplace { get; set; }
    }
}
