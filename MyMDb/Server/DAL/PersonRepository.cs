using Microsoft.EntityFrameworkCore;
using MyMDb.Server.DAL.Entities;
using MyMDb.Shared.CreateModel;
using MyMDb.Shared.SearchModel;

namespace MyMDb.Server.DAL
{
    public class PersonRepository : IPersonRepository
    {
        private readonly MyMDbDbContext _db;

        public PersonRepository(MyMDbDbContext db)
        {
            this._db = db;
        }

        public async Task<Person?> Delete(int id)
        {
            var dbRecord = await _db.Person.Include(p => p.Movie).FirstOrDefaultAsync(x => x.Id == id);
            if (dbRecord != null)
            {
                _db.Remove(dbRecord);
                await _db.SaveChangesAsync();
            }
            return dbRecord == null ? null : ToModel(dbRecord);
        }

        public async Task<Person?> Get(int id)
        {
            var dbRecord = await _db.Person.Include(p => p.Movie).FirstOrDefaultAsync(x => x.Id == id);
            return dbRecord == null ? null : ToModel(dbRecord);
        }

        public IReadOnlyCollection<Person> GetAll()
        {
            return _db.Person.Include(p => p.Movie).Select(ToModel).ToList();
        }

        public async Task<Person> Insert(CreatePerson value)
        {
            var toInsert = new DbPerson()
            {
                FullName = value.FullName,
                Birthdate = value.Birthdate,
                Birthplace = value.Birthplace
            };

            await _db.Person.AddAsync(toInsert);
            await _db.SaveChangesAsync();
            var result = await _db.Person.Include(p => p.Movie).FirstOrDefaultAsync(p => p.Id == toInsert.Id);

            return ToModel(result ?? toInsert);
        }

        public async Task<IReadOnlyCollection<SearchPerson>> SearchByName(string name)
        {
            return await _db.Person.Where(p => p.FullName.Contains(name)).Select(p => new SearchPerson(p.Id, p.FullName)).ToListAsync();
        }

        public async Task<Person?> Update(Person value)
        {
            var dbRecord = await _db.Person.Include(p => p.Movie).FirstOrDefaultAsync(p => p.Id == value.Id);
            if (dbRecord == null)
            {
                return null;
            } else
            {
                dbRecord.FullName = value.FullName;
                dbRecord.Birthdate = value.Birthdate;
                dbRecord.Birthplace = value.Birthplace;

                await _db.SaveChangesAsync();
            }

            return ToModel(dbRecord);
        }

        private static Person ToModel(DbPerson value)
        {
            if (value is null)
            {
                throw new ArgumentNullException(nameof(value));
            }

            return new Person
            {
                Id = value.Id,
                FullName = value.FullName,
                Birthdate = value.Birthdate,
                Birthplace = value.Birthplace,
                Movies = value.Movie.Select(m => m.Title ?? "")
            };
        }
    }
}
