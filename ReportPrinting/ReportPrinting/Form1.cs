using API.Models;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data; 
using System.Drawing;
using System.Linq;
using System.Net.Http;
using System.Text; 
using System.Threading.Tasks;
using System.Windows.Forms; 

namespace ReportPrinting
{
    public partial class Form1 : Form
    {
        private string apiUrl; 
        private static readonly HttpClient client = new HttpClient();

        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            apiUrl = System.Configuration.ConfigurationManager.AppSettings["apiKey"];
            _ = onFormLoadAsync();
            //
            notifyIcon1.Icon = SystemIcons.Application;
            notifyIcon1.Text = "Report Printing";
        }

        private void Form1_Resize(object sender, EventArgs e)
        {
            if (WindowState == FormWindowState.Minimized)
            {
                this.Hide();
                notifyIcon1.Visible = true;
            }
            else if (FormWindowState.Normal == this.WindowState)
            { notifyIcon1.Visible = false; }
        }

        private void notifyIcon1_MouseDoubleClick(object sender, MouseEventArgs e)
        {
            this.Show();
            notifyIcon1.Visible = false;
            WindowState = FormWindowState.Normal;
        }

        private async Task onFormLoadAsync()
        {

            while (true)
            {
                await Task.Delay(1000);
                _ = onFunctionProcessingAsync();
            } 
        }

        private async Task onFunctionProcessingAsync()
        {
            Console.WriteLine("This event will happen every 5 seconds");
            await executeDataAsync();
        }

        private async Task executeDataAsync()
        {
            try
            { 
                var printResp = await client.GetAsync($"{apiUrl}print?$orderby=created_date desc&$filter=is_deleted eq false&$expand=sale($expand=sale_products)"); 
                var printList = convertJsonToObject<List<PrintModel>>(await printResp.Content.ReadAsStringAsync());
                if (printList.Any())
                {
                    var print = printList.FirstOrDefault();

                    // Send To Print
                    PrintingService.printReceipt(print.sale);

                    // Update Printing UI

                    await updatePrintedData(print);
                }
            }
            catch (Exception ex)
            {

                throw;
            }


        }

        private async Task updatePrintedData(PrintModel print)
        {
            var stringContent = new StringContent(JsonConvert.SerializeObject(print), Encoding.UTF8, "application/json");
            var resp = await client.PostAsync($"{apiUrl}Print/Delete/{print.id}", stringContent);
            if ((resp.StatusCode.ToString()) == "OK")
            {
                return;
            }
            return;
        }


        public T convertJsonToObject<T>(string str)
        {
            JObject json = JObject.Parse(str);
            string jsonString;
            if (json["value"] != null)
            {
                jsonString = JsonConvert.SerializeObject(json["value"]);
            }
            else
            {
                jsonString = JsonConvert.SerializeObject(json);
            }

            T value = JsonConvert.DeserializeObject<T>(jsonString);

            return value;
        }
    }

    }
