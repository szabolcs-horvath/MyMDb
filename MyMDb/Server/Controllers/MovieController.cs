using Microsoft.AspNetCore.Mvc;
using MyMDb.Server.DAL;
using MyMDb.Shared.CreateModel;
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
        public ActionResult<IReadOnlyCollection<Movie>> GetMovies()
        {
            return Ok(_repository.GetAll());
        }

        [HttpGet("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<ActionResult<Movie>> GetMovie(int id)
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
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<ActionResult<IReadOnlyCollection<SearchMovie>>> SearchByTitle([FromQuery] string title)
        {
            var results = await _repository.SearchByTitle(title);
            if (results.Count == 0)
            {
                return NotFound();
            }
            return Ok(results);
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status201Created)]
        public async Task<ActionResult<Movie>> PostMovie(CreateMovie movie)
        {
            var created = await _repository.Insert(movie);
            return CreatedAtAction(nameof(GetMovie), new {id = created.Id}, created);
        }

        [HttpPatch("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<ActionResult<Movie>> ModifyMovie(int id, [FromBody] Movie movie)
        {
            var movieFromDb = await _repository.Get(id);

            if (movieFromDb == null)
            {
                return NotFound();
            }

            var toUpdate = new Movie(id, movie.YourRating, movie.DateRated, movie.Title, movie.URL,
                movie.TitleType, movie.IMDbRating, movie.Runtimemins, movie.Year, movie.Genres, movie.ReleaseDate,
                movie.Directors ?? Array.Empty<string>(), movie.Cast ?? Array.Empty<string>(),
                movie.People ?? Array.Empty<string>());

            var result = await _repository.Update(toUpdate);
            return Ok(result);
        }
        
        [HttpDelete("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<ActionResult<Movie>> DeleteMovie(int id)
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
