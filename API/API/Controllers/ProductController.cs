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
        [EnableQuery(MaxExpansionDepth = 0)]
        public SingleResult<ProductModel> Get([FromODataUri] Guid key)
        {
            var c = db.Products.Where(r => r.id == key).AsQueryable();
            return SingleResult.Create(c);
        }


        [HttpPost("save")]
        public async Task<ActionResult<string>> Save([FromBody] ProductModel model)
        {
            try
            {
                if (model.id == Guid.Empty)
                {
                    model.id = Guid.NewGuid();
                    model.created_date = DateTime.Now;
                    db.Products.Add(model);
                }
                else
                {
                    db.Products.Update(model);
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
