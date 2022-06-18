namespace MyMDb.Server.DAL.Entities
{
    public class MyMDbRole
    {
        public int Id { get; set; }
        public string Rolename { get; set; }

        public ICollection<MyMDbUser> Users { get; set; } = new List<MyMDbUser>();
    }
}
