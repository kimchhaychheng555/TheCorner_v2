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

        [HttpPost("Save")]
        public async Task<IActionResult> Post([FromBody] PrintModel print)
        {
            if (print.id == Guid.Empty)
            {
                db.Prints.Add(print);
                await db.SaveChangesAsync();
            }
            else
            {
                db.Prints.Update(print);
                await db.SaveChangesAsync();
            }

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
