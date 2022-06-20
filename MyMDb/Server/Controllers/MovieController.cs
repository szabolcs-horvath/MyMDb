using Microsoft.AspNetCore.Mvc;
using MyMDb.Server.DAL.Entities;
using MyMDb.Server.DAL.Repositories.MovieRepository;
using MyMDb.Shared.DTOs.Movie;
using MyMDb.Shared.ResponseModel.Movie;

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
        public ActionResult<IReadOnlyCollection<MovieBasicResponse>> GetAll()
        {
            var result = _repository.GetAll().Select(m => m.ToBasicResponse());

            return Ok(result);
        }

        [HttpGet("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<ActionResult<MovieResponse>> Get(int id, [FromQuery] string? extended)
        {
            Movie? result;

            if (string.Compare(extended, "full", StringComparison.OrdinalIgnoreCase) == 0)
            {
                result = await _repository.GetExtended(id);
            }
            else
            {
                result = await _repository.Get(id);
            }

            if (result == null)
            {
                return NotFound();
            }

            return Ok(result.ToResponse());
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult<MovieBasicResponse>> Insert(MovieCreateDto movie)
        {
            var created = await _repository.Insert(movie);

            if (created is null)
            {
                return BadRequest();
            }

            return CreatedAtAction(nameof(Get), new {id = created.Id}, created.ToBasicResponse());
        }

        [HttpPatch("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<ActionResult<MovieBasicResponse>> Update(int id, [FromBody] MovieUpdateDto value)
        {
            var result = await _repository.Update(id, value);

            if (result is null)
            {
                return NotFound();
            }

            return Ok(result.ToBasicResponse());
        }
        
        [HttpDelete("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<ActionResult<MovieBasicResponse>> Delete(int id)
        {
            var movie = await _repository.Delete(id);

            if (movie == null)
            {
                return NotFound();
            }

            return Ok(movie.ToBasicResponse());
        }

        [HttpGet("search")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public async Task<ActionResult<IReadOnlyCollection<MovieBasicResponse>>> SearchByTitle(string title)
        {
            var results = await _repository.SearchByTitle(title);

            return Ok(results.Select(m => m.ToBasicResponse()));
        }
    }
}
