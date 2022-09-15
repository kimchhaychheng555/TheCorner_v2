using Microsoft.EntityFrameworkCore.Migrations;

namespace API.Migrations
{
    public partial class updatedatabaseff : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "attachments",
                table: "data_expense");

            migrationBuilder.DropColumn(
                name: "ref_number",
                table: "data_expense");

            migrationBuilder.AddColumn<double>(
                name: "exchange_rate",
                table: "data_expense",
                type: "float",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "exchange_rate",
                table: "data_expense");

            migrationBuilder.AddColumn<string>(
                name: "attachments",
                table: "data_expense",
                type: "nvarchar(max)",
                nullable: true,
                collation: "Khmer_100_BIN");

            migrationBuilder.AddColumn<string>(
                name: "ref_number",
                table: "data_expense",
                type: "nvarchar(max)",
                nullable: true,
                collation: "Khmer_100_BIN");
        }
    }
}
