using MyMDb.Shared.ResponseModel.Movie;

namespace MyMDb.Shared.ResponseModel.Person
{
    public class PersonResponse
    {
        public int Id { get; set; }
        public string FullName { get; set; } = string.Empty;
        public string Birthdate { get; set; } = string.Empty;
        public string Birthplace { get; set; } = string.Empty;
        public IEnumerable<MovieBasicResponse>? Movies { get; set; }
    }
}
