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
    public class SaleProductController : ControllerBase
    {
        private readonly MyDbContext db;
        public SaleProductController(MyDbContext _db)
        {
            db = _db;
        }


        [HttpGet]
        [EnableQuery]
        public IQueryable<SaleProductModel> Get()
        {
            return db.SaleProducts;

        }



        [HttpGet]
        [EnableQuery(MaxExpansionDepth = 0)]
        public SingleResult<SaleProductModel> Get([FromODataUri] Guid key)
        {
            var c = db.SaleProducts.Where(r => r.id == key).AsQueryable();
            return SingleResult.Create(c);
        }


        [HttpPost("save")]
        public async Task<ActionResult<string>> Save([FromBody] SaleProductModel model)
        {
            try
            {
                if (model.id == Guid.Empty)
                {
                    model.id = Guid.NewGuid();
                    model.created_date = DateTime.Now;
                    db.SaleProducts.Add(model);
                }
                else
                {
                    db.SaleProducts.Update(model);
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
