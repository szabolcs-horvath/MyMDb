using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyMDb.Shared.SearchModel
{
    public class SearchMovie
    {
        public SearchMovie(int id, string title)
        {
            Id = id;
            Title = title;
        }

        public int Id { get; }
        public string Title { get; }
    }
}
