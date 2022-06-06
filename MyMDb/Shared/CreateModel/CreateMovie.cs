using System.ComponentModel.DataAnnotations;

namespace MyMDb.Shared.CreateModel
{
    public class CreateMovie
    {
        public CreateMovie() {}

        public int? YourRating { get; init; }
        public string? DateRated { get; init; }
        [Required]
        public string Title { get; init; }
        [Required]
        public string URL { get; init; }
        [Required]
        public string TitleType { get; init; }
        [Required]
        public double IMDbRating { get; init; }
        [Required]
        public int Runtimemins { get; init; }
        [Required]
        public int Year { get; init; }
        [Required]
        public string Genres { get; init; }
        [Required]
        public string ReleaseDate { get; init; }
        public string? Directors { get; init; }
        public string? Cast { get; init; }
    }
}
