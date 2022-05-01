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
        [EnableQuery(MaxExpansionDepth = 0)]
        public SingleResult<StockTransactionModel> Get([FromODataUri] Guid key)
        {
            var c = db.StockTransactions.Where(r => r.id == key).AsQueryable();
            return SingleResult.Create(c);
        }


        [HttpPost("save")]
        public async Task<ActionResult<string>> Save([FromBody] StockTransactionModel model)
        {
            try
            {
                if (model.id == Guid.Empty)
                {
                    model.id = Guid.NewGuid();
                    model.created_date = DateTime.Now;
                    db.StockTransactions.Add(model);
                }
                else
                {
                    db.StockTransactions.Update(model);
                }

                await db.SaveChangesAsync();
                return Ok(model);
            }
            catch (Exception _ex)
            {
                return BadRequest(_ex.Message);
            }
        }
    }
}
