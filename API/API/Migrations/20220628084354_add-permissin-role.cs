using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace API.Migrations
{
    public partial class addpermissinrole : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "data_permission_role",
                columns: table => new
                {
                    id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    role_id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    permission_id = table.Column<Guid>(type: "uniqueidentifier", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_data_permission_role", x => x.id);
                    table.ForeignKey(
                        name: "FK_data_permission_role_data_permission_permission_id",
                        column: x => x.permission_id,
                        principalTable: "data_permission",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_data_permission_role_data_role_role_id",
                        column: x => x.role_id,
                        principalTable: "data_role",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_data_permission_role_permission_id",
                table: "data_permission_role",
                column: "permission_id");

            migrationBuilder.CreateIndex(
                name: "IX_data_permission_role_role_id",
                table: "data_permission_role",
                column: "role_id");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "data_permission_role");
        }
    }
}
