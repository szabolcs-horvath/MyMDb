using FluentValidation;
using MyMDb.Shared.CreateModel;

namespace MyMDb.Shared
{
    public class CreateMovieValidator : AbstractValidator<CreateMovie>
    {
        public CreateMovieValidator()
        {
            RuleFor(cm => cm.Title)
                .NotEmpty()
                .NotNull()
                .MaximumLength(100);

            RuleFor(cm => cm.URL)
                .NotEmpty()
                .NotNull()
                .MaximumLength(100)
                .Matches(@"https://www\.imdb\.com/title/tt[0-9]*/.*");

            RuleFor(cm => cm.TitleType)
                .NotEmpty()
                .NotNull()
                .MaximumLength(20)
                .Must(tt => tt == "movie" || tt == "tvMiniSeries" || tt == "tvSeries");

            RuleFor(cm => cm.IMDbRating)
                .NotEmpty()
                .NotNull()
                .InclusiveBetween(1.0, 10.0);

            RuleFor(cm => cm.Runtimemins)
                .NotEmpty()
                .NotNull()
                .GreaterThan(0);

            RuleFor(cm => cm.Year)
                .NotEmpty()
                .NotNull()
                .GreaterThan(1800);

            RuleFor(cm => cm.Genres)
                .NotEmpty()
                .NotNull()
                .Matches(@"^[A-Za-z]*(, [A-Za-z]+)*$");

            RuleFor(cm => cm.ReleaseDate)
                .NotEmpty()
                .NotNull()
                .Must(rd => int.Parse(rd[0..4]) >= 1800);

        }
    }
}
