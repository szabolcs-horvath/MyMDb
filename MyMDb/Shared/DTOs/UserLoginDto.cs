namespace MyMDb.Shared.DTOs
{
    public class UserLoginDto
    {
        public string Username { get; set; } = string.Empty;
        //TODO Itt már inkább rögtön hash-t és salt-ot adjon plaintext password helyett
        public string Password { get; set; } = string.Empty;
        //public byte[] PasswordHash { get; set; } = new byte[64];
        //public byte[] PasswordSalt { get; set; } = new byte[128];
    }
}
