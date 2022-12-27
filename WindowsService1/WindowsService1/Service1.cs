using API.Models;
using Newtonsoft.Json;
using RestSharp;
using System.Configuration;
using System.Diagnostics;
using System.IO;
using System.Net;
using System.ServiceProcess;

namespace WindowsService1
{
    public partial class Service1 : ServiceBase
    { 
        PrintService print = new PrintService();
        private readonly static string apiUrl = ConfigurationManager.AppSettings["apiKey"];
        private readonly static string exchangeRate = ConfigurationManager.AppSettings["exchangeRate"];
        private readonly static string printerName = ConfigurationManager.AppSettings["printerName"];
        private readonly static string fileName = ConfigurationManager.AppSettings["fileName"];

        //Option
        
        private readonly static string serviceName = ConfigurationManager.AppSettings["ServiceName"];
        private readonly static string fileSystemWatcherPath = ConfigurationManager.AppSettings["FileSystemWatcherPath"];
        
        public Service1()
        {
            InitializeComponent();
        }


        public void onDebug()
        {
            OnStart(null);
        }

        protected override void OnStart(string[] args)
        {
            ModuleService.alertTelegram("Service Start - " + serviceName);
            onRunning();
        }


        public void onRunning()
        {
            FileSystemWatcher watcher = new FileSystemWatcher(fileSystemWatcherPath, "*.json");
            watcher.NotifyFilter = NotifyFilters.LastAccess
                        | NotifyFilters.LastWrite
                        | NotifyFilters.FileName
                        | NotifyFilters.DirectoryName;

            // Add event handlers.
            watcher.Created += new FileSystemEventHandler(OnChanged);

            // Begin watching.
            watcher.EnableRaisingEvents = true;
        }

        public void OnChanged(object sender, FileSystemEventArgs e)
        {
            try
            {
                using (FileStream stream = File.Open(e.FullPath, FileMode.Open))
                {
                    string text = "";
                    using (var sr = new StreamReader(stream))
                    {
                        text = sr.ReadToEnd();
                        dynamic json = JsonConvert.DeserializeObject<dynamic>(text);

                        System.Net.ServicePointManager.Expect100Continue = false;
                        var url = string.Format("{0}sale({1})?$expand=sale_products", apiUrl, json["sale_id"]);
                        var client = new RestClient(url);
                        var request = new RestRequest(url, Method.Get);
                        RestResponse response = client.Execute(request);

                        if (response.StatusCode == HttpStatusCode.OK)
                        {
                            PrintReportService printService = new PrintReportService();
                            var sale = JsonConvert.DeserializeObject<SaleModel>(response.Content);
                            printService.printReceipt(sale, exchangeRate, printerName, fileName);
                        }

                        sr.Dispose();
                    }

                    stream.Dispose();
                }
            }
            catch (System.Exception ex)
            {
                ModuleService.alertTelegram(string.Format("{0}>Catch : {1}", serviceName, ex.Message.ToString()));
            }
            finally
            {
                File.Delete(e.FullPath);
            }
        }

        protected override void OnStop()
        {
            ModuleService.alertTelegram("Service Stop - " + ConfigurationManager.AppSettings["ServiceName"]);
        }
    }
}
