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
