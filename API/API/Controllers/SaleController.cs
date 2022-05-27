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
                var getInvoiceNumber = db.Documents.Where(x => x.key_name == "invoice_number").FirstOrDefault();
                int input_number = Convert.ToInt32(getInvoiceNumber.value);
                var _prefix = getInvoiceNumber.prefix ?? "";
                string number_value = _prefix + input_number.ToString().PadLeft((getInvoiceNumber.max_length.Length), '0');

                sale.invoice_number = number_value;

                 
                db.Sales.Add(sale);
                if (sale.id != Guid.Empty)
                {
                    updateInvoiceNumber();
                }
                await db.SaveChangesAsync();
            }
            else
            {
                db.Sales.Update(sale);
                await db.SaveChangesAsync();
            }

            return Ok(sale);
        }

        private void updateInvoiceNumber()
        {
            try
            {

                var getInvoiceNumber = db.Documents.Where(x => x.key_name == "invoice_number").FirstOrDefault();
                int updateInvoiceValue = (int.Parse(getInvoiceNumber.value)) + 1;
                getInvoiceNumber.value = updateInvoiceValue.ToString();
                db.Documents.Update(getInvoiceNumber);
            }
            catch (Exception ex)
            {
                
            }

        }
    }
}
