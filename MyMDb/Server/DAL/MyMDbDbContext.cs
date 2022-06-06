using Microsoft.EntityFrameworkCore;
using MyMDb.Server.DAL.Entities;

namespace MyMDb.Server.DAL
{
    public class MyMDbDbContext : DbContext
    {
        public MyMDbDbContext(DbContextOptions<MyMDbDbContext> options, DbSet<DbMovie> movie, DbSet<DbPerson> person)
            : base(options)
        {
            Movie = movie;
            Person = person;
        }

        public DbSet<DbMovie> Movie { get; set; }
        public DbSet<DbPerson> Person { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            var configuration = new ConfigurationBuilder()
                .SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile("appsettings.json")
                .Build();

            var connectionString = configuration.GetConnectionString("MyMDbDbContext");
            optionsBuilder.UseSqlServer(connectionString);
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<DbMovie>()
                .HasMany(m => m.Person)
                .WithMany(p => p.Movie)
                .UsingEntity(j => j.ToTable("MoviePersonJoiningTable"));
        }
    }
}
