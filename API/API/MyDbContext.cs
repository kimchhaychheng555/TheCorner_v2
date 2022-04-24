using API.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace API
{
    public class MyDbContext : DbContext
    {
        public MyDbContext(DbContextOptions<MyDbContext> options) : base(options)
        {

        }
        public DbSet<CategoryModel> Categories { get; set; }
        public DbSet<DocumentModel> Documents { get; set; }
        public DbSet<PermissionModel> Permissions { get; set; }
        public DbSet<PrintModel> Prints { get; set; }
        public DbSet<ProductModel> Products { get; set; }
        public DbSet<RoleModel> Roles { get; set; }
        public DbSet<SaleModel> Sales { get; set; }
        public DbSet<SaleProductModel> SaleProducts{ get; set; }
        public DbSet<StockInventoryModel> StockInventories { get; set; }
        public DbSet<StockTransactionModel> StockTransactions { get; set; }
        public DbSet<TableModel> Tables { get; set; }
        public DbSet<UserModel> Users { get; set; }
    }
}
