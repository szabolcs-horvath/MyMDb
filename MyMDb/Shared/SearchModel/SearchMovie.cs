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
