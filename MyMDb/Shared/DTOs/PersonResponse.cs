namespace MyMDb.Shared.DTOs
{
    public class PersonResponse
    {
        public int Id { get; set; }
        public string FullName { get; set; } = string.Empty;
        public string Birthdate { get; set; } = string.Empty;
        public string Birthplace { get; set; } = string.Empty;
        public IEnumerable<MovieResponse>? Movies { get; set; }
    }
}
