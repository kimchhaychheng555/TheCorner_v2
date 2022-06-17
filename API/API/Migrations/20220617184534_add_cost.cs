using Microsoft.EntityFrameworkCore.Migrations;

namespace API.Migrations
{
    public partial class add_cost : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<decimal>(
                name: "cost",
                table: "data_product",
                type: "decimal(18,2)",
                nullable: true); 
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "cost",
                table: "data_product"); 
        }
    }
}
