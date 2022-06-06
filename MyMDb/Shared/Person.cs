namespace MyMDb.Shared
{
    public class Person
    {
        public int Id { get; init; }
        public string FullName { get; init; }
        public string Birthdate { get; init; }
        public string Birthplace { get; init; }
        public IEnumerable<string>? Movies { get; init; }
    }
}
