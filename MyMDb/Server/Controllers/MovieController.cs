using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MyMDb.Server.DAL;
using MyMDb.Shared.CreateModel;
using System.Linq;

namespace MyMDb.Server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MovieController : ControllerBase
    {
        private readonly IMovieRepository repository;

        public MovieController(IMovieRepository repository)
        {
            this.repository = repository;
        }

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public ActionResult<IReadOnlyCollection<Movie>> GetMovies()
        {
            return Ok(repository.GetAll());
        }

        [HttpGet("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<ActionResult<Movie>> GetMovie(int id)
        {
            var result = await repository.Get(id);

            if (result == null)
            {
                return NotFound();
            } else
            {
                return Ok(result);
            }
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status201Created)]
        public async Task<ActionResult<Movie>> PostMovie(CreateMovie movie)
        {
            var created = await repository.Insert(movie);
            return CreatedAtAction(nameof(GetMovie), new {id = created.Id}, created);
        }

        [HttpPatch("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<ActionResult<Movie>> ModifyMovie(int id, [FromBody] Movie movie)
        {
            var movieFromDb = await repository.Get(id);

            if (movieFromDb == null)
            {
                return NotFound();
            }

            var toUpdate = new Movie(id, movie.YourRating, movie.DateRated, movie.Title, movie.URL,
                movie.TitleType, movie.IMDbRating, movie.Runtimemins, movie.Year, movie.Genres, movie.ReleaseDate,
                movie.Directors ?? Array.Empty<string>(), movie.Cast ?? Array.Empty<string>(),
                movie.People ?? Array.Empty<string>());

            var result = await repository.Update(toUpdate);
            return Ok(result);
        }
        
        [HttpDelete("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<ActionResult<Movie>> DeleteMovie(int id)
        {
            var movie = await repository.Delete(id);

            if (movie == null)
            {
                return NotFound();
            }

            return Ok(movie);
        }
    }
}
