using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace API.Migrations
{
    public partial class create_databs : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "data_category",
                columns: table => new
                {
                    id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    name = table.Column<string>(type: "nvarchar(max)", nullable: true, collation: "Khmer_100_BIN"),
                    created_date = table.Column<DateTime>(type: "datetime2", nullable: true, defaultValueSql: "getDate()"),
                    created_by = table.Column<string>(type: "nvarchar(max)", nullable: true, collation: "Khmer_100_BIN"),
                    is_deleted = table.Column<bool>(type: "bit", nullable: true, defaultValue: false),
                    deleted_date = table.Column<DateTime>(type: "datetime2", nullable: true, defaultValueSql: "getDate()"),
                    deleted_by = table.Column<string>(type: "nvarchar(max)", nullable: true, collation: "Khmer_100_BIN")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_data_category", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "data_document",
                columns: table => new
                {
                    id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    key_name = table.Column<string>(type: "nvarchar(max)", nullable: true, collation: "Khmer_100_BIN"),
                    label = table.Column<string>(type: "nvarchar(max)", nullable: true, collation: "Khmer_100_BIN"),
                    value = table.Column<string>(type: "nvarchar(max)", nullable: true, collation: "Khmer_100_BIN")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_data_document", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "data_payment_method",
                columns: table => new
                {
                    id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    payment_method_name = table.Column<string>(type: "nvarchar(max)", nullable: true, collation: "Khmer_100_BIN"),
                    created_date = table.Column<DateTime>(type: "datetime2", nullable: true, defaultValueSql: "getDate()"),
                    created_by = table.Column<string>(type: "nvarchar(max)", nullable: true, collation: "Khmer_100_BIN"),
                    is_deleted = table.Column<bool>(type: "bit", nullable: true, defaultValue: false),
                    deleted_date = table.Column<DateTime>(type: "datetime2", nullable: true, defaultValueSql: "getDate()"),
                    deleted_by = table.Column<string>(type: "nvarchar(max)", nullable: true, collation: "Khmer_100_BIN")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_data_payment_method", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "data_role",
                columns: table => new
                {
                    id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    name = table.Column<string>(type: "nvarchar(max)", nullable: true, collation: "Khmer_100_BIN"),
                    created_date = table.Column<DateTime>(type: "datetime2", nullable: true, defaultValueSql: "getDate()"),
                    created_by = table.Column<string>(type: "nvarchar(max)", nullable: true, collation: "Khmer_100_BIN"),
                    is_deleted = table.Column<bool>(type: "bit", nullable: true, defaultValue: false),
                    deleted_date = table.Column<DateTime>(type: "datetime2", nullable: true, defaultValueSql: "getDate()"),
                    deleted_by = table.Column<string>(type: "nvarchar(max)", nullable: true, collation: "Khmer_100_BIN")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_data_role", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "data_table",
                columns: table => new
                {
                    id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    name = table.Column<string>(type: "nvarchar(max)", nullable: true, collation: "Khmer_100_BIN"),
                    created_date = table.Column<DateTime>(type: "datetime2", nullable: true, defaultValueSql: "getDate()"),
                    created_by = table.Column<string>(type: "nvarchar(max)", nullable: true, collation: "Khmer_100_BIN"),
                    is_deleted = table.Column<bool>(type: "bit", nullable: true, defaultValue: false),
                    deleted_date = table.Column<DateTime>(type: "datetime2", nullable: true, defaultValueSql: "getDate()"),
                    deleted_by = table.Column<string>(type: "nvarchar(max)", nullable: true, collation: "Khmer_100_BIN")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_data_table", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "data_product",
                columns: table => new
                {
                    id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    name = table.Column<string>(type: "nvarchar(max)", nullable: true, collation: "Khmer_100_BIN"),
                    price = table.Column<decimal>(type: "decimal(19,5)", nullable: false),
                    image = table.Column<string>(type: "nvarchar(max)", nullable: true, collation: "Khmer_100_BIN"),
                    stockable = table.Column<bool>(type: "bit", nullable: false),
                    category_id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    created_date = table.Column<DateTime>(type: "datetime2", nullable: true, defaultValueSql: "getDate()"),
                    created_by = table.Column<string>(type: "nvarchar(max)", nullable: true, collation: "Khmer_100_BIN"),
                    is_deleted = table.Column<bool>(type: "bit", nullable: true, defaultValue: false),
                    deleted_date = table.Column<DateTime>(type: "datetime2", nullable: true, defaultValueSql: "getDate()"),
                    deleted_by = table.Column<string>(type: "nvarchar(max)", nullable: true, collation: "Khmer_100_BIN")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_data_product", x => x.id);
                    table.ForeignKey(
                        name: "FK_data_product_data_category_category_id",
                        column: x => x.category_id,
                        principalTable: "data_category",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "data_permission",
                columns: table => new
                {
                    id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    slug = table.Column<string>(type: "nvarchar(max)", nullable: true, collation: "Khmer_100_BIN"),
                    description = table.Column<string>(type: "nvarchar(max)", nullable: true, collation: "Khmer_100_BIN"),
                    role_id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    created_date = table.Column<DateTime>(type: "datetime2", nullable: true, defaultValueSql: "getDate()"),
                    created_by = table.Column<string>(type: "nvarchar(max)", nullable: true, collation: "Khmer_100_BIN"),
                    is_deleted = table.Column<bool>(type: "bit", nullable: true, defaultValue: false),
                    deleted_date = table.Column<DateTime>(type: "datetime2", nullable: true, defaultValueSql: "getDate()"),
                    deleted_by = table.Column<string>(type: "nvarchar(max)", nullable: true, collation: "Khmer_100_BIN")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_data_permission", x => x.id);
                    table.ForeignKey(
                        name: "FK_data_permission_data_role_role_id",
                        column: x => x.role_id,
                        principalTable: "data_role",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "data_user",
                columns: table => new
                {
                    id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    fullname = table.Column<string>(type: "nvarchar(max)", nullable: true, collation: "Khmer_100_BIN"),
                    username = table.Column<string>(type: "nvarchar(max)", nullable: true, collation: "Khmer_100_BIN"),
                    password = table.Column<string>(type: "nvarchar(max)", nullable: true, collation: "Khmer_100_BIN"),
                    profile = table.Column<string>(type: "nvarchar(max)", nullable: true, collation: "Khmer_100_BIN"),
                    role_id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    created_date = table.Column<DateTime>(type: "datetime2", nullable: true, defaultValueSql: "getDate()"),
                    created_by = table.Column<string>(type: "nvarchar(max)", nullable: true, collation: "Khmer_100_BIN"),
                    is_deleted = table.Column<bool>(type: "bit", nullable: true, defaultValue: false),
                    deleted_date = table.Column<DateTime>(type: "datetime2", nullable: true, defaultValueSql: "getDate()"),
                    deleted_by = table.Column<string>(type: "nvarchar(max)", nullable: true, collation: "Khmer_100_BIN")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_data_user", x => x.id);
                    table.ForeignKey(
                        name: "FK_data_user_data_role_role_id",
                        column: x => x.role_id,
                        principalTable: "data_role",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "data_sale",
                columns: table => new
                {
                    id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    invoice_number = table.Column<string>(type: "nvarchar(max)", nullable: true, collation: "Khmer_100_BIN"),
                    vat = table.Column<decimal>(type: "decimal(19,5)", nullable: false),
                    sub_total = table.Column<decimal>(type: "decimal(19,5)", nullable: false),
                    discount_type = table.Column<string>(type: "nvarchar(max)", nullable: true, collation: "Khmer_100_BIN"),
                    discount = table.Column<decimal>(type: "decimal(19,5)", nullable: false),
                    grand_total = table.Column<decimal>(type: "decimal(19,5)", nullable: false),
                    is_paid = table.Column<bool>(type: "bit", nullable: false),
                    status = table.Column<bool>(type: "bit", nullable: false),
                    sale_date = table.Column<string>(type: "nvarchar(max)", nullable: true, collation: "Khmer_100_BIN"),
                    table_id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    created_date = table.Column<DateTime>(type: "datetime2", nullable: true, defaultValueSql: "getDate()"),
                    created_by = table.Column<string>(type: "nvarchar(max)", nullable: true, collation: "Khmer_100_BIN"),
                    is_deleted = table.Column<bool>(type: "bit", nullable: true, defaultValue: false),
                    deleted_date = table.Column<DateTime>(type: "datetime2", nullable: true, defaultValueSql: "getDate()"),
                    deleted_by = table.Column<string>(type: "nvarchar(max)", nullable: true, collation: "Khmer_100_BIN")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_data_sale", x => x.id);
                    table.ForeignKey(
                        name: "FK_data_sale_data_table_table_id",
                        column: x => x.table_id,
                        principalTable: "data_table",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "data_stock_inventory",
                columns: table => new
                {
                    id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    quantity_stock = table.Column<decimal>(type: "decimal(19,5)", nullable: false),
                    min_quantity = table.Column<decimal>(type: "decimal(19,5)", nullable: false),
                    product_id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    created_date = table.Column<DateTime>(type: "datetime2", nullable: true, defaultValueSql: "getDate()"),
                    created_by = table.Column<string>(type: "nvarchar(max)", nullable: true, collation: "Khmer_100_BIN"),
                    is_deleted = table.Column<bool>(type: "bit", nullable: true, defaultValue: false),
                    deleted_date = table.Column<DateTime>(type: "datetime2", nullable: true, defaultValueSql: "getDate()"),
                    deleted_by = table.Column<string>(type: "nvarchar(max)", nullable: true, collation: "Khmer_100_BIN")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_data_stock_inventory", x => x.id);
                    table.ForeignKey(
                        name: "FK_data_stock_inventory_data_product_product_id",
                        column: x => x.product_id,
                        principalTable: "data_product",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "data_stock_transaction",
                columns: table => new
                {
                    id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    quantity = table.Column<decimal>(type: "decimal(19,5)", nullable: false),
                    type = table.Column<string>(type: "nvarchar(max)", nullable: true, collation: "Khmer_100_BIN"),
                    product_id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    created_date = table.Column<DateTime>(type: "datetime2", nullable: true, defaultValueSql: "getDate()"),
                    created_by = table.Column<string>(type: "nvarchar(max)", nullable: true, collation: "Khmer_100_BIN"),
                    is_deleted = table.Column<bool>(type: "bit", nullable: true, defaultValue: false),
                    deleted_date = table.Column<DateTime>(type: "datetime2", nullable: true, defaultValueSql: "getDate()"),
                    deleted_by = table.Column<string>(type: "nvarchar(max)", nullable: true, collation: "Khmer_100_BIN")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_data_stock_transaction", x => x.id);
                    table.ForeignKey(
                        name: "FK_data_stock_transaction_data_product_product_id",
                        column: x => x.product_id,
                        principalTable: "data_product",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "data_print",
                columns: table => new
                {
                    id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    key = table.Column<string>(type: "nvarchar(max)", nullable: true, collation: "Khmer_100_BIN"),
                    sale_id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    created_date = table.Column<DateTime>(type: "datetime2", nullable: true, defaultValueSql: "getDate()"),
                    created_by = table.Column<string>(type: "nvarchar(max)", nullable: true, collation: "Khmer_100_BIN"),
                    is_deleted = table.Column<bool>(type: "bit", nullable: true, defaultValue: false),
                    deleted_date = table.Column<DateTime>(type: "datetime2", nullable: true, defaultValueSql: "getDate()"),
                    deleted_by = table.Column<string>(type: "nvarchar(max)", nullable: true, collation: "Khmer_100_BIN")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_data_print", x => x.id);
                    table.ForeignKey(
                        name: "FK_data_print_data_sale_sale_id",
                        column: x => x.sale_id,
                        principalTable: "data_sale",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "data_sale_payment",
                columns: table => new
                {
                    id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    payment_amount = table.Column<double>(type: "float", nullable: false),
                    exchange_rate = table.Column<double>(type: "float", nullable: false),
                    payment_method_name = table.Column<string>(type: "nvarchar(max)", nullable: true, collation: "Khmer_100_BIN"),
                    sale_id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    payment_method_id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    created_date = table.Column<DateTime>(type: "datetime2", nullable: true, defaultValueSql: "getDate()"),
                    created_by = table.Column<string>(type: "nvarchar(max)", nullable: true, collation: "Khmer_100_BIN"),
                    is_deleted = table.Column<bool>(type: "bit", nullable: true, defaultValue: false),
                    deleted_date = table.Column<DateTime>(type: "datetime2", nullable: true, defaultValueSql: "getDate()"),
                    deleted_by = table.Column<string>(type: "nvarchar(max)", nullable: true, collation: "Khmer_100_BIN")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_data_sale_payment", x => x.id);
                    table.ForeignKey(
                        name: "FK_data_sale_payment_data_payment_method_payment_method_id",
                        column: x => x.payment_method_id,
                        principalTable: "data_payment_method",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_data_sale_payment_data_sale_sale_id",
                        column: x => x.sale_id,
                        principalTable: "data_sale",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "data_sale_product",
                columns: table => new
                {
                    id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    quantity = table.Column<decimal>(type: "decimal(19,5)", nullable: false),
                    price = table.Column<decimal>(type: "decimal(19,5)", nullable: false),
                    is_free = table.Column<bool>(type: "bit", nullable: false),
                    is_remove_stock_done = table.Column<bool>(type: "bit", nullable: false),
                    sale_id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    product_id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    created_date = table.Column<DateTime>(type: "datetime2", nullable: true, defaultValueSql: "getDate()"),
                    created_by = table.Column<string>(type: "nvarchar(max)", nullable: true, collation: "Khmer_100_BIN"),
                    is_deleted = table.Column<bool>(type: "bit", nullable: true, defaultValue: false),
                    deleted_date = table.Column<DateTime>(type: "datetime2", nullable: true, defaultValueSql: "getDate()"),
                    deleted_by = table.Column<string>(type: "nvarchar(max)", nullable: true, collation: "Khmer_100_BIN")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_data_sale_product", x => x.id);
                    table.ForeignKey(
                        name: "FK_data_sale_product_data_product_product_id",
                        column: x => x.product_id,
                        principalTable: "data_product",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_data_sale_product_data_sale_sale_id",
                        column: x => x.sale_id,
                        principalTable: "data_sale",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_data_permission_role_id",
                table: "data_permission",
                column: "role_id");

            migrationBuilder.CreateIndex(
                name: "IX_data_print_sale_id",
                table: "data_print",
                column: "sale_id");

            migrationBuilder.CreateIndex(
                name: "IX_data_product_category_id",
                table: "data_product",
                column: "category_id");

            migrationBuilder.CreateIndex(
                name: "IX_data_sale_table_id",
                table: "data_sale",
                column: "table_id");

            migrationBuilder.CreateIndex(
                name: "IX_data_sale_payment_payment_method_id",
                table: "data_sale_payment",
                column: "payment_method_id");

            migrationBuilder.CreateIndex(
                name: "IX_data_sale_payment_sale_id",
                table: "data_sale_payment",
                column: "sale_id");

            migrationBuilder.CreateIndex(
                name: "IX_data_sale_product_product_id",
                table: "data_sale_product",
                column: "product_id");

            migrationBuilder.CreateIndex(
                name: "IX_data_sale_product_sale_id",
                table: "data_sale_product",
                column: "sale_id");

            migrationBuilder.CreateIndex(
                name: "IX_data_stock_inventory_product_id",
                table: "data_stock_inventory",
                column: "product_id");

            migrationBuilder.CreateIndex(
                name: "IX_data_stock_transaction_product_id",
                table: "data_stock_transaction",
                column: "product_id");

            migrationBuilder.CreateIndex(
                name: "IX_data_user_role_id",
                table: "data_user",
                column: "role_id");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "data_document");

            migrationBuilder.DropTable(
                name: "data_permission");

            migrationBuilder.DropTable(
                name: "data_print");

            migrationBuilder.DropTable(
                name: "data_sale_payment");

            migrationBuilder.DropTable(
                name: "data_sale_product");

            migrationBuilder.DropTable(
                name: "data_stock_inventory");

            migrationBuilder.DropTable(
                name: "data_stock_transaction");

            migrationBuilder.DropTable(
                name: "data_user");

            migrationBuilder.DropTable(
                name: "data_payment_method");

            migrationBuilder.DropTable(
                name: "data_sale");

            migrationBuilder.DropTable(
                name: "data_product");

            migrationBuilder.DropTable(
                name: "data_role");

            migrationBuilder.DropTable(
                name: "data_table");

            migrationBuilder.DropTable(
                name: "data_category");
        }
    }
}
