using MyMDb.Shared.ResponseModel.MyMDbUser;

namespace MyMDb.Server.DAL.Entities
{
    public class MyMDbUser
    {
        public int Id { get; set; }
        public string Username { get; set; }
        public byte[] PasswordHash { get; set; }
        public byte[] PasswordSalt { get; set; }
        public int MyMDbRoleId { get; set; }

        public ICollection<Rating> Ratings { get; set; }
        public ICollection<Review> Reviews { get; set; }
        public MyMDbRole MyMDbRole { get; set; }

        public MyMDbUserResponse ToResponse()
        {
            return new MyMDbUserResponse
            {
                Id = Id,
                Username = Username,
                MyMDbRoleId = MyMDbRoleId,
                Ratings = Ratings?.Select(r => r.ToBasicResponse()),
                Reviews = Reviews?.Select(r => r.ToBasicResponse()),
                MyMDbRole = MyMDbRole?.ToBasicResponse()
            };
        }

        public MyMDbUserBasicResponse ToBasicResponse()
        {
            return new MyMDbUserBasicResponse
            {
                Id = Id,
                Username = Username,
                MyMDbRoleId = MyMDbRoleId
            };
        }
    }
}
