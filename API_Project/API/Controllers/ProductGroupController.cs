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
    public class ProductGroupController : ControllerBase
    {
        private readonly MyDbContext db;
        public ProductGroupController(MyDbContext _db)
        {
            db = _db;
        }


        [HttpGet]
        [EnableQuery]
        public IQueryable<ProductGroupModel> Get()
        {
            return db.ProductGroups;

        }

        [HttpGet]
        [EnableQuery(MaxExpansionDepth = 8)]
        public IActionResult Get([FromODataUri] Guid key)
        {
            var pg = db.ProductGroups.Where(p => p.id == key);

            if (!pg.Any())
            {
                return NotFound();
            }

            return Ok(SingleResult.Create(pg));
        } 
        

        [HttpPost("Save")]
        public async Task<IActionResult> Post([FromBody] ProductGroupModel pg)
        {
            if (pg.id == Guid.Empty)
            {
                
                db.ProductGroups.Add(pg); 
            }
            else
            {
                db.ProductGroups.Update(pg);
            } 

            await db.SaveChangesAsync();
            return Ok(pg);
        }

        [HttpPost("Delete/{key}")] 
        public async Task<IActionResult> Post([FromODataUri] Guid key)
        {
            var pg= db.ProductGroups.Where(p => p.id == key);
            if (!pg.Any())
            {
                return NotFound();
            }
            var product = pg.FirstOrDefault();
            product.is_deleted = true;

            db.ProductGroups.Update(product);
            await db.SaveChangesAsync();

            return Ok(pg);
        }
        [HttpPost("Restore/{key}")]
        public async Task<IActionResult> PostRestore([FromODataUri] Guid key)
        {
            var pg = db.ProductGroups.Where(p => p.id == key);
            if (!pg.Any())
            {
                return NotFound();
            }
            var product = pg.FirstOrDefault();
            product.is_deleted = false;

            db.ProductGroups.Update(product);
            await db.SaveChangesAsync();

            return Ok(product);
        }
    }
}
