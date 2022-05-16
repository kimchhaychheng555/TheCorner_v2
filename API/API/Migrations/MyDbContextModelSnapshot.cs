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
                        .HasColumnType("datetime2");

                    b.Property<string>("deleted_by")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<DateTime?>("deleted_date")
                        .HasColumnType("datetime2");

                    b.Property<bool?>("is_deleted")
                        .HasColumnType("bit");

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

            modelBuilder.Entity("API.Models.PermissionModel", b =>
                {
                    b.Property<Guid>("id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier");

                    b.Property<string>("created_by")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<DateTime?>("created_date")
                        .HasColumnType("datetime2");

                    b.Property<string>("deleted_by")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<DateTime?>("deleted_date")
                        .HasColumnType("datetime2");

                    b.Property<string>("description")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<bool?>("is_deleted")
                        .HasColumnType("bit");

                    b.Property<Guid>("role_id")
                        .HasColumnType("uniqueidentifier");

                    b.Property<string>("slug")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.HasKey("id");

                    b.HasIndex("role_id");

                    b.ToTable("data_permission");
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
                        .HasColumnType("datetime2");

                    b.Property<string>("deleted_by")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<DateTime?>("deleted_date")
                        .HasColumnType("datetime2");

                    b.Property<bool?>("is_deleted")
                        .HasColumnType("bit");

                    b.Property<string>("key")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<Guid>("sale_id")
                        .HasColumnType("uniqueidentifier");

                    b.HasKey("id");

                    b.HasIndex("sale_id");

                    b.ToTable("data_print");
                });

            modelBuilder.Entity("API.Models.ProductModel", b =>
                {
                    b.Property<Guid>("id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier");

                    b.Property<Guid>("category_id")
                        .HasColumnType("uniqueidentifier");

                    b.Property<string>("created_by")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<DateTime?>("created_date")
                        .HasColumnType("datetime2");

                    b.Property<string>("deleted_by")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<DateTime?>("deleted_date")
                        .HasColumnType("datetime2");

                    b.Property<string>("image")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<bool?>("is_deleted")
                        .HasColumnType("bit");

                    b.Property<string>("name")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<decimal>("price")
                        .HasColumnType("decimal(19,5)");

                    b.Property<bool>("stockable")
                        .HasColumnType("bit");

                    b.HasKey("id");

                    b.HasIndex("category_id");

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
                        .HasColumnType("datetime2");

                    b.Property<string>("deleted_by")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<DateTime?>("deleted_date")
                        .HasColumnType("datetime2");

                    b.Property<bool?>("is_deleted")
                        .HasColumnType("bit");

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
                        .HasColumnType("datetime2");

                    b.Property<string>("deleted_by")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<DateTime?>("deleted_date")
                        .HasColumnType("datetime2");

                    b.Property<decimal>("discount")
                        .HasColumnType("decimal(19,5)");

                    b.Property<string>("discount_type")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<decimal>("grand_total")
                        .HasColumnType("decimal(19,5)");

                    b.Property<string>("invoice_number")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<bool?>("is_deleted")
                        .HasColumnType("bit");

                    b.Property<bool>("is_paid")
                        .HasColumnType("bit");

                    b.Property<string>("sale_date")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<bool>("status")
                        .HasColumnType("bit");

                    b.Property<decimal>("sub_total")
                        .HasColumnType("decimal(19,5)");

                    b.Property<Guid>("table_id")
                        .HasColumnType("uniqueidentifier");

                    b.Property<decimal>("vat")
                        .HasColumnType("decimal(19,5)");

                    b.HasKey("id");

                    b.HasIndex("table_id");

                    b.ToTable("data_sale");
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
                        .HasColumnType("datetime2");

                    b.Property<string>("deleted_by")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<DateTime?>("deleted_date")
                        .HasColumnType("datetime2");

                    b.Property<bool?>("is_deleted")
                        .HasColumnType("bit");

                    b.Property<bool>("is_free")
                        .HasColumnType("bit");

                    b.Property<bool>("is_remove_stock_done")
                        .HasColumnType("bit");

                    b.Property<decimal>("price")
                        .HasColumnType("decimal(19,5)");

                    b.Property<Guid>("product_id")
                        .HasColumnType("uniqueidentifier");

                    b.Property<decimal>("quantity")
                        .HasColumnType("decimal(19,5)");

                    b.Property<Guid>("sale_id")
                        .HasColumnType("uniqueidentifier");

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
                        .HasColumnType("datetime2");

                    b.Property<string>("deleted_by")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<DateTime?>("deleted_date")
                        .HasColumnType("datetime2");

                    b.Property<bool?>("is_deleted")
                        .HasColumnType("bit");

                    b.Property<decimal>("min_quantity")
                        .HasColumnType("decimal(19,5)");

                    b.Property<Guid>("product_id")
                        .HasColumnType("uniqueidentifier");

                    b.Property<decimal>("quantity_stock")
                        .HasColumnType("decimal(19,5)");

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
                        .HasColumnType("datetime2");

                    b.Property<string>("deleted_by")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<DateTime?>("deleted_date")
                        .HasColumnType("datetime2");

                    b.Property<bool?>("is_deleted")
                        .HasColumnType("bit");

                    b.Property<Guid>("product_id")
                        .HasColumnType("uniqueidentifier");

                    b.Property<decimal>("quantity")
                        .HasColumnType("decimal(19,5)");

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
                        .HasColumnType("datetime2");

                    b.Property<string>("deleted_by")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<DateTime?>("deleted_date")
                        .HasColumnType("datetime2");

                    b.Property<bool?>("is_deleted")
                        .HasColumnType("bit");

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
                        .HasColumnType("datetime2");

                    b.Property<string>("deleted_by")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<DateTime?>("deleted_date")
                        .HasColumnType("datetime2");

                    b.Property<string>("fullname")
                        .HasColumnType("nvarchar(max)")
                        .UseCollation("Khmer_100_BIN");

                    b.Property<bool?>("is_deleted")
                        .HasColumnType("bit");

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

            modelBuilder.Entity("API.Models.PermissionModel", b =>
                {
                    b.HasOne("API.Models.RoleModel", "role")
                        .WithMany("permissions")
                        .HasForeignKey("role_id")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

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

                    b.Navigation("category");
                });

            modelBuilder.Entity("API.Models.SaleModel", b =>
                {
                    b.HasOne("API.Models.TableModel", "table")
                        .WithMany()
                        .HasForeignKey("table_id")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("table");
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
                        .WithMany()
                        .HasForeignKey("role_id")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("role");
                });

            modelBuilder.Entity("API.Models.CategoryModel", b =>
                {
                    b.Navigation("products");
                });

            modelBuilder.Entity("API.Models.RoleModel", b =>
                {
                    b.Navigation("permissions");
                });

            modelBuilder.Entity("API.Models.SaleModel", b =>
                {
                    b.Navigation("sale_products");
                });
#pragma warning restore 612, 618
        }
    }
}
