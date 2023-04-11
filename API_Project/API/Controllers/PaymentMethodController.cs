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


        [HttpPost("Delete/{key}")]
        public async Task<IActionResult> Post([FromODataUri] Guid key)
        {
            var dataList = db.PaymentMethods.Where(p => p.id == key);
            if (!dataList.Any())
            {
                return NotFound();
            }
            var data = dataList.FirstOrDefault();
            data.is_deleted = true;

            db.PaymentMethods.Update(data);
            await db.SaveChangesAsync();

            return Ok(data);
        }
        [HttpPost("Restore/{key}")]
        public async Task<IActionResult> PostRestore([FromODataUri] Guid key)
        {
            var dataList = db.PaymentMethods.Where(p => p.id == key);
            if (!dataList.Any())
            {
                return NotFound();
            }
            var data = dataList.FirstOrDefault();
            data.is_deleted = false;

            db.PaymentMethods.Update(data);
            await db.SaveChangesAsync();

            return Ok(data);
        }
    }
}
