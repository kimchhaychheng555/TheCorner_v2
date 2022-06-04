using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms; 

namespace ReportPrinting
{
    public partial class Form1 : Form
    {
        private string apiUrl;
        private Timer timer = new Timer();

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
        }
    }
}
