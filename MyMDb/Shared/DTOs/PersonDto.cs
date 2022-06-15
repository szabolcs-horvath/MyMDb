namespace MyMDb.Shared.DTOs
{
    public class PersonDto
    {
        public int Id { get; init; }
        public string FullName { get; init; } = string.Empty;
        public string Birthdate { get; init; } = string.Empty;
        public string Birthplace { get; init; } = string.Empty;
        public IEnumerable<string>? Movies { get; init; }
    }
}
