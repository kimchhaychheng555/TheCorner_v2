using Microsoft.EntityFrameworkCore.Migrations;

namespace API.Migrations
{
    public partial class updatestocktransaction : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<bool>(
                name: "status",
                table: "data_stock_transaction",
                type: "bit",
                nullable: true,
                defaultValue: false);

            migrationBuilder.AlterColumn<bool>(
                name: "status",
                table: "data_sale",
                type: "bit",
                nullable: true,
                defaultValue: false,
                oldClrType: typeof(bool),
                oldType: "bit",
                oldNullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "status",
                table: "data_stock_transaction");

            migrationBuilder.AlterColumn<bool>(
                name: "status",
                table: "data_sale",
                type: "bit",
                nullable: true,
                oldClrType: typeof(bool),
                oldType: "bit",
                oldNullable: true,
                oldDefaultValue: false);
        }
    }
}
