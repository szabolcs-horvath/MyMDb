using MyMDb.Server.DAL.Entities;
using MyMDb.Shared.CreateModel;
using MyMDb.Shared.DTOs.Person;
using MyMDb.Shared.SearchModel;

namespace MyMDb.Server.DAL.Repositories.PersonRepository
{
    public interface IPersonRepository
    {
        //Has to be synchronous, otherwise serialization throws weird errors
        IReadOnlyCollection<Person> GetAll();
        Task<Person?> Get(int id);
        Task<Person?> GetExtended(int id);
        Task<Person?> Insert(CreatePerson value);
        Task<Person?> Update(int id, PersonUpdateDto value);
        Task<Person?> Delete(int id);
        Task<IReadOnlyCollection<SearchPerson>> SearchByName(string name);
    }
}
