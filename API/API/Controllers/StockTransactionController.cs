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
    public class StockTransactionController : ControllerBase
    {
        private readonly MyDbContext db;
        public StockTransactionController(MyDbContext _db)
        {
            db = _db;
        }


        [HttpGet]
        [EnableQuery]
        public IQueryable<StockTransactionModel> Get()
        {
            return db.StockTransactions;

        }



        [HttpGet]
        [EnableQuery(MaxExpansionDepth = 8)]
        public IActionResult Get([FromODataUri] Guid key)
        {
            var st = db.StockTransactions.Where(p => p.id == key);

            if (!st.Any())
            {
                return NotFound();
            }

            return Ok(SingleResult.Create(st));
        }

        [HttpPost("Save")]
        public async Task<IActionResult> Post([FromBody] StockTransactionModel st)
        {
            if (st.id == Guid.Empty)
            {
                st.created_date = DateTime.Now;
                st.is_deleted = false;
                db.StockTransactions.Add(st);
                await db.SaveChangesAsync();
            }
            else
            {
                db.StockTransactions.Update(st);
                await db.SaveChangesAsync();
            }

            return Ok(st);
        }
    }
}
