using API.Models; 
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data; 
using System.Drawing;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using System.Windows.Forms; 

namespace ReportPrinting
{
    public partial class Form1 : Form
    {
        private string apiUrl;
        private Timer timer = new Timer();
        private static readonly HttpClient client = new HttpClient();

        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            apiUrl = System.Configuration.ConfigurationManager.AppSettings["apiKey"];
            onFormLoad();
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

        private void onFormLoad()
        {
            timer.Interval = 1000; // every 1 seconds
            timer.Tick += new EventHandler(timer_Tick);
            timer.Enabled = true;
        }

        private void timer_Tick(object sender, EventArgs e)
        {
            Console.WriteLine("This event will happen every 5 seconds");
            var exec = executeDataAsync();
        }

        private async Task executeDataAsync()
        { 
            try
            {

                var printResp = await client.GetAsync($"{apiUrl}print");

                var stringResp = await printResp.Content.ReadAsStringAsync();

                OdataGet printList = JsonSerializer.Deserialize<OdataGet>("{\u0022@odata.context\u0022:\u0022http://124.248.173.150:9090/api/$metadata#Print\u0022,\u0022value\u0022:[{\u0022id\u0022:\u00229e83da7a-017d-4aa5-a48c-df3e3c4ad83e\u0022,\u0022key\u0022:\u0022receipt\u0022,\u0022sale_id\u0022:\u002269d782f2-7cc3-4cd1-4d61-08da496aefa5\u0022,\u0022created_date\u0022:\u00222022-06-22T15:44:12.61\u002B07:00\u0022,\u0022created_by\u0022:\u0022Admin\u0022,\u0022is_deleted\u0022:false,\u0022deleted_date\u0022:\u00222022-06-22T15:44:12.61\u002B07:00\u0022,\u0022deleted_by\u0022:null}]}");
                Console.WriteLine(printList); 



            }
            catch (Exception ex)
            {
                 
                throw;
            }
             

        }
    }

    public class OdataGet
    {
        public string value { get; set; }
    }
}
