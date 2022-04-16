using System.ComponentModel.DataAnnotations;

namespace MyMDb.Server.Controllers.CreateModel
{
    public class CreateMovie
    {
        public int YourRating { get; }
        public DateTime DateRated { get; }
        [Required]
        public string Title { get; }
        [Required]
        public string URL { get; }
        [Required]
        public string TitleType { get; }
        [Required]
        public double IMDbRating { get; }
        [Required]
        public int Runtimemins { get; }
        [Required]
        public int Year { get; }
        [Required]
        public string Genres { get; }
        [Required]
        public DateTime ReleaseDate { get; }
        public string Directors { get; set; }
        public string Cast { get; set; }
    }
}
