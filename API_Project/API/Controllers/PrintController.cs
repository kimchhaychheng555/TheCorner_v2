using API.Models;
using Microsoft.AspNet.OData;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Threading.Tasks;

namespace API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class PrintController : ControllerBase
    {
        private readonly MyDbContext db; 
        IConfiguration configuration;
        public PrintController(MyDbContext _db, IConfiguration _configuration)
        {
            db = _db;
            configuration = _configuration;
        }


        [HttpGet]
        [EnableQuery]
        public IQueryable<PrintModel> Get()
        {
            return db.Prints;

        }

        [HttpPost("Save")]
        public async Task<IActionResult> Post([FromBody] PrintModel print)
        {
            var printPath = configuration.GetSection("FileWatcher").Value;

            var json = new
            {
                sale_id = print.sale_id
            };

            System.IO.File.WriteAllText(string.Format("{0}/{1}.json", printPath, Guid.NewGuid().ToString()), JsonConvert.SerializeObject(json));
            return Ok(print);
        }

        [HttpPost("Delete/{key}")]
        public async Task<IActionResult> Post([FromODataUri] Guid key)
        {
            var dataList = db.Prints.Where(p => p.id == key);
            if (!dataList.Any())
            {
                return NotFound();
            }
            var data = dataList.FirstOrDefault(); 
            db.Prints.Remove(data);
            await db.SaveChangesAsync();

            return Ok(data);
        }
    }
}
