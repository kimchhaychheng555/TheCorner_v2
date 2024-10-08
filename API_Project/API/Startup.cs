using API.Models;
using Microsoft.AspNet.OData.Builder;
using Microsoft.AspNet.OData.Extensions;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.FileProviders;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.OData.Edm;
using Microsoft.OpenApi.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace API
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {

            services.AddControllers().AddJsonOptions(x => x.JsonSerializerOptions.ReferenceHandler = ReferenceHandler.Preserve);
            services.AddControllersWithViews().AddNewtonsoftJson(options => {
                options.SerializerSettings.ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore;
                options.SerializerSettings.DateTimeZoneHandling = Newtonsoft.Json.DateTimeZoneHandling.Local;
            });

            services.AddCors(options =>
            {
                options.AddPolicy("AllowAnyOrigin",
                    builder => builder
                    .AllowAnyOrigin()
                    .AllowAnyMethod()
                    .AllowAnyHeader());
            });

            // Sql Server
            if (Configuration.GetSection("Database").Value == "SqlServer")
            {
                services.AddDbContext<MyDbContext>(options =>
                      options.EnableSensitiveDataLogging().UseSqlServer(Configuration.GetConnectionString("SqlServerConnection")), ServiceLifetime.Transient
                  );
            }
            else
            {
                services.AddDbContext<MyDbContext>(options => options.UseMySQL(Configuration.GetConnectionString("MySqlConnection")));
            }
            // End Database


            //services.AddControllers().AddJsonOptions(x => x.JsonSerializerOptions.ReferenceHandler = ReferenceHandler.Preserve); 
            services.AddMvc();
            services.AddOData(); 
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseCors(x => x
                .AllowAnyOrigin()
                .AllowAnyMethod()
                .AllowAnyHeader());
             
            app.UseRouting();
            app.UseFileServer(new FileServerOptions
            {
                FileProvider = new PhysicalFileProvider(Path.Combine(Directory.GetCurrentDirectory(), "uploads")),
                RequestPath = "/uploads"
            });


            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
                endpoints.Expand().Select().Filter().OrderBy().Count().MaxTop(1000);
                endpoints.MapODataRoute("api", "api", GetEdmModel());
                endpoints.EnableDependencyInjection();
            });
        }
        private static IEdmModel GetEdmModel()
        {
            var odataBuilder = new ODataConventionModelBuilder();
            odataBuilder.EntitySet<CategoryModel>("Category");
            odataBuilder.EntitySet<DocumentModel>("Document");
            odataBuilder.EntitySet<PaymentMethodModel>("PaymentMethod");
            odataBuilder.EntitySet<PermissionModel>("Permission");
            odataBuilder.EntitySet<PrintModel>("Print");
            odataBuilder.EntitySet<ProductModel>("Product");
            odataBuilder.EntitySet<ProductGroupModel>("ProductGroup");
            odataBuilder.EntitySet<RoleModel>("Role");
            odataBuilder.EntitySet<SaleModel>("Sale");
            odataBuilder.EntitySet<SaleProductModel>("SaleProduct");
            odataBuilder.EntitySet<SalePaymentModel>("SalePayment");
            odataBuilder.EntitySet<StockInventoryModel>("StockInventory");
            odataBuilder.EntitySet<StockTransactionModel>("StockTransaction");
            odataBuilder.EntitySet<TableModel>("Table");
            odataBuilder.EntitySet<UserModel>("User");
            odataBuilder.EntitySet<PermissionRoleModel>("PermissionRole");
            odataBuilder.EntitySet<ExpenseModel>("Expense");
            return odataBuilder.GetEdmModel();
        }
    }
}
