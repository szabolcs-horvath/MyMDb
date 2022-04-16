using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MyMDb.Server.Controllers.CreateModel;
using MyMDb.Server.DAL;

namespace MyMDb.Server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PersonController : ControllerBase
    {
        private readonly IPersonRepository repository;

        public PersonController(IPersonRepository repository)
        {
            this.repository = repository;
        }

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public ActionResult<List<Person>> GetPersons()
        {
            //Notice, when requesting all movies through the REST API, it doesnt Include() the Movies
            //through the Person.DbMovie navigation property, to avoid circular references
            return Ok(repository.GetAll());
        }

        [HttpGet("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public async Task<ActionResult<Person>> GetPerson(int id)
        {
            //Circular references will appear as null in the JSON string (see IgnoreCycles in MyMDb.Server.Program.cs)
            var result = await repository.Get(id);

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
        [ProducesResponseType(StatusCodes.Status201Created)]
        public async Task<ActionResult> PostPerson([FromBody] CreatePerson person)
        {
            var created = await repository.Insert(person);
            return CreatedAtAction(nameof(GetPerson), new { id = created.Id }, created);
        }

        [HttpPut("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<ActionResult<Person>> ModifyPerson(int id, [FromBody] Person person)
        {
            if (id != person.Id)
            {
                return BadRequest();
            }

            var personfromDb = await repository.Get(id);

            if (personfromDb == null) 
            {
                return NotFound();
            }

            var result = await repository.Update(person);
            return Ok(result);
        }

        [HttpDelete("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<ActionResult<Person>> DeletePerson(int id)
        {
            var person = await repository.Delete(id);

            if (person == null)
            {
                return NotFound();
            }

            return Ok(person);
        }
    }
}
