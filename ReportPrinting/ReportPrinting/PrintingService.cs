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
        public static void printReceipt(SaleModel sale)
        {
            DataTable saleData = new DataTable();
            saleData.Columns.Add("invoice_number", typeof(string));
            saleData.Columns.Add("sub_total", typeof(decimal));
            saleData.Columns.Add("grand_total", typeof(decimal));


            saleData.Rows.Add(sale.invoice_number, sale.sub_total, sale.grand_total);

            DataTable saleTable = getDataTableSale(sale);
            DataTable saleProductTable = getDataTableSaleProduct(sale.sale_products);


            ReportDocument report = new ReportDocument();
            report.Load(Application.StartupPath + "\\Report\\CrystalReport1.rpt");
            report.PrintOptions.PrinterName = "Sale Printer";
            report.Database.Tables["data_sale"].SetDataSource(saleData);
            report.Database.Tables["data_sale_product"].SetDataSource(saleProductTable);
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

            dynamic[] dynArr = values.ToArray();
            dataSale.Rows.Add(dynArr[0], dynArr[1]);

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