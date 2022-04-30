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
    public class PrintController : ControllerBase
    {
        private readonly MyDbContext db;
        public PrintController(MyDbContext _db)
        {
            db = _db;
        }


        [HttpGet]
        [EnableQuery]
        public IQueryable<PrintModel> Get()
        {
            return db.Prints;

        } 
    }
}
