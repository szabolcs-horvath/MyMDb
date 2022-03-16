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
            var result = await _context.Movie.Include(m => m.Person).Where(m => m.Id == id).FirstAsync();
            if (result == null)
            {
                return NotFound();
            } else
            {
                return Ok(result);
            }
        }
    }
}
