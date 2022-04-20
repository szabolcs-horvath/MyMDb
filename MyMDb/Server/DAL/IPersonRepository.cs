using MyMDb.Shared.CreateModel;

namespace MyMDb.Server.DAL
{
    public interface IPersonRepository
    {
        IReadOnlyCollection<Person> GetAll();
        Task<Person?> Get(int id);
        Task<Person> Insert(CreatePerson value);
        Task<Person?> Update(Person value);
        Task<Person?> Delete(int id);
    }
}
