using MyMDb.Shared.ResponseModel.Person;

namespace MyMDb.Server.DAL.Entities
{
    public class Person
    {
        public int Id { get; set; }
        public string FullName { get; set; }
        public string Birthdate { get; set; }
        public string Birthplace { get; set; }

        // This annotation is only necessary if we want to prevent circular references when we request movies
        // [System.Text.Json.Serialization.JsonIgnore]
        public ICollection<Movie> Movie { get; set; } = new List<Movie>();

        public PersonResponse ToResponse()
        {
            return new PersonResponse
            {
                Id = this.Id,
                FullName = this.FullName,
                Birthdate = this.Birthdate,
                Birthplace = this.Birthplace,
                Movies = this.Movie.Select(m => m.ToBasicResponse())
            };
        }

        public PersonBasicResponse ToBasicResponse()
        {
            return new PersonBasicResponse
            {
                Id = this.Id,
                FullName = this.FullName
            };
        }
    }
}
