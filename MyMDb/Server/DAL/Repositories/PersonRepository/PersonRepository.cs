using MyMDb.Server.DAL.Entities;
using MyMDb.Shared.CreateModel;
using MyMDb.Shared.DTOs;
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

        public IReadOnlyCollection<PersonDto> GetAll()
        {
            var result = _db.Person
                .Select(p => p.ToDto())
                .ToList();

            return result;
        }

        public async Task<Person?> Get(int id)
        {
            var dbRecord = await _db.Person.FindAsync(id);

            return dbRecord;
        }

        public async Task<PersonDto?> GetExtended(int id)
        {
            var dbRecord = await _db.Person
                .Include(p => p.Movie)
                .FirstOrDefaultAsync(x => x.Id == id);

            return dbRecord?.ToDto();
        }

        public async Task<PersonDto?> Insert(CreatePerson value)
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

            return result?.ToDto();
        }

        public async Task<PersonDto?> Update(PersonDto value)
        {
            var dbRecord = await _db.Person.FindAsync(value.Id);

            if (dbRecord == null)
            {
                return null;
            }

            dbRecord.FullName = value.FullName;
            dbRecord.Birthdate = value.Birthdate;
            dbRecord.Birthplace = value.Birthplace;

            await _db.SaveChangesAsync();

            return dbRecord.ToDto();
        }
        public async Task<PersonDto?> Delete(int id)
        {
            var dbRecord = await _db.Person.FindAsync(id);

            if (dbRecord != null)
            {
                _db.Remove(dbRecord);
                await _db.SaveChangesAsync();
            }

            return dbRecord?.ToDto();
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
