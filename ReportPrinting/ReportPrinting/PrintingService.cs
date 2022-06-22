using API.Models;
using CrystalDecisions.CrystalReports.Engine;
using ReportPrinting.Report;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ReportPrinting
{
    class PrintingService
    {
        public static void printReceipt(SaleModel sale)
        {
            // Sale Model
            DataSet dsSale = new DataSet();
            dsSale.Tables.Add(getDataTableSale(sale));

            // Sale Product Model
            DataSet dsSaleProduct = new DataSet();
            dsSaleProduct.Tables.Add(getDataTableSaleProduct(sale.sale_products));


            ReportDocument report = new  ReportDocument();
            report.Load(Application.StartupPath+ "\\Report\\CrystalReport1.rpt");
            report.PrintOptions.PrinterName = "Sale Printer";
            report.Database.Tables["data_sale"].SetDataSource(dsSale);
            report.Database.Tables["data_sale_product"].SetDataSource(dsSale);
            report.PrintToPrinter(1, false, 0, 0);
             
        }

        private static DataTable getDataTableSale(SaleModel sale)
        {
            DataTable dataSale = new DataTable(); 
            Type myType = sale.GetType();
            IList<PropertyInfo> props = new List<PropertyInfo>(myType.GetProperties());
            foreach (PropertyInfo prop in props)
            {
                dataSale.Columns.Add($"{prop.Name}", prop.GetType());
            }
            List<dynamic> values = new List<dynamic>();
            foreach (PropertyInfo prop in props)
            {
                values.Add(prop.GetValue(sale, null));
            }
            dataSale.Rows.Add(values);

            return dataSale;
        }

        private static DataTable getDataTableSaleProduct(List<SaleProductModel> saleProducts)
        {
            DataTable dataSale = new DataTable();
            Type myType = saleProducts.FirstOrDefault().GetType();
            IList<PropertyInfo> props = new List<PropertyInfo>(myType.GetProperties());
            foreach (PropertyInfo prop in props)
            {
                dataSale.Columns.Add($"{prop.Name}", prop.GetType());
            }
           
            for(int i=0; i<saleProducts.Count(); i++)
            {
                List<dynamic> values = new List<dynamic>();
                foreach (PropertyInfo prop in props)
                {
                    values.Add(prop.GetValue(saleProducts[i], null));
                }
                dataSale.Rows.Add(values);
            }

            return dataSale;
        }
    }
}
