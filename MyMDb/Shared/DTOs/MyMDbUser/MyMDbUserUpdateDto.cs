namespace MyMDb.Shared.DTOs.MyMDbUser
{
    public class MyMDbUserUpdateDto
    {
        public string? Username { get; set; }
        public byte[]? PasswordHash { get; set; }
        public byte[]? PasswordSalt { get; set; }
        public int? MyMDbRoleId { get; set; }
    }
}
