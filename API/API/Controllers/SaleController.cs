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
    public class SaleController : ControllerBase
    {
        private readonly MyDbContext db;
        public SaleController(MyDbContext _db)
        {
            db = _db;
        }


        [HttpGet]
        [EnableQuery]
        public IQueryable<SaleModel> Get()
        {
            return db.Sales;

        }



        [HttpGet]
        [EnableQuery(MaxExpansionDepth = 0)]
        public SingleResult<SaleModel> Get([FromODataUri] Guid key)
        {
            var c = db.Sales.Where(r => r.id == key).AsQueryable();
            return SingleResult.Create(c);
        }


        [HttpPost("save")]
        public async Task<ActionResult<SaleModel>> Save([FromBody] SaleModel model)
        {
            try
            {
                if (model.id == Guid.Empty)
                {
                    model.id = Guid.NewGuid();
                    model.created_date = DateTime.Now;
                    db.Sales.Add(model);
                }
                else
                {
                    db.Sales.Update(model);
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
