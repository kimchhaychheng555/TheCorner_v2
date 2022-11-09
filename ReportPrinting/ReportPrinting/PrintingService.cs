using API.Models;
using CrystalDecisions.CrystalReports.Engine; 
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
        public static void printReceipt(SaleModel sale, string exchange, string printerName, string fileName)
        {
            DataTable saleTable = getDataTableSale(sale);

            List<SaleProductModel> tempSaleProducts = new List<SaleProductModel>();
            tempSaleProducts = sale.sale_products.OrderByDescending(sp => sp.product_group_id).ToList();
            DataTable saleProductTable = getDataTableSaleProduct(tempSaleProducts);
            string exchangeRate = exchange;
            string dateTime = DateTime.Now.ToString("dd-MM-yyyy hh:mm:ss tt");

            ReportDocument report = new ReportDocument();
            report.Load(Application.StartupPath + "\\Report\\"+ fileName);
            report.PrintOptions.PrinterName = printerName;
            report.Database.Tables["data_sale"].SetDataSource(saleTable);
            report.Database.Tables["data_sale_product"].SetDataSource(saleProductTable);
            report.SetParameterValue("exchangeRate", exchangeRate);
            report.SetParameterValue("DateTime", dateTime);
            report.PrintToPrinter(1, false, 0, 0);

        }

        private static DataTable getDataTableSale(SaleModel sale)
        {
            DataTable dataSale = new DataTable();
            Type myType = sale.GetType();
            IList<PropertyInfo> props = new List<PropertyInfo>(myType.GetProperties());
            foreach (PropertyInfo prop in props)
            {
                if (prop.Name == "id")
                {
                    dataSale.Columns.Add($"{prop.Name}", typeof(string));
                }
                else
                {
                    var d = prop.GetType().GetProperties()[1].PropertyType;
                    dataSale.Columns.Add($"{prop.Name}", d);
                }

            }
            List<dynamic> values = new List<dynamic>();
            foreach (PropertyInfo prop in props)
            {
                if (prop.Name == "id")
                {
                    values.Add(sale.id.ToString());
                }
                else
                {
                    values.Add(prop.GetValue(sale, null));

                }
            }

            dataSale.Rows.Add(values.ToArray());

            return dataSale;
        }

        private static DataTable getDataTableSaleProduct(List<SaleProductModel> saleProducts)
        {
            DataTable dataSale = new DataTable();
            Type myType = saleProducts.FirstOrDefault().GetType();
            IList<PropertyInfo> props = new List<PropertyInfo>(myType.GetProperties());
            foreach (PropertyInfo prop in props)
            {
                if (prop.Name == "id")
                {
                    dataSale.Columns.Add($"{prop.Name}", typeof(string));
                }
                else
                {
                    var d = prop.GetType().GetProperties()[1].PropertyType;
                    dataSale.Columns.Add($"{prop.Name}", d);
                }
            }

            for (int i = 0; i < saleProducts.Count(); i++)
            {
                List<dynamic> values = new List<dynamic>();
                foreach (PropertyInfo prop in props)
                {
                    if (prop.Name == "id")
                    {
                        values.Add(prop.GetValue(saleProducts[i], null).ToString());
                    }
                    else {
                        values.Add(prop.GetValue(saleProducts[i], null));
                    }
                        
                }
                dataSale.Rows.Add(values.ToArray());
            }
            return dataSale;
        }
    }
}