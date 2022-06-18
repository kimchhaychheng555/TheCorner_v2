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
    public class TableController : ControllerBase
    {
        private readonly MyDbContext db;
        public TableController(MyDbContext _db)
        {
            db = _db;
        }


        [HttpGet]
        [EnableQuery]
        public IQueryable<TableModel> Get()
        {
            return db.Tables;

        }



        [HttpGet]
        [EnableQuery(MaxExpansionDepth = 8)]
        public IActionResult Get([FromODataUri] Guid key)
        {
            var table = db.Tables.Where(p => p.id == key);

            if (!table.Any())
            {
                return NotFound();
            }

            return Ok(SingleResult.Create(table));
        }

        [HttpPost("Save")]
        public async Task<IActionResult> Post([FromBody] TableModel table)
        {
            if (table.id == Guid.Empty)
            { 
                db.Tables.Add(table);
                await db.SaveChangesAsync();
            }
            else
            {
                db.Tables.Update(table);
                await db.SaveChangesAsync();
            }

            return Ok(table);
        }


        [HttpPost("Delete/{key}")]
        public async Task<IActionResult> Post([FromODataUri] Guid key)
        {
            var dataList = db.Tables.Where(p => p.id == key);
            if (!dataList.Any())
            {
                return NotFound();
            }
            var data = dataList.FirstOrDefault();
            data.is_deleted = true;

            db.Tables.Update(data);
            await db.SaveChangesAsync();

            return Ok(data);
        }
    }
}
