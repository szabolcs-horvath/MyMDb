using Microsoft.AspNetCore.Mvc;
using MyMDb.Server.DAL.Entities;
using MyMDb.Server.DAL.Repositories.PersonRepository;
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
        public ActionResult<List<PersonBasicResponse>> GetAll()
        {
            var result = _repository.GetAll().Select(p => p.ToBasicResponse());

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
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult<PersonBasicResponse>> Insert([FromBody] PersonCreateDto person)
        {
            var created = await _repository.Insert(person);

            if (created is null)
            {
                return BadRequest();
            }

            return CreatedAtAction(nameof(Get), new { id = created.Id }, created.ToBasicResponse());
        }

        [HttpPatch("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<ActionResult<PersonBasicResponse>> Update(int id, [FromBody] PersonUpdateDto value)
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
        public async Task<ActionResult<PersonBasicResponse>> Delete(int id)
        {
            var person = await _repository.Delete(id);

            if (person == null)
            {
                return NotFound();
            }

            return Ok(person.ToBasicResponse());
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
