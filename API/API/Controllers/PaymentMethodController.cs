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
    public class PaymentMethodController : ControllerBase
    {
        private readonly MyDbContext db;
        public PaymentMethodController(MyDbContext _db)
        {
            db = _db;
        }


        [HttpGet]
        [EnableQuery]
        public IQueryable<PaymentMethodModel> Get()
        {
            return db.PaymentMethods;

        }



        [HttpGet]
        [EnableQuery(MaxExpansionDepth = 8)]
        public IActionResult Get([FromODataUri] Guid key)
        {
            var pm = db.PaymentMethods.Where(p => p.id == key);

            if (!pm.Any())
            {
                return NotFound();
            }

            return Ok(SingleResult.Create(pm));
        }

        [HttpPost("Save")]
        public async Task<IActionResult> Post([FromBody] PaymentMethodModel pm)
        {
            if (pm.id == Guid.Empty)
            {
                pm.created_date = DateTime.Now;
                pm.is_deleted = false;
                db.PaymentMethods.Add(pm);
                await db.SaveChangesAsync();
            }
            else
            {
                db.PaymentMethods.Update(pm);
                await db.SaveChangesAsync();
            }

            return Ok(pm);
        }
    }
}
