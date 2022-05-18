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
        [EnableQuery(MaxExpansionDepth = 8)]
        public IActionResult Get([FromODataUri] Guid key)
        {
            var sale = db.Sales.Where(p => p.id == key);

            if (!sale.Any())
            {
                return NotFound();
            }

            return Ok(SingleResult.Create(sale));
        }

        [HttpPost("Save")]
        public async Task<IActionResult> Post([FromBody] SaleModel sale)
        {
            if (sale.id == Guid.Empty)
            { 
                db.Sales.Add(sale);
                await db.SaveChangesAsync();
            }
            else
            {
                db.Sales.Update(sale);
                await db.SaveChangesAsync();
            }

            return Ok(sale);
        }
    }
}
