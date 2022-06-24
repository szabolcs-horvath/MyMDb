namespace MyMDb.Shared.DTOs
{
    public class HashDto
    {
        public byte[] PasswordHash { get; init; }
        public byte[] PasswordSalt { get; init; }
    }
}
