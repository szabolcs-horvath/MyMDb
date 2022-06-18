using MyMDb.Server.DAL.Entities;

namespace MyMDb.Shared
{
    public class MyMDbUser
    {
        public int Id { get; set; }
        public string Username { get; set; }
        public byte[] PasswordHash { get; set; }
        public byte[] PasswordSalt { get; set; }
        public int MyMDbRoleId { get; set; }

        public ICollection<Rating> Ratings { get; set; } = new List<Rating>();
        public ICollection<Review> Reviews { get; set; } = new List<Review>();
        public MyMDbRole MyMDbRole { get; set; }
    }
}
