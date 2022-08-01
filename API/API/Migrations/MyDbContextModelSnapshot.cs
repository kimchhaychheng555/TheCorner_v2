﻿// <auto-generated />
using System;
using API;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

namespace API.Migrations
{
    [DbContext(typeof(MyDbContext))]
    partial class MyDbContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("Relational:MaxIdentifierLength", 128)
                .HasAnnotation("ProductVersion", "5.0.16")
                .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

            modelBuilder.Entity("API.Models.CategoryModel", b =>
                {
                    b.Property<Guid>("id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier");

                    b.Property<string>("created_by")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<DateTime?>("created_date")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("datetime2")
                        .HasDefaultValueSql("getDate()");

                    b.Property<string>("deleted_by")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<DateTime?>("deleted_date")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("datetime2")
                        .HasDefaultValueSql("getDate()");

                    b.Property<bool?>("is_deleted")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bit")
                        .HasDefaultValue(false);

                    b.Property<string>("name")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.HasKey("id");

                    b.ToTable("data_category");
                });

            modelBuilder.Entity("API.Models.DocumentModel", b =>
                {
                    b.Property<Guid>("id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier");

                    b.Property<string>("key_name")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<string>("label")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<string>("value")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.HasKey("id");

                    b.ToTable("data_document");
                });

            modelBuilder.Entity("API.Models.ExpenseModel", b =>
                {
                    b.Property<Guid>("id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier");

                    b.Property<double?>("amount")
                        .HasColumnType("float");

                    b.Property<string>("created_by")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<DateTime?>("created_date")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("datetime2")
                        .HasDefaultValueSql("getDate()");

                    b.Property<string>("deleted_by")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<DateTime?>("deleted_date")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("datetime2")
                        .HasDefaultValueSql("getDate()");

                    b.Property<string>("description")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<double?>("exchange_rate")
                        .HasColumnType("float");

                    b.Property<bool?>("is_deleted")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bit")
                        .HasDefaultValue(false);

                    b.Property<string>("note")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<string>("payment_method_name")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.HasKey("id");

                    b.ToTable("data_expense");
                });

            modelBuilder.Entity("API.Models.PaymentMethodModel", b =>
                {
                    b.Property<Guid>("id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier");

                    b.Property<string>("created_by")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<DateTime?>("created_date")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("datetime2")
                        .HasDefaultValueSql("getDate()");

                    b.Property<string>("deleted_by")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<DateTime?>("deleted_date")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("datetime2")
                        .HasDefaultValueSql("getDate()");

                    b.Property<decimal>("exchange_rate")
                        .HasColumnType("decimal(19,5)");

                    b.Property<bool?>("is_deleted")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bit")
                        .HasDefaultValue(false);

                    b.Property<string>("payment_method_name")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.HasKey("id");

                    b.ToTable("data_payment_method");
                });

            modelBuilder.Entity("API.Models.PermissionModel", b =>
                {
                    b.Property<Guid>("id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier");

                    b.Property<string>("created_by")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<DateTime?>("created_date")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("datetime2")
                        .HasDefaultValueSql("getDate()");

                    b.Property<string>("deleted_by")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<DateTime?>("deleted_date")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("datetime2")
                        .HasDefaultValueSql("getDate()");

                    b.Property<string>("description")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<bool?>("is_deleted")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bit")
                        .HasDefaultValue(false);

                    b.Property<string>("slug")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.HasKey("id");

                    b.ToTable("data_permission");
                });

            modelBuilder.Entity("API.Models.PermissionRoleModel", b =>
                {
                    b.Property<Guid>("id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier");

                    b.Property<Guid>("permission_id")
                        .HasColumnType("uniqueidentifier");

                    b.Property<Guid>("role_id")
                        .HasColumnType("uniqueidentifier");

                    b.HasKey("id");

                    b.HasIndex("permission_id");

                    b.HasIndex("role_id");

                    b.ToTable("data_permission_role");
                });

            modelBuilder.Entity("API.Models.PrintModel", b =>
                {
                    b.Property<Guid>("id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier");

                    b.Property<string>("created_by")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<DateTime?>("created_date")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("datetime2")
                        .HasDefaultValueSql("getDate()");

                    b.Property<string>("deleted_by")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<DateTime?>("deleted_date")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("datetime2")
                        .HasDefaultValueSql("getDate()");

                    b.Property<bool?>("is_deleted")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bit")
                        .HasDefaultValue(false);

                    b.Property<string>("key")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<Guid>("sale_id")
                        .HasColumnType("uniqueidentifier");

                    b.HasKey("id");

                    b.HasIndex("sale_id");

                    b.ToTable("data_print");
                });

