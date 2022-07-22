using Microsoft.EntityFrameworkCore.Migrations;

namespace API.Migrations
{
    public partial class update_sale_product_discount : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<decimal>(
                name: "discount",
                table: "data_sale_product",
                type: "decimal(18,2)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "discount_type",
                table: "data_sale_product",
                type: "nvarchar(max)",
                nullable: true,
                collation: "Khmer_100_BIN");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "discount",
                table: "data_sale_product");

            migrationBuilder.DropColumn(
                name: "discount_type",
                table: "data_sale_product");
        }
    }
}
