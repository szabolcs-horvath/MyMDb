using System.ComponentModel.DataAnnotations;

namespace MyMDb.Shared.CreateModel
{
    public class CreatePerson
    {
        [Required]
        public string FullName { get; init; }
        [Required]
        public string Birthdate { get; init; }
        [Required]
        public string Birthplace { get; init; }
    }
}