            modelBuilder.Entity("API.Models.ProductGroupModel", b =>
                {
                    b.Property<Guid>("id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier");

                    b.Property<string>("created_by")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<DateTime?>("created_date")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("datetime2")
                        .HasDefaultValueSql("getDate()");

                    b.Property<string>("deleted_by")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<DateTime?>("deleted_date")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("datetime2")
                        .HasDefaultValueSql("getDate()");

                    b.Property<string>("group_name")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<bool?>("is_deleted")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bit")
                        .HasDefaultValue(false);

                    b.HasKey("id");

                    b.ToTable("data_product_group");
                });

            modelBuilder.Entity("API.Models.ProductModel", b =>
                {
                    b.Property<Guid>("id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier");

                    b.Property<Guid>("category_id")
                        .HasColumnType("uniqueidentifier");

                    b.Property<decimal?>("cost")
                        .HasColumnType("decimal(18,2)");

                    b.Property<string>("created_by")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<DateTime?>("created_date")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("datetime2")
                        .HasDefaultValueSql("getDate()");

                    b.Property<string>("deleted_by")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<DateTime?>("deleted_date")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("datetime2")
                        .HasDefaultValueSql("getDate()");

                    b.Property<string>("image")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<bool?>("is_deleted")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bit")
                        .HasDefaultValue(false);

                    b.Property<decimal?>("min_quantity")
                        .HasColumnType("decimal(18,2)");

                    b.Property<string>("name")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<decimal?>("price")
                        .HasColumnType("decimal(18,2)");

                    b.Property<Guid>("product_group_id")
                        .HasColumnType("uniqueidentifier");

                    b.Property<bool>("stockable")
                        .HasColumnType("bit");

                    b.HasKey("id");

                    b.HasIndex("category_id");

                    b.HasIndex("product_group_id");

                    b.ToTable("data_product");
                });

            modelBuilder.Entity("API.Models.RoleModel", b =>
                {
                    b.Property<Guid>("id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier");

                    b.Property<string>("created_by")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<DateTime?>("created_date")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("datetime2")
                        .HasDefaultValueSql("getDate()");

                    b.Property<string>("deleted_by")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<DateTime?>("deleted_date")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("datetime2")
                        .HasDefaultValueSql("getDate()");

                    b.Property<bool?>("is_deleted")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bit")
                        .HasDefaultValue(false);

                    b.Property<string>("name")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.HasKey("id");

                    b.ToTable("data_role");
                });

            modelBuilder.Entity("API.Models.SaleModel", b =>
                {
                    b.Property<Guid>("id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier");

                    b.Property<string>("created_by")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<DateTime?>("created_date")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("datetime2")
                        .HasDefaultValueSql("getDate()");

                    b.Property<string>("deleted_by")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<DateTime?>("deleted_date")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("datetime2")
                        .HasDefaultValueSql("getDate()");

                    b.Property<decimal?>("discount")
                        .HasColumnType("decimal(18,2)");

                    b.Property<string>("discount_type")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<decimal?>("grand_total")
                        .HasColumnType("decimal(18,2)");

                    b.Property<string>("invoice_number")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<bool?>("is_deleted")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bit")
                        .HasDefaultValue(false);

                    b.Property<bool?>("is_paid")
                        .HasColumnType("bit");

                    b.Property<string>("sale_date")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<bool?>("status")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bit")
                        .HasDefaultValue(false);

                    b.Property<decimal?>("sub_total")
                        .HasColumnType("decimal(18,2)");

                    b.Property<Guid>("table_id")
                        .HasColumnType("uniqueidentifier");

                    b.Property<decimal?>("vat")
                        .HasColumnType("decimal(18,2)");

                    b.HasKey("id");

                    b.HasIndex("table_id");

                    b.ToTable("data_sale");
                });

