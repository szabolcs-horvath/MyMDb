using MyMDb.Server.DAL.Entities;

namespace MyMDb.Server.DAL
{
    public class MyMDbDbContext : DbContext
    {
        public MyMDbDbContext(DbContextOptions<MyMDbDbContext> options)
            : base(options) {}

        public DbSet<Movie> Movie { get; set; }
        public DbSet<Person> Person { get; set; }
        public DbSet<User> User { get; set; }

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
            modelBuilder.Entity<Movie>()
                .HasMany(m => m.Person)
                .WithMany(p => p.Movie)
                .UsingEntity(j => j.ToTable("MoviePersonJoiningTable"));
        }
    }
}
