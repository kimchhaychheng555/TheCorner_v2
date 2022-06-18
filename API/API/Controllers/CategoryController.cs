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
        [EnableQuery(MaxExpansionDepth = 8)]
        public IActionResult Get([FromODataUri] Guid key)
        {
            var category = db.Categories.Where(p => p.id == key);

            if (!category.Any())
            {
                return NotFound();
            }

            return Ok(SingleResult.Create(category));
        }

        [HttpPost("Save")]
        public async Task<IActionResult> Post([FromBody] CategoryModel category)
        {
            if (category.id == Guid.Empty)
            {
                db.Categories.Add(category);
                await db.SaveChangesAsync();
            }
            else
            {
                db.Categories.Update(category);
                await db.SaveChangesAsync();
            }

            return Ok(category);
        }

        [HttpPost("Delete/{key}")]
        public async Task<IActionResult> Post([FromODataUri] Guid key)
        {
            var categories = db.Categories.Where(p => p.id == key);
            if (!categories.Any())
            {
                return NotFound();
            }
            var category = categories.FirstOrDefault();
            category.is_deleted = true;

            db.Categories.Update(category);
            await db.SaveChangesAsync();

            return Ok(category);
        }
    }
}
