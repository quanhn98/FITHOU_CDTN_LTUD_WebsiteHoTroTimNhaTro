namespace WebForm.SqlServer
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;
    using Microsoft.Ajax.Utilities;

    public partial class AppContext : DbContext
    {
        public AppContext()
            : base("name=AppContext")
        {
        }

        public virtual DbSet<City> City { get; set; }
        public virtual DbSet<District> District { get; set; }
        public virtual DbSet<Line> Line { get; set; }
        public virtual DbSet<Post> Post { get; set; }
        public virtual DbSet<Province> Province { get; set; }
        public virtual DbSet<User> User { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<User>()
                .Property(e => e.UserName)
                .IsFixedLength();

            modelBuilder.Entity<User>()
                .Property(e => e.Password)
                .IsFixedLength();
        }
    }

    public class AppResultModel<T>
    {
        public bool Succeeded { get; set; }
        public string Message { get; set; }
        public Exception Exception { get; set; }
        public T Data { get; set; }

        public static AppResultModel<T> Failed(Exception exception, string message)
        {
            return new AppResultModel<T>() { Succeeded = false, Exception = exception, Message = message??exception.Message };
        }
        public AppResultModel<T> ResultSucceeded()
        {
            this.Succeeded = true;
            return this;
        }
    }
}
