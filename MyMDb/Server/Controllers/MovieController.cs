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
            return await _context.Movie.ToListAsync();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Movie>> GetMovie(int id)
        {
            var result = _context.Movie.FindAsync(id);
            if (result.Result == null)
            {
                return NotFound();
            } else
            {
                return Ok(result.Result);
            }
        }
    }
}
