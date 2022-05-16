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
    public class ProductController : ControllerBase
    {
        private readonly MyDbContext db;
        public ProductController(MyDbContext _db)
        {
            db = _db;
        }


        [HttpGet]
        [EnableQuery]
        public IQueryable<ProductModel> Get()
        {
            return db.Products;

        }

        [HttpGet]
        [EnableQuery(MaxExpansionDepth = 8)]
        public IActionResult Get([FromODataUri] Guid key)
        {
            var product = db.Products.Where(p => p.id == key);

            if (!product.Any())
            {
                return NotFound();
            }

            return Ok(SingleResult.Create(product));
        }

        [HttpPost("Save")]
        public async Task<IActionResult> Post([FromBody] ProductModel product)
        {
            if (product.id == Guid.Empty)
            {
                product.created_date = DateTime.Now;
                product.is_deleted = false;
                db.Products.Add(product);
                await db.SaveChangesAsync();
            }
            else
            {
                db.Products.Update(product);
                await db.SaveChangesAsync();
            }

            return Ok(product);
        }
    }
}
