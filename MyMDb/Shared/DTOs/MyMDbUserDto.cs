namespace MyMDb.Shared.DTOs
{
    public class MyMDbUserDto
    {
        public int Id { get; init; }
        public string Username { get; init; } = string.Empty;
        public byte[] PasswordHash { get; init; } = new byte[64];
        public byte[] PasswordSalt { get; init; } = new byte[128];
    }
}
