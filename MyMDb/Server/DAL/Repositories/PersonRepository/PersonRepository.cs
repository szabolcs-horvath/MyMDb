using MyMDb.Server.DAL.Entities;
using MyMDb.Shared.CreateModel;
using MyMDb.Shared.DTOs.Person;
using MyMDb.Shared.SearchModel;

namespace MyMDb.Server.DAL.Repositories.PersonRepository
{
    public class PersonRepository : IPersonRepository
    {
        private readonly MyMDbDbContext _db;

        public PersonRepository(MyMDbDbContext db)
        {
            _db = db;
        }

        public IReadOnlyCollection<Person> GetAll()
        {
            var result = _db.Person
                .ToList();

            return result;
        }

        public async Task<Person?> Get(int id)
        {
            var dbRecord = await _db.Person.FindAsync(id);

            return dbRecord;
        }

        public async Task<Person?> GetExtended(int id)
        {
            var dbRecord = await _db.Person
                .Include(p => p.Movie)
                .FirstOrDefaultAsync(x => x.Id == id);

            return dbRecord;
        }

        public async Task<Person?> Insert(CreatePerson value)
        {
            var toInsert = new Person()
            {
                FullName = value.FullName,
                Birthdate = value.Birthdate,
                Birthplace = value.Birthplace
            };

            await _db.Person.AddAsync(toInsert);
            await _db.SaveChangesAsync();
            var result = await _db.Person.FindAsync(toInsert.Id);

            return result;
        }

        public async Task<Person?> Update(int id, PersonUpdateDto value)
        {
            var dbRecord = await _db.Person.FindAsync(id);

            if (dbRecord == null)
            {
                return null;
            }

            dbRecord.FullName = value.FullName ?? dbRecord.FullName;
            dbRecord.Birthdate = value.Birthdate ?? dbRecord.Birthdate;
            dbRecord.Birthplace = value.Birthplace ?? dbRecord.Birthplace;

            await _db.SaveChangesAsync();

            return dbRecord;
        }
        public async Task<Person?> Delete(int id)
        {
            var dbRecord = await _db.Person.FindAsync(id);

            if (dbRecord != null)
            {
                _db.Remove(dbRecord);
                await _db.SaveChangesAsync();
            }

            return dbRecord;
        }

        public async Task<IReadOnlyCollection<SearchPerson>> SearchByName(string name)
        {
            return await _db.Person
                .Where(p => p.FullName.Contains(name))
                .Select(p => new SearchPerson
                {
                    Id = p.Id,
                    FullName = p.FullName
                })
                .ToListAsync();
        }
    }
}
