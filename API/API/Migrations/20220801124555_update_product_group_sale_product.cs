using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace API.Migrations
{
    public partial class update_product_group_sale_product : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<Guid>(
                name: "product_group_id",
                table: "data_sale_product",
                type: "uniqueidentifier",
                nullable: true,
                defaultValue: new Guid("00000000-0000-0000-0000-000000000000"));

            migrationBuilder.CreateIndex(
                name: "IX_data_sale_product_product_group_id",
                table: "data_sale_product",
                column: "product_group_id");

            migrationBuilder.AddForeignKey(
                name: "FK_data_sale_product_data_product_group_product_group_id",
                table: "data_sale_product",
                column: "product_group_id",
                principalTable: "data_product_group",
                principalColumn: "id",
                onDelete: ReferentialAction.NoAction);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_data_sale_product_data_product_group_product_group_id",
                table: "data_sale_product");

            migrationBuilder.DropIndex(
                name: "IX_data_sale_product_product_group_id",
                table: "data_sale_product");

            migrationBuilder.DropColumn(
                name: "product_group_id",
                table: "data_sale_product");
        }
    }
}
