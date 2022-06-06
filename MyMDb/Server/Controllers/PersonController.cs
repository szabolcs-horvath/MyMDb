using Microsoft.AspNetCore.Mvc;
using MyMDb.Server.DAL;
using MyMDb.Shared.CreateModel;
using MyMDb.Shared.SearchModel;

namespace MyMDb.Server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PersonController : ControllerBase
    {
        private readonly IPersonRepository _repository;

        public PersonController(IPersonRepository repository)
        {
            this._repository = repository;
        }

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public ActionResult<List<Person>> GetPersons()
        {
            return Ok(_repository.GetAll());
        }

        [HttpGet("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public async Task<ActionResult<Person>> GetPerson(int id)
        {
            var result = await _repository.Get(id);

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
        public async Task<ActionResult<IReadOnlyCollection<SearchPerson>>> SearchByName(string name)
        {
            var results = await _repository.SearchByName(name);
            if (results.Count == 0)
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
            var created = await _repository.Insert(person);
            return CreatedAtAction(nameof(GetPerson), new { id = created.Id }, created);
        }

        [HttpPatch("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<ActionResult<Person>> ModifyPerson(int id, [FromBody] Person person)
        {
            var personfromDb = await _repository.Get(id);

            if (personfromDb == null) 
            {
                return NotFound();
            }

            var toUpdate = new Person
            {
                Id = id,
                FullName = person.FullName,
                Birthdate = person.Birthdate,
                Birthplace = person.Birthplace,
                Movies = personfromDb.Movies ?? Array.Empty<string>()
            };

            var result = await _repository.Update(toUpdate);
            return Ok(result);
        }

        [HttpDelete("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<ActionResult<Person>> DeletePerson(int id)
        {
            var person = await _repository.Delete(id);

            if (person == null)
            {
                return NotFound();
            }

            return Ok(person);
        }
    }
}
