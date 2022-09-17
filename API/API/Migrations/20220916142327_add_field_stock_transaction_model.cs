using Microsoft.EntityFrameworkCore.Migrations;

namespace API.Migrations
{
    public partial class add_field_stock_transaction_model : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "sale_date",
                table: "data_stock_transaction",
                type: "nvarchar(max)",
                nullable: true,
                collation: "Khmer_100_BIN");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "sale_date",
                table: "data_stock_transaction");
        }
    }
}
