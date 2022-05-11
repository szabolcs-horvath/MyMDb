using Microsoft.EntityFrameworkCore;
using MyMDb.Shared.CreateModel;
using MyMDb.Shared.SearchModel;

namespace MyMDb.Server.DAL
{
    public class PersonRepository : IPersonRepository
    {
        private readonly MyMDbDbContext db;

        public PersonRepository(MyMDbDbContext db)
        {
            this.db = db;
        }

        public async Task<Person?> Delete(int id)
        {
            var dbRecord = await db.Person.Include(p => p.Movie).FirstOrDefaultAsync(x => x.Id == id);
            if (dbRecord != null)
            {
                db.Remove(dbRecord);
                await db.SaveChangesAsync();
            }
            return dbRecord == null ? null : ToModel(dbRecord);
        }

        public async Task<Person?> Get(int id)
        {
            var dbRecord = await db.Person.Include(p => p.Movie).FirstOrDefaultAsync(x => x.Id == id);
            return dbRecord == null ? null : ToModel(dbRecord);
        }

        public IReadOnlyCollection<Person> GetAll()
        {
            return db.Person.Include(p => p.Movie).Select(ToModel).ToList();
        }

        public async Task<Person> Insert(CreatePerson value)
        {
            var toInsert = new DbPerson()
            {
                FullName = value.FullName,
                Birthdate = value.Birthdate,
                Birthplace = value.Birthplace
            };

            await db.Person.AddAsync(toInsert);
            await db.SaveChangesAsync();
            var result = await db.Person.Include(p => p.Movie).FirstOrDefaultAsync(p => p.Id == toInsert.Id);

            return ToModel(result ?? toInsert);
        }

        public async Task<IReadOnlyCollection<SearchPerson>> SearchByName(string name)
        {
            return await db.Person.Where(p => p.FullName.Contains(name)).Select(p => ToSearchModel(p)).ToListAsync();
        }

        public async Task<Person?> Update(Person value)
        {
            var dbRecord = await db.Person.Include(p => p.Movie).FirstOrDefaultAsync(p => p.Id == value.Id);
            if (dbRecord == null)
            {
                return null;
            } else
            {
                dbRecord.FullName = value.FullName;
                dbRecord.Birthdate = value.Birthdate;
                dbRecord.Birthplace = value.Birthplace;

                await db.SaveChangesAsync();
            }

            return ToModel(dbRecord);
        }

        private static Person ToModel(DbPerson value)
        {
            if (value is null)
            {
                throw new ArgumentNullException(nameof(value));
            }

            return new Person(
                value.Id,
                value.FullName,
                value.Birthdate,
                value.Birthplace,
                value.Movie?.Select(m => m.Title ?? ""));
        }

        private static SearchPerson ToSearchModel(DbPerson value)
        {
            if (value is null)
            {
                throw new ArgumentNullException(nameof(value));
            }

            return new SearchPerson(value.Id, value.FullName);
        }
    }
}
