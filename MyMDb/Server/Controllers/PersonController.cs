using Microsoft.AspNetCore.Mvc;
using MyMDb.Server.DAL.Entities;
using MyMDb.Server.DAL.Repositories.PersonRepository;
using MyMDb.Shared.CreateModel;
using MyMDb.Shared.DTOs.Person;
using MyMDb.Shared.ResponseModel.Person;

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
        public ActionResult<List<PersonResponse>> GetAll()
        {
            var result = _repository.GetAll().Select(p => p.ToResponse());

            return Ok(result);
        }

        [HttpGet("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public async Task<ActionResult<PersonResponse>> Get(int id, [FromQuery] string? extended)
        {
            Person? result;

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
        public async Task<ActionResult> Post([FromBody] CreatePerson person)
        {
            var created = await _repository.Insert(person);

            return CreatedAtAction(nameof(Get), new { id = created?.Id }, created);
        }

        [HttpPatch("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<ActionResult<PersonResponse>> Update(int id, [FromBody] PersonUpdateDto value)
        {
            var personfromDb = await _repository.GetExtended(id);

            if (personfromDb == null) 
            {
                return NotFound();
            }

            var result = await _repository.Update(id, value);

            return Ok(result?.ToResponse());
        }

        [HttpDelete("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<ActionResult<PersonResponse>> Delete(int id)
        {
            var person = await _repository.Delete(id);

            if (person == null)
            {
                return NotFound();
            }

            return Ok(person.ToResponse());
        }

        [HttpGet("search")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public async Task<ActionResult<IReadOnlyCollection<PersonBasicResponse>>> SearchByName(string name)
        {
            var results = await _repository.SearchByName(name);

            return Ok(results);
        }
    }
}
