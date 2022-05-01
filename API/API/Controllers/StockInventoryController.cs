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
        [EnableQuery(MaxExpansionDepth = 0)]
        public SingleResult<StockInventoryModel> Get([FromODataUri] Guid key)
        {
            var c = db.StockInventories.Where(r => r.id == key).AsQueryable();
            return SingleResult.Create(c);
        }


        [HttpPost("save")]
        public async Task<ActionResult<string>> Save([FromBody] StockInventoryModel model)
        {
            try
            {
                if (model.id == Guid.Empty)
                {
                    model.id = Guid.NewGuid();
                    model.created_date = DateTime.Now;
                    db.StockInventories.Add(model);
                }
                else
                {
                    db.StockInventories.Update(model);
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
