using Microsoft.EntityFrameworkCore;

namespace MyMDb.Server.Data
{
    public class MyMDbDbContext : DbContext
    {
        public MyMDbDbContext(DbContextOptions<MyMDbDbContext> options)
            : base(options) { }

        public DbSet<Movie> Movie { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            var configuration = new ConfigurationBuilder()
                .SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile("appsettings.json")
                .Build();

            var connectionString = configuration.GetConnectionString("MyMDbDbContext");
            optionsBuilder.UseSqlServer(connectionString);
        }
    }
}
