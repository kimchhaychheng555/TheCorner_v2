using API.Models;
using Microsoft.AspNet.OData;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ConnectionController : ControllerBase
    {
        [HttpGet]
        [EnableQuery]
        public string Get()
        {
            return "";

        }



        [HttpPost]
        public string Save()
        {
            return "";
        }
    }
}
