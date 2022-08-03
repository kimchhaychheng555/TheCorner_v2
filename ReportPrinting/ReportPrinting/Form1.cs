using API.Models;
using System;
using System.Collections.Generic;
using System.Text.Json;
using System.Drawing;
using System.Linq;
using System.Net.Http;
using System.Text; 
using System.Threading.Tasks;
using System.Windows.Forms;
using Newtonsoft.Json.Linq;
using System.IO;

namespace ReportPrinting
{
    public partial class Form1 : Form
    {
        private string timeShutDown;
        private string exchangeRate;
        private string apiUrl; 
        private static readonly HttpClient client = new HttpClient();

        public Form1()
        { 
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            var text = System.IO.File.ReadAllText(Application.StartupPath + @"\appConfig.json");
            dynamic array = Newtonsoft.Json.JsonConvert.DeserializeObject(text);

            apiUrl = array.apiKey;
            timeShutDown = array.shutDownTime;
            exchangeRate = array.exchangeRate;


            this.Hide();
            notifyIcon1.Visible = true;
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
                await Task.Delay(500);
                await onFunctionProcessingAsync();

                if (DateTime.Now.ToString("HH:mm") == timeShutDown)
                {
                    string path = "Log";
                    if (!Directory.Exists(path))
                    {
                        Directory.CreateDirectory(path);
                    }
                    string timeStr = DateTime.Now.ToString("MM/dd/yyyy-HH:mm");
                    string newPath = String.Format("Log\\{0}.txt", timeStr);
                    File.WriteAllText(newPath, label1.Text);
                    this.Close();
                }

            } 
        }

        private async Task onFunctionProcessingAsync()
        {
            try
            {
                var printResp = await client.GetAsync($"{apiUrl}print?$orderby=created_date desc&$filter=is_deleted eq false&$expand=sale($expand=sale_products($filter=is_deleted eq false))");
                var str = await printResp.Content.ReadAsStringAsync();
                var printList = odataGetValue<List<PrintModel>>(str);
                if (printList.Any())
                {
                    var print = printList.FirstOrDefault();
                    // Send To Print
                    PrintingService.printReceipt(print.sale, exchangeRate);

                    // Update Printing UI

                    await updatePrintedData(print);
                    label1.Text = label1.Text += "\nSuccess Execute";
                }
            }
            catch (Exception ex)
            {
                label1.Text = label1.Text += "\n" + ex.Message;
                throw;
            }
        } 

        private async Task updatePrintedData(PrintModel print)
        {
            var stringContent = new StringContent(JsonSerializer.Serialize(print), Encoding.UTF8, "application/json");
            var resp = await client.PostAsync($"{apiUrl}Print/Delete/{print.id}", stringContent);
            if ((resp.StatusCode.ToString()) == "OK")
            {
                return;
            }
            return;
        }


        public T odataGetValue<T>(string str)
        {
            JObject json = JObject.Parse(str);
            String jsonStr;
            if (json["value"] != null)
            {
                jsonStr = json["value"].ToString();
            }
            else
            {
                jsonStr = json.ToString();
            }

            T value = JsonSerializer.Deserialize<T>(jsonStr);

            return value;
        }
    }

    }
