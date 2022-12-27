using System;
using System.Collections.Generic;
using System.ServiceProcess;
using System.Threading; 

namespace WindowsService1
{
    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        static void Main()
        {
            Service1 service = new Service1();
            service.onDebug();
            Thread.Sleep(Timeout.Infinite);

            // Build Run Service

            //ServiceBase[] ServicesToRun;
            //ServicesToRun = new ServiceBase[]
            //{
            //    new Service1()
            //};
            //ServiceBase.Run(ServicesToRun);

        }
    }
}
