namespace MyMDb.Server.DAL.Entities
{
    public class Person
    {
        public int Id { get; set; }
        public string FullName { get; set; } = string.Empty;
        public string Birthdate { get; set; } = string.Empty;
        public string Birthplace { get; set; } = string.Empty;

        // This annotation is only necessary if we want to prevent circular references when we request movies
        // [System.Text.Json.Serialization.JsonIgnore]
        public ICollection<Movie> Movie { get; set; } = new List<Movie>();
    }
}
