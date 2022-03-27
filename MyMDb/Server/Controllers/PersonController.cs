using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MyMDb.Server.Data;

namespace MyMDb.Server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PersonController : ControllerBase
    {
        private readonly MyMDbDbContext _context;

        public PersonController(MyMDbDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<ActionResult<List<Person>>> GetPersons()
        {
            //Notice, when requesting all movies through the REST API, it doesnt Include() the Movies
            //through the Person.Movie navigation property, to avoid circular references, and have a cleaner resulting JSON string
            return await _context.Person.ToListAsync();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Person>> GetPerson(int id)
        {
            //Circular references will appear as null in the JSON string (see IgnoreCycles in MyMDb.Server.Program.cs)
            var result = await _context.Person
                .Include(p => p.Movie)
                .Where(p => p.Id == id)
                .FirstAsync();
            Console.WriteLine(result.FullName);
            if (result == null)
            {
                return NotFound();
            }
            else
            {
                return Ok(result);
            }
        }

        [HttpPost]
        public async Task<ActionResult> PostPerson([FromBody] Person person)
        {
            if (person == null)
            {
                throw new ArgumentNullException(nameof(person));
            }
            _context.Person.Add(person);
            await _context.SaveChangesAsync();
            return CreatedAtAction(nameof(GetPerson), new { id = person.Id }, person);
        }

        [HttpPut("{id}")]
        public async Task<ActionResult> ModifyPerson(int id, [FromBody] Person person)
        {
            if (id != person.Id)
                return BadRequest();

            var personfromDb = await _context.Person.SingleOrDefaultAsync(p => p.Id == id);

            if (personfromDb == null)
                return NotFound();

            personfromDb.FullName = person.FullName;
            personfromDb.Birthdate = person.Birthdate;
            personfromDb.Birthplace = person.Birthplace;

            await _context.SaveChangesAsync();

            return NoContent();
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult<Person>> DeletePerson(int id)
        {
            var person = await _context.Person.FindAsync(id);

            if (person == null)
            {
                return NotFound();
            }

            _context.Person.Remove(person);
            await _context.SaveChangesAsync();

            return person;
        }
    }
}
