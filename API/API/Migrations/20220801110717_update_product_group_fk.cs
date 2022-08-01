using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace API.Migrations
{
    public partial class update_product_group_fk : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_data_product_data_product_group_ProductGroupModelid",
                table: "data_product");

            migrationBuilder.DropIndex(
                name: "IX_data_product_ProductGroupModelid",
                table: "data_product");

            migrationBuilder.DropColumn(
                name: "ProductGroupModelid",
                table: "data_product");

            migrationBuilder.AddColumn<Guid>(
                name: "product_group_id",
                table: "data_product",
                type: "uniqueidentifier",
                nullable: false,
                defaultValue: new Guid("00000000-0000-0000-0000-000000000000"));

            migrationBuilder.CreateIndex(
                name: "IX_data_product_product_group_id",
                table: "data_product",
                column: "product_group_id");

            migrationBuilder.AddForeignKey(
                name: "FK_data_product_data_product_group_product_group_id",
                table: "data_product",
                column: "product_group_id",
                principalTable: "data_product_group",
                principalColumn: "id",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_data_product_data_product_group_product_group_id",
                table: "data_product");

            migrationBuilder.DropIndex(
                name: "IX_data_product_product_group_id",
                table: "data_product");

            migrationBuilder.DropColumn(
                name: "product_group_id",
                table: "data_product");

            migrationBuilder.AddColumn<Guid>(
                name: "ProductGroupModelid",
                table: "data_product",
                type: "uniqueidentifier",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_data_product_ProductGroupModelid",
                table: "data_product",
                column: "ProductGroupModelid");

            migrationBuilder.AddForeignKey(
                name: "FK_data_product_data_product_group_ProductGroupModelid",
                table: "data_product",
                column: "ProductGroupModelid",
                principalTable: "data_product_group",
                principalColumn: "id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
