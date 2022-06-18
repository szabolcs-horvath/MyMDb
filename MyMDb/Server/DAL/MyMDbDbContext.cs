using MyMDb.Server.DAL.Entities;

namespace MyMDb.Server.DAL
{
    public class MyMDbDbContext : DbContext
    {
        public MyMDbDbContext(DbContextOptions<MyMDbDbContext> options)
            : base(options) {}

        public DbSet<Movie> Movie { get; set; }
        public DbSet<Person> Person { get; set; }
        public DbSet<MyMDbUser> MyMDbUser { get; set; }
        public DbSet<Rating> Rating { get; set; }
        public DbSet<Review> Review { get; set; }

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

            modelBuilder.Entity<Rating>()
                .HasOne(r => r.Movie)
                .WithMany(m => m.Ratings);

            modelBuilder.Entity<Rating>()
                .HasOne(r => r.MyMDbUser)
                .WithMany(u => u.Ratings);

            modelBuilder.Entity<Review>()
                .HasOne(r => r.Movie)
                .WithMany(m => m.Reviews);

            modelBuilder.Entity<Review>()
                .HasOne(r => r.MyMDbUser)
                .WithMany(u => u.Reviews);
        }
    }
}
