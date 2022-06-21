using API.Models;
using Microsoft.AspNet.OData;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
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

        [HttpGet]
        [EnableQuery(MaxExpansionDepth = 8)]
        public IActionResult Get(string keyword = "")
        {
            if (string.IsNullOrEmpty(keyword))
            {
                return Ok(db.Products);

            }
            else
            {
                var data = from r in db.Products
                           where
                                 EF.Functions.Like(
                                     (
                                        (r.name ?? " ") +
                                        (r.price.ToString() ?? " ") +
                                        (r.cost.ToString() ?? " ")
                                     ).ToLower().Trim(), $"%{keyword}%".ToLower().Trim())
                           select r;

                return Ok(data);

            }

        }

        [HttpPost("Save")]
        public async Task<IActionResult> Post([FromBody] ProductModel product)
        {
            if (product.id == Guid.Empty)
            {
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

        [HttpPost("Delete/{key}")] 
        public async Task<IActionResult> Post([FromODataUri] Guid key)
        {
            var products= db.Products.Where(p => p.id == key);
            if (!products.Any())
            {
                return NotFound();
            }
            var product = products.FirstOrDefault();
            product.is_deleted = true;

            db.Products.Update(product);
            await db.SaveChangesAsync();

            return Ok(product);
        }
        [HttpPost("Restore/{key}")]
        public async Task<IActionResult> PostRestore([FromODataUri] Guid key)
        {
            var products = db.Products.Where(p => p.id == key);
            if (!products.Any())
            {
                return NotFound();
            }
            var product = products.FirstOrDefault();
            product.is_deleted = false;

            db.Products.Update(product);
            await db.SaveChangesAsync();

            return Ok(product);
        }
    }
}
