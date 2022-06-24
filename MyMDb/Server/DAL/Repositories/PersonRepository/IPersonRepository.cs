using MyMDb.Server.DAL.Entities;
using MyMDb.Shared.DTOs.Person;

namespace MyMDb.Server.DAL.Repositories.PersonRepository
{
    public interface IPersonRepository
    {
        //Has to be synchronous, otherwise serialization throws weird errors
        IReadOnlyCollection<Person> GetAll();
        Task<Person?> Get(int id);
        Task<Person?> GetExtended(int id);
        Task<Person?> Insert(PersonCreateDto value);
        Task<Person?> Update(int id, PersonUpdateDto value);
        Task<Person?> Delete(int id);
        Task<IReadOnlyCollection<Person>> SearchByName(string name);
    }
}
