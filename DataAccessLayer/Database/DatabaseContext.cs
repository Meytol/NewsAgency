using DataAccessLayer.Entities;
using Microsoft.EntityFrameworkCore;

namespace DataAccessLayer.Database
{
    public class DatabaseContext : DbContext
    {
        public DatabaseContext(DbContextOptions<DatabaseContext> options)
            : base(options)
        {
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
        }

        #region DbSet

        public DbSet<Action> Actions { get; set; }
        public DbSet<Advertise> Advertises { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<Comment> Comments { get; set; }
        public DbSet<HotNews> HotNewses { get; set; }
        public DbSet<Link> Links { get; set; }
        public DbSet<News> Newses { get; set; }
        public DbSet<NewsCategory> NewsCategories { get; set; }
        public DbSet<Role> Roles { get; set; }
        public DbSet<RoleAction> RoleActions { get; set; }
        public DbSet<Setting> Settings { get; set; }
        public DbSet<Subscriber> Subscribers { get; set; }
        public DbSet<User> Users { get; set; }
        public DbSet<UserRole> UserRoles { get; set; }

        #endregion
    }
}