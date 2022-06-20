using MyMDb.Shared.ResponseModel.MyMDbRole;
using MyMDb.Shared.ResponseModel.Rating;
using MyMDb.Shared.ResponseModel.Review;

namespace MyMDb.Shared.ResponseModel.MyMDbUser
{
    public class MyMDbUserResponse
    {
        public int Id { get; set; }
        public string Username { get; set; }
        public int MyMDbRoleId { get; set; }

        public IEnumerable<RatingBasicResponse>? Ratings { get; set; }
        public IEnumerable<ReviewBasicResponse>? Reviews { get; set; }
        public MyMDbRoleBasicResponse? MyMDbRole { get; set; }
    }
}
