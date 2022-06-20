namespace MyMDb.Shared.DTOs.MyMDbUser
{
    public class MyMDbUserCreateDto
    {
        public string Username { get; init; }
        public byte[] PasswordHash { get; init; }
        public byte[] PasswordSalt { get; init; }
        public int MyMDbRoleId { get; init; }
    }
}
