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
    public class SalePaymentController : ControllerBase
    {
        private readonly MyDbContext db;
        public SalePaymentController(MyDbContext _db)
        {
            db = _db;
        }


        [HttpGet]
        [EnableQuery]
        public IQueryable<SalePaymentModel> Get()
        {
            return db.SalePayments;

        }



        [HttpGet]
        [EnableQuery(MaxExpansionDepth = 8)]
        public IActionResult Get([FromODataUri] Guid key)
        {
            var sale_payment = db.SalePayments.Where(p => p.id == key);

            if (!sale_payment.Any())
            {
                return NotFound();
            }

            return Ok(SingleResult.Create(sale_payment));
        }

        [HttpPost("Save")]
        public async Task<IActionResult> Post([FromBody] SalePaymentModel sale_payment)
        {
            if (sale_payment.id == Guid.Empty)
            { 
                db.SalePayments.Add(sale_payment);
                await db.SaveChangesAsync();
            }
            else
            {
                db.SalePayments.Update(sale_payment);
                await db.SaveChangesAsync();
            }

            return Ok(sale_payment);
        }


        [HttpPost("Delete/{key}")]
        public async Task<IActionResult> Post([FromODataUri] Guid key)
        {
            var dataList = db.SalePayments.Where(p => p.id == key);
            if (!dataList.Any())
            {
                return NotFound();
            }
            var data = dataList.FirstOrDefault();
            data.is_deleted = true;

            db.SalePayments.Update(data);
            await db.SaveChangesAsync();

            return Ok(data);
        }
        [HttpPost("Restore/{key}")]
        public async Task<IActionResult> PostRestore([FromODataUri] Guid key)
        {
            var dataList = db.SalePayments.Where(p => p.id == key);
            if (!dataList.Any())
            {
                return NotFound();
            }
            var data = dataList.FirstOrDefault();
            data.is_deleted = false;

            db.SalePayments.Update(data);
            await db.SaveChangesAsync();

            return Ok(data);
        }
    }
}
