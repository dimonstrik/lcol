using Microsoft.Extensions.Configuration;
using Microsoft.EntityFrameworkCore;
using System.IO;
using System;

namespace Lcol.Models
{
    public class MySQLContext : DbContext
    {
        public IConfiguration Configuration { get; }
        public DbSet<RawData> RawDatas { get; set; }

        public DbSet<Building> Buildings { get; set; }
        public DbSet<Apartment> Apartments { get; set; }
        public DbSet<Owner> Owners { get; set; }

        public DbSet<Device> Devices { get; set; }
        public DbSet<Indication> Indications { get; set; }

        public MySQLContext()
        {
            Configuration = new ConfigurationBuilder()
                .SetBasePath(Directory.GetParent(AppContext.BaseDirectory).FullName)
                .AddJsonFile("appsettings.json", false)
                .Build();

            this.Database.EnsureCreated();
        }

        public MySQLContext(DbContextOptions options) : base(options)
        {
            this.Database.EnsureCreated();
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseMySQL(Configuration.GetConnectionString("MySqlConnection"));
        }
    }
}
