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
    public class StockInventoryController : ControllerBase
    {
        private readonly MyDbContext db;
        public StockInventoryController(MyDbContext _db)
        {
            db = _db;
        }


        [HttpGet]
        [EnableQuery]
        public IQueryable<StockInventoryModel> Get()
        {
            return db.StockInventories;

        }



        [HttpGet]
        [EnableQuery(MaxExpansionDepth = 8)]
        public IActionResult Get([FromODataUri] Guid key)
        {
            var si = db.StockInventories.Where(p => p.id == key);

            if (!si.Any())
            {
                return NotFound();
            }

            return Ok(SingleResult.Create(si));
        }

        [HttpPost("Save")]
        public async Task<IActionResult> Post([FromBody] StockInventoryModel si)
        {
            if (si.id == Guid.Empty)
            {
                si.created_date = DateTime.Now;
                si.is_deleted = false;
                db.StockInventories.Add(si);
                await db.SaveChangesAsync();
            }
            else
            {
                db.StockInventories.Update(si);
                await db.SaveChangesAsync();
            }

            return Ok(si);
        }
    }
}
