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
        [EnableQuery(MaxExpansionDepth = 8)]
        public IActionResult Get([FromODataUri] Guid key)
        {
            var sp = db.SaleProducts.Where(p => p.id == key);

            if (!sp.Any())
            {
                return NotFound();
            }

            return Ok(SingleResult.Create(sp));
        }

        [HttpPost("Save")]
        public async Task<IActionResult> Post([FromBody] SaleProductModel sp)
        {
            if (sp.id == Guid.Empty)
            {
                sp.created_date = DateTime.Now;
                sp.is_deleted = false;
                db.SaleProducts.Add(sp);
                await db.SaveChangesAsync();
            }
            else
            {
                db.SaleProducts.Update(sp);
                await db.SaveChangesAsync();
            }

            return Ok(sp);
        }
    }
}
