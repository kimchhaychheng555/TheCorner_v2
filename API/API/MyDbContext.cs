using API.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Threading.Tasks;

namespace API
{
    public class MyDbContext : DbContext
    {
         
        public MyDbContext(DbContextOptions<MyDbContext> options, IConfiguration configuration) : base(options) {

            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        protected override void OnModelCreating(ModelBuilder builder)
        {

            foreach (var property in builder.Model.GetEntityTypes().SelectMany(t => t.GetProperties()).Where(p => p.ClrType == typeof(decimal)))
            {
                 
                property.SetColumnType("decimal(19,5)");
                
            }

            foreach (var property in builder.Model.GetEntityTypes().SelectMany(t => t.GetProperties()).Where(p => p.ClrType == typeof(string)))
            {
                property.SetCollation("Khmer_100_BIN");
            }

            foreach (var property in builder.Model.GetEntityTypes().SelectMany(t => t.GetProperties()).Where(p => p.ClrType == typeof(Guid)))
            {
                if (Configuration.GetSection("Database").Value == "MySql")
                {
                    property.SetColumnType("varbinary(36)");
                } 
            }

            foreach (var property in builder.Model.GetEntityTypes().SelectMany(t => t.GetProperties()))
            {
                if(property.GetColumnBaseName() == "is_deleted")
                {
                    property.SetDefaultValue(false);
                }

                if (property.GetColumnBaseName() == "created_date")
                {
                    property.SetDefaultValueSql("getDate()");
                }

                if (property.GetColumnBaseName() == "deleted_date")
                {
                    property.SetDefaultValueSql("getDate()");
                } 
            }

        }

        public DbSet<CategoryModel> Categories { get; set; }
        public DbSet<DocumentModel> Documents { get; set; }
        public DbSet<PermissionModel> Permissions { get; set; }
        public DbSet<PrintModel> Prints { get; set; }
        public DbSet<PaymentMethodModel> PaymentMethods { get; set; }
        public DbSet<ProductModel> Products { get; set; }
        public DbSet<RoleModel> Roles { get; set; }
        public DbSet<SaleModel> Sales { get; set; }
        public DbSet<SalePaymentModel> SalePayments { get; set; }
        public DbSet<SaleProductModel> SaleProducts{ get; set; }
        public DbSet<StockInventoryModel> StockInventories { get; set; }
        public DbSet<StockTransactionModel> StockTransactions { get; set; }
        public DbSet<TableModel> Tables { get; set; }
        public DbSet<UserModel> Users { get; set; }
    }
}
