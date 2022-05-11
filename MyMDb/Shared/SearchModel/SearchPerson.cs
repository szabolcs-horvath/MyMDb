using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyMDb.Shared.SearchModel
{
    public class SearchPerson
    {
        public SearchPerson(int id, string fullName)
        {
            Id = id;
            FullName = fullName;
        }

        public int Id { get; }
        public string FullName { get; }
    }
}
