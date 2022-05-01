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
    public class CategoryController : ControllerBase
    {
        private readonly MyDbContext db;
        public CategoryController(MyDbContext _db)
        {
            db = _db;
        }


        [HttpGet]
        [EnableQuery]
        public IQueryable<CategoryModel> Get()
        {
            return db.Categories;

        }

        [HttpGet]
        [EnableQuery(MaxExpansionDepth = 0)]
        public SingleResult<CategoryModel> Get([FromODataUri] Guid key)
        {
            var c = db.Categories.Where(r => r.id == key).AsQueryable();
            return SingleResult.Create(c);
        }


        [HttpPost("save")]
        public async Task<ActionResult<CategoryModel>> Save([FromBody] CategoryModel model)
        {
            try
            {
                if (model.id == Guid.Empty)
                {
                    model.id = Guid.NewGuid();
                    model.created_date = DateTime.Now;
                    db.Categories.Add(model);
                }
                else
                {
                    db.Categories.Update(model);
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
