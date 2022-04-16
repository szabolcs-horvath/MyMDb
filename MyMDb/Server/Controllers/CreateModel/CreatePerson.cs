using System.ComponentModel.DataAnnotations;

namespace MyMDb.Server.Controllers.CreateModel
{
    public class CreatePerson
    {
        [Required]
        public string FullName { get; set; }
        [Required]
        public DateTime Birthdate { get; set; }
        [Required]
        public string Birthplace { get; set; }
    }
}
