using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MyMDb.Server.DAL;
using MyMDb.Shared.CreateModel;

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
            return Ok(repository.GetAll());
        }

        [HttpGet("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public async Task<ActionResult<Person>> GetPerson(int id)
        {
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

        [HttpGet("search")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<ActionResult<IReadOnlyCollection<Person>>> SearchByName(string name)
        {
            var results = await repository.SearchByName(name);
            if (results is null)
            {
                return NotFound();
            }
            foreach (var item in results)
            {
                Console.WriteLine(item.FullName);
            }

            return Ok(results);
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status201Created)]
        public async Task<ActionResult> PostPerson([FromBody] CreatePerson person)
        {
            var created = await repository.Insert(person);
            return CreatedAtAction(nameof(GetPerson), new { id = created.Id }, created);
        }

        [HttpPatch("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<ActionResult<Person>> ModifyPerson(int id, [FromBody] Person person)
        {
            var personfromDb = await repository.Get(id);

            if (personfromDb == null) 
            {
                return NotFound();
            }

            var toUpdate = new Person(id, person.FullName, person.Birthdate, person.Birthplace, personfromDb.Movies ?? Array.Empty<string>());

            var result = await repository.Update(toUpdate);
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
