namespace MyMDb.Shared.DTOs
{
    public class HashDto
    {
        public byte[] PasswordHash { get; set; } = new byte[64];
        public byte[] PasswordSalt { get; set; } = new byte[128];
    }
}
