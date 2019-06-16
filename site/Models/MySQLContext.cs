using Microsoft.EntityFrameworkCore;
namespace Lcol.Models
{
    public class MySQLContext : DbContext
    {
        public MySQLContext(DbContextOptions options) : base(options)
        {
            this.Database.EnsureCreated();
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
        }

        public DbSet<RawData> RawDatas { get; set; }
    }
}
