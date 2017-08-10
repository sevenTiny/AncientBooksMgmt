namespace QX_Frame.Data.Entities
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;
    using QX_Frame.Data.Configs;

    public partial class DB_QX_Frame_MS_CMS : DbContext
    {
        public DB_QX_Frame_MS_CMS()
            : base(QX_Frame_Data_Config.ConnectionString_DB_QX_Frame_CMS)
        {
        }

        public virtual DbSet<TB_Book> TB_Book { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
        }
    }
}
