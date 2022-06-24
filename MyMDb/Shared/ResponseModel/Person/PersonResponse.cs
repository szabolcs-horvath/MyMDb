using MyMDb.Shared.ResponseModel.Movie;

namespace MyMDb.Shared.ResponseModel.Person
{
    public class PersonResponse
    {
        public int Id { get; set; }
        public string FullName { get; set; }
        public string Birthdate { get; set; }
        public string Birthplace { get; set; }
        public IEnumerable<MovieBasicResponse>? Movies { get; set; }
    }
}
