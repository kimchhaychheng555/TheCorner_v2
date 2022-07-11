using Microsoft.EntityFrameworkCore.Migrations;

namespace API.Migrations
{
    public partial class update_sale_product_model : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "is_remove_stock_done",
                table: "data_sale_product",
                newName: "stockable");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "stockable",
                table: "data_sale_product",
                newName: "is_remove_stock_done");
        }
    }
}