            modelBuilder.Entity("API.Models.SalePaymentModel", b =>
                {
                    b.Property<Guid>("id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier");

                    b.Property<string>("created_by")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<DateTime?>("created_date")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("datetime2")
                        .HasDefaultValueSql("getDate()");

                    b.Property<string>("deleted_by")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<DateTime?>("deleted_date")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("datetime2")
                        .HasDefaultValueSql("getDate()");

                    b.Property<double?>("exchange_rate")
                        .HasColumnType("float");

                    b.Property<bool?>("is_deleted")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bit")
                        .HasDefaultValue(false);

                    b.Property<double?>("payment_amount")
                        .HasColumnType("float");

                    b.Property<Guid>("payment_method_id")
                        .HasColumnType("uniqueidentifier");

                    b.Property<string>("payment_method_name")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<Guid>("sale_id")
                        .HasColumnType("uniqueidentifier");

                    b.HasKey("id");

                    b.HasIndex("payment_method_id");

                    b.HasIndex("sale_id");

                    b.ToTable("data_sale_payment");
                });

            modelBuilder.Entity("API.Models.SaleProductModel", b =>
                {
                    b.Property<Guid>("id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier");

                    b.Property<string>("created_by")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<DateTime?>("created_date")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("datetime2")
                        .HasDefaultValueSql("getDate()");

                    b.Property<string>("deleted_by")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<DateTime?>("deleted_date")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("datetime2")
                        .HasDefaultValueSql("getDate()");

                    b.Property<decimal?>("discount")
                        .HasColumnType("decimal(18,2)");

                    b.Property<string>("discount_type")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<string>("image")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<bool?>("is_deleted")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bit")
                        .HasDefaultValue(false);

                    b.Property<bool?>("is_free")
                        .HasColumnType("bit");

                    b.Property<decimal?>("price")
                        .HasColumnType("decimal(18,2)");

                    b.Property<Guid>("product_id")
                        .HasColumnType("uniqueidentifier");

                    b.Property<string>("product_name")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<decimal?>("quantity")
                        .HasColumnType("decimal(18,2)");

                    b.Property<Guid>("sale_id")
                        .HasColumnType("uniqueidentifier");

                    b.Property<bool?>("stockable")
                        .HasColumnType("bit");

                    b.HasKey("id");

                    b.HasIndex("product_id");

                    b.HasIndex("sale_id");

                    b.ToTable("data_sale_product");
                });

            modelBuilder.Entity("API.Models.StockInventoryModel", b =>
                {
                    b.Property<Guid>("id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier");

                    b.Property<string>("created_by")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<DateTime?>("created_date")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("datetime2")
                        .HasDefaultValueSql("getDate()");

                    b.Property<string>("deleted_by")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<DateTime?>("deleted_date")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("datetime2")
                        .HasDefaultValueSql("getDate()");

                    b.Property<bool?>("is_deleted")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bit")
                        .HasDefaultValue(false);

                    b.Property<decimal?>("min_quantity")
                        .HasColumnType("decimal(18,2)");

                    b.Property<Guid>("product_id")
                        .HasColumnType("uniqueidentifier");

                    b.Property<decimal?>("quantity_stock")
                        .HasColumnType("decimal(18,2)");

                    b.HasKey("id");

                    b.HasIndex("product_id");

                    b.ToTable("data_stock_inventory");
                });

            modelBuilder.Entity("API.Models.StockTransactionModel", b =>
                {
                    b.Property<Guid>("id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier");

                    b.Property<string>("created_by")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<DateTime?>("created_date")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("datetime2")
                        .HasDefaultValueSql("getDate()");

                    b.Property<string>("deleted_by")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<DateTime?>("deleted_date")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("datetime2")
                        .HasDefaultValueSql("getDate()");

                    b.Property<string>("description")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<bool?>("is_deleted")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bit")
                        .HasDefaultValue(false);

                    b.Property<Guid>("product_id")
                        .HasColumnType("uniqueidentifier");

                    b.Property<decimal?>("quantity")
                        .HasColumnType("decimal(18,2)");

                    b.Property<bool?>("status")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bit")
                        .HasDefaultValue(false);

                    b.Property<string>("type")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.HasKey("id");

                    b.HasIndex("product_id");

                    b.ToTable("data_stock_transaction");
                });

            modelBuilder.Entity("API.Models.TableModel", b =>
                {
                    b.Property<Guid>("id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier");

                    b.Property<string>("created_by")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<DateTime?>("created_date")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("datetime2")
                        .HasDefaultValueSql("getDate()");

                    b.Property<string>("deleted_by")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<DateTime?>("deleted_date")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("datetime2")
                        .HasDefaultValueSql("getDate()");

                    b.Property<bool?>("is_deleted")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bit")
                        .HasDefaultValue(false);

                    b.Property<string>("name")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.HasKey("id");

                    b.ToTable("data_table");
                });

