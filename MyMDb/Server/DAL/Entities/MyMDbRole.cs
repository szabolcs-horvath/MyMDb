using MyMDb.Shared.ResponseModel.MyMDbRole;

namespace MyMDb.Server.DAL.Entities
{
    public class MyMDbRole
    {
        public int Id { get; set; }
        public string Rolename { get; set; }

        public ICollection<MyMDbUser>? Users { get; set; }

        public MyMDbRoleBasicResponse ToBasicResponse()
        {
            return new MyMDbRoleBasicResponse
            {
                Id = this.Id,
                Rolename = this.Rolename
            };
        }
    }
}
