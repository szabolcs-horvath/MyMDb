using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MyMDb.Server.Data;
using System.Linq;

namespace MyMDb.Server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MovieController : ControllerBase
    {
        private readonly MyMDbDbContext _context;

        public MovieController(MyMDbDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<ActionResult<List<Movie>>> GetMovies()
        {
            //Notice, when requesting all movies through the REST API, it doesnt Include() the Persons
            //through the Movie.Person navigation property, to avoid circular references, and have a cleaner resulting JSON string
            return await _context.Movie.ToListAsync();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Movie>> GetMovie(int id)
        {
            //Circular references will appear as null in the JSON string (see IgnoreCycles in MyMDb.Server.Program.cs)
            var result = await _context.Movie
                .Include(m => m.Person)
                .Where(m => m.Id == id)
                .FirstAsync();
            if (result == null)
            {
                return NotFound();
            } else
            {
                return Ok(result);
            }
        }

        [HttpPost]
        public async Task<ActionResult> PostMovie([FromBody] Movie movie)
        {
            if (movie == null)
            {
                throw new ArgumentNullException(nameof(movie));
            }
            _context.Movie.Add(movie);
            await _context.SaveChangesAsync();
            return CreatedAtAction(nameof(GetMovie), new {id = movie.Id}, movie);
        }

        [HttpPut("{id}")]
        public async Task<ActionResult> ModifyMovie(int id, [FromBody] Movie movie)
        {
            if (id != movie.Id)
                return BadRequest();

            var movieFromDb = await _context.Movie.SingleOrDefaultAsync(m => m.Id == id);
            
            if (movieFromDb == null)
                return NotFound();

            movieFromDb.YourRating = movie.YourRating;
            movieFromDb.DateRated = movie.DateRated;
            movieFromDb.Title = movie.Title;
            movieFromDb.URL = movie.URL;
            movieFromDb.TitleType = movie.TitleType;
            movieFromDb.IMDbRating = movie.IMDbRating;
            movieFromDb.Runtimemins = movie.Runtimemins;
            movieFromDb.Year = movie.Year;
            movieFromDb.Genres = movie.Genres;
            movieFromDb.ReleaseDate = movie.ReleaseDate;
            movieFromDb.Directors = movie.Directors;
            movieFromDb.Cast = movie.Cast;

            await _context.SaveChangesAsync();

            return NoContent();

        }
        
        [HttpDelete("{id}")]
        public async Task<ActionResult<Movie>> DeleteMovie(int id)
        {
            var movie = await _context.Movie.FindAsync(id);

            if (movie == null)
            {
                return NotFound();
            }

            _context.Movie.Remove(movie);
            await _context.SaveChangesAsync();

            return movie;
        }
    }
}
