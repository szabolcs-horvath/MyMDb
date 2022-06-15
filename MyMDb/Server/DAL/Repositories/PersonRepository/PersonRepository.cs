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

        public async Task<PersonDto?> Delete(int id)
        {
            var dbRecord = await _db.Person
                .Include(p => p.Movie)
                .FirstOrDefaultAsync(x => x.Id == id);

            if (dbRecord != null)
            {
                _db.Remove(dbRecord);
                await _db.SaveChangesAsync();
            }

            return dbRecord?.ToDto();
        }

        public async Task<PersonDto?> Get(int id)
        {
            var dbRecord = await _db.Person
                .Include(p => p.Movie)
                .FirstOrDefaultAsync(x => x.Id == id);

            return dbRecord?.ToDto();
        }

        public async Task<IReadOnlyCollection<PersonDto>> GetAll()
        {
            return await _db.Person
                .Include(p => p.Movie)
                .Select(p => p.ToDto())
                .ToListAsync();
        }

        public async Task<PersonDto> Insert(CreatePerson value)
        {
            var toInsert = new Person()
            {
                FullName = value.FullName,
                Birthdate = value.Birthdate,
                Birthplace = value.Birthplace
            };

            await _db.Person.AddAsync(toInsert);
            await _db.SaveChangesAsync();
            var result = await _db.Person
                .Include(p => p.Movie)
                .FirstOrDefaultAsync(p => p.Id == toInsert.Id);

            return result?.ToDto() ?? toInsert.ToDto();
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

        public async Task<PersonDto?> Update(PersonDto value)
        {
            var dbRecord = await _db.Person
                .Include(p => p.Movie)
                .FirstOrDefaultAsync(p => p.Id == value.Id);

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
    }
}
