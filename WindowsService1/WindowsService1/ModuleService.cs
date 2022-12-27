using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace WindowsService1
{
    class ModuleService
    {
        private static readonly HttpClient client = new HttpClient();
        public static void alertTelegram(string text)
        {
            client.GetAsync(@"https://api.telegram.org/bot1447468812:AAF-avVJ89HS888VRf6ZlvDAXbrTWTKjn0I/sendMessage?chat_id=-1001880895558&text=" + text);
        }

        //public static void writeLog(string status, string text)
        //{
        //    string path = AppDomain.CurrentDomain.BaseDirectory + @"Log";

        //    if (!Directory.Exists(path))
        //    {
        //        Directory.CreateDirectory(path);
        //    }
        //    string timeStr = DateTime.Now.ToString("MM-dd-yyyy");
        //    string newPath = String.Format(path + @"\{0}.txt", timeStr);


        //    string timeLogStr = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
        //    var log = string.Format("{0} | status: {1} | value: {2}", timeLogStr, status, text) + Environment.NewLine;
        //    File.AppendAllText(newPath, log);
        //}

    }
}
