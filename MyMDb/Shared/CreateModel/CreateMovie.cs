using System.ComponentModel.DataAnnotations;

namespace MyMDb.Shared.CreateModel
{
    public class CreateMovie
    {
        public CreateMovie() {}

        public int? YourRating { get; set; }
        public string? DateRated { get; set; }
        [Required]
        public string Title { get; set; }
        [Required]
        public string URL { get; set; }
        [Required]
        public string TitleType { get; set; }
        [Required]
        public double IMDbRating { get; set; }
        [Required]
        public int Runtimemins { get; set; }
        [Required]
        public int Year { get; set; }
        [Required]
        public string Genres { get; set; }
        [Required]
        public string ReleaseDate { get; set; }
        public string? Directors { get; set; }
        public string? Cast { get; set; }
    }
}
