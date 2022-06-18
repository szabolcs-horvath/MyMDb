namespace MyMDb.Shared.DTOs
{
    public class MyMDbUserResponse
    {
        public int Id { get; set; }
        public string Username { get; set; }
        public int MyMDbRoleId { get; set; }

        public IEnumerable<RatingBasicResponse> Ratings { get; set; }
        public IEnumerable<ReviewBasicResponse> Reviews { get; set; }
        public MyMDbRoleBasicResponse MyMDbRole { get; set; }
    }
}