            modelBuilder.Entity("API.Models.UserModel", b =>
                {
                    b.Property<Guid>("id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier");

                    b.Property<string>("created_by")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<DateTime?>("created_date")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("datetime2")
                        .HasDefaultValueSql("getDate()");

                    b.Property<string>("deleted_by")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<DateTime?>("deleted_date")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("datetime2")
                        .HasDefaultValueSql("getDate()");

                    b.Property<string>("fullname")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<bool?>("is_deleted")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bit")
                        .HasDefaultValue(false);

                    b.Property<string>("password")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<string>("profile")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<Guid>("role_id")
                        .HasColumnType("uniqueidentifier");

                    b.Property<string>("username")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.HasKey("id");

                    b.HasIndex("role_id");

                    b.ToTable("data_user");
                });

            modelBuilder.Entity("API.Models.PermissionRoleModel", b =>
                {
                    b.HasOne("API.Models.PermissionModel", "permission")
                        .WithMany()
                        .HasForeignKey("permission_id")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("API.Models.RoleModel", "role")
                        .WithMany("permission_roles")
                        .HasForeignKey("role_id")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("permission");

                    b.Navigation("role");
                });

            modelBuilder.Entity("API.Models.PrintModel", b =>
                {
                    b.HasOne("API.Models.SaleModel", "sale")
                        .WithMany()
                        .HasForeignKey("sale_id")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("sale");
                });

            modelBuilder.Entity("API.Models.ProductModel", b =>
                {
                    b.HasOne("API.Models.CategoryModel", "category")
                        .WithMany("products")
                        .HasForeignKey("category_id")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("API.Models.ProductGroupModel", "product_group")
                        .WithMany("products")
                        .HasForeignKey("product_group_id")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("category");

                    b.Navigation("product_group");
                });

            modelBuilder.Entity("API.Models.SaleModel", b =>
                {
                    b.HasOne("API.Models.TableModel", "table")
                        .WithMany("sales")
                        .HasForeignKey("table_id")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("table");
                });

            modelBuilder.Entity("API.Models.SalePaymentModel", b =>
                {
                    b.HasOne("API.Models.PaymentMethodModel", "payment_method")
                        .WithMany()
                        .HasForeignKey("payment_method_id")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("API.Models.SaleModel", "sale")
                        .WithMany("sale_payments")
                        .HasForeignKey("sale_id")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("payment_method");

                    b.Navigation("sale");
                });

            modelBuilder.Entity("API.Models.SaleProductModel", b =>
                {
                    b.HasOne("API.Models.ProductModel", "product")
                        .WithMany()
                        .HasForeignKey("product_id")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("API.Models.SaleModel", "sale")
                        .WithMany("sale_products")
                        .HasForeignKey("sale_id")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("product");

                    b.Navigation("sale");
                });

            modelBuilder.Entity("API.Models.StockInventoryModel", b =>
                {
                    b.HasOne("API.Models.ProductModel", "product")
                        .WithMany()
                        .HasForeignKey("product_id")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("product");
                });

            modelBuilder.Entity("API.Models.StockTransactionModel", b =>
                {
                    b.HasOne("API.Models.ProductModel", "product")
                        .WithMany()
                        .HasForeignKey("product_id")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("product");
                });

            modelBuilder.Entity("API.Models.UserModel", b =>
                {
                    b.HasOne("API.Models.RoleModel", "role")
                        .WithMany("users")
                        .HasForeignKey("role_id")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("role");
                });

            modelBuilder.Entity("API.Models.CategoryModel", b =>
                {
                    b.Navigation("products");
                });

            modelBuilder.Entity("API.Models.ProductGroupModel", b =>
                {
                    b.Navigation("products");
                });

            modelBuilder.Entity("API.Models.RoleModel", b =>
                {
                    b.Navigation("permission_roles");

                    b.Navigation("users");
                });

            modelBuilder.Entity("API.Models.SaleModel", b =>
                {
                    b.Navigation("sale_payments");

                    b.Navigation("sale_products");
                });

            modelBuilder.Entity("API.Models.TableModel", b =>
                {
                    b.Navigation("sales");
                });
#pragma warning restore 612, 618
        }
    }
}
