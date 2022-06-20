using Microsoft.AspNetCore.Mvc;
using MyMDb.Server.DAL.Entities;
using MyMDb.Server.DAL.Repositories.RatingRepository;
using MyMDb.Shared.DTOs.Rating;
using MyMDb.Shared.ResponseModel.Rating;

namespace MyMDb.Server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RatingController : ControllerBase
    {
        private readonly IRatingRepository _repository;

        public RatingController(IRatingRepository repository)
        {
            _repository = repository;
        }

        [HttpGet("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<ActionResult<RatingResponse>> Get(int id, [FromQuery] string? extended)
        {
            Rating? result;

            if (string.Compare(extended, "full", StringComparison.OrdinalIgnoreCase) == 0)
            {
                result = await _repository.GetExtended(id);
            }
            else
            {
                result = await _repository.Get(id);
            }

            if (result is null)
            {
                return NotFound();
            }

            return Ok(result.ToResponse());
        }

        [HttpGet("movie/{movieId}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public async Task<ActionResult<ICollection<RatingBasicResponse>>> GetAllForMovie(int movieId)
        {
            var result = await _repository.GetAllForMovie(movieId);

            return Ok(result.Select(r => r.ToBasicResponse()));
        }

        [HttpGet("user/{userId}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public async Task<ActionResult<ICollection<RatingBasicResponse>>> GetAllForUser(int userId)
        {
            var result = await _repository.GetAllForUser(userId);
            
            return Ok(result.Select(r => r.ToBasicResponse()));
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult<RatingBasicResponse>> Insert(RatingCreateDto rating)
        {
            var created = await _repository.Insert(rating);

            if (created is null)
            {
                return BadRequest();
            }

            return CreatedAtAction(nameof(Get), new { id = created.Id }, created.ToBasicResponse());
        }

        [HttpPatch("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<ActionResult<RatingBasicResponse>> Update(int id, [FromBody] RatingUpdateDto value)
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
        public async Task<ActionResult<RatingBasicResponse>> Delete(int id)
        {
            var rating = await _repository.Delete(id);

            if (rating is null)
            {
                return NotFound();
            }

            return Ok(rating.ToBasicResponse());
        }
    }
}
