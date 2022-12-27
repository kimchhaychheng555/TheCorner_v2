using API.Models;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace WindowsService1
{
    public class PrintService
    {
        //private static readonly HttpClient client = new HttpClient();
        //private  PrintReportService printReport = new PrintReportService();
        //private string exchangeRate = "";
        //private string apiUrl = "";
        //private string printerName = "";
        //private string fileName = "";
        //private int i = 0;

        //public void setValue(string exchangeRate, string apiUrl, string printerName, string fileName)
        //{
        //    this.exchangeRate = exchangeRate;
        //    this.apiUrl = apiUrl;
        //    this.printerName = printerName;
        //    this.fileName = fileName;
        //}
        //public async Task checkPrint()
        //{
        //    try
        //    {
        //       await onFunctionProcessingAsync();
        //    }
        //    catch (Exception ex)
        //    {
        //        TelegramService.writeLog("Catch", ex.Message);
        //    }
        //}

        //private async Task onFunctionProcessingAsync()
        //{
        //    try
        //    {
                
        //    }
        //    catch (Exception ex)
        //    {
        //        TelegramService.alertTelegram("Catch Error > "+ex.Message);
        //        TelegramService.writeLog("Catch", ex.Message);
        //    }
        //    finally
        //    {
        //         printReport = new PrintReportService();
        //    }
        //}

        //private async Task updatePrintedData(PrintModel print)
        //{
        //    var stringContent = new StringContent(JsonConvert.SerializeObject(print), Encoding.UTF8, "application/json");
        //    var resp = await client.PostAsync($"{apiUrl}Print/Delete/{print.id}", stringContent);
        //    if ((resp.StatusCode.ToString()) == "OK")
        //    {
        //        return;
        //    }
        //    return;
        //}
        
        //public T odataGetValue<T>(string str)
        //{
        //    JObject json = JObject.Parse(str);
        //    String jsonStr;
        //    if (json["value"] != null)
        //    {
        //        jsonStr = json["value"].ToString();
        //    }
        //    else
        //    {
        //        jsonStr = json.ToString();
        //    }

        //    T value = JsonConvert.DeserializeObject<T>(jsonStr);

        //    return value;
        //}
    }
}
