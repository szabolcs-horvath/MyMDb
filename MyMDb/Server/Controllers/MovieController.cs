using Microsoft.AspNetCore.Mvc;
using MyMDb.Server.DAL.Repositories.MovieRepository;
using MyMDb.Shared.CreateModel;
using MyMDb.Shared.DTOs;
using MyMDb.Shared.SearchModel;

namespace MyMDb.Server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MovieController : ControllerBase
    {
        private readonly IMovieRepository _repository;

        public MovieController(IMovieRepository repository)
        {
            this._repository = repository;
        }

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public ActionResult<ICollection<MovieDto>> GetMovies()
        {
            return Ok(_repository.GetAll());
        }

        [HttpGet("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<ActionResult<MovieDto>> GetMovie(int id)
        {
            var result = await _repository.Get(id);

            if (result == null)
            {
                return NotFound();
            } else
            {
                return Ok(result);
            }
        }

        [HttpGet("search")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public async Task<ActionResult<IReadOnlyCollection<SearchMovie>>> SearchByTitle(string title)
        {
            var results = await _repository.SearchByTitle(title);
            return Ok(results);
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status201Created)]
        public async Task<ActionResult<MovieDto>> PostMovie(CreateMovie movie)
        {
            var created = await _repository.Insert(movie);
            return CreatedAtAction(nameof(GetMovie), new {id = created.Id}, created);
        }

        [HttpPatch("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<ActionResult<MovieDto>> ModifyMovie(int id, [FromBody] MovieDto movie)
        {
            var movieFromDb = await _repository.Get(id);

            if (movieFromDb == null)
            {
                return NotFound();
            }

            var toUpdate = new MovieDto 
            {
                Id = id, 
                YourRating = movie.YourRating, 
                DateRated = movie.DateRated, 
                Title = movie.Title, 
                URL = movie.URL,
                TitleType = movie.TitleType, 
                IMDbRating = movie.IMDbRating, 
                Runtimemins = movie.Runtimemins, 
                Year = movie.Year,
                Genres = movie.Genres, 
                ReleaseDate = movie.ReleaseDate,
                Directors = movie.Directors ?? Array.Empty<string>(), 
                Cast = movie.Cast ?? Array.Empty<string>(),
                People = movie.People ?? Array.Empty<string>()
            };

            var result = await _repository.Update(toUpdate);
            return Ok(result);
        }
        
        [HttpDelete("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<ActionResult<MovieDto>> DeleteMovie(int id)
        {
            var movie = await _repository.Delete(id);

            if (movie == null)
            {
                return NotFound();
            }

            return Ok(movie);
        }
    }
}
