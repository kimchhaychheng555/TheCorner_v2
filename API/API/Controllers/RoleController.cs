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
    public class RoleController : ControllerBase
    {
        private readonly MyDbContext db;
        public RoleController(MyDbContext _db)
        {
            db = _db;
        }


        [HttpGet]
        [EnableQuery]
        public IQueryable<RoleModel> Get()
        {
            return db.Roles;

        }

        [HttpGet]
        [EnableQuery(MaxExpansionDepth = 8)]
        public IActionResult Get([FromODataUri] Guid key)
        {
            var role = db.Roles.Where(p => p.id == key);

            if (!role.Any())
            {
                return NotFound();
            }

            return Ok(SingleResult.Create(role));
        }

        [HttpPost("Save")]
        public async Task<IActionResult> Post([FromBody] RoleModel role)
        {
            if (role.id == Guid.Empty)
            {
                db.Roles.Add(role);
                await db.SaveChangesAsync();
            }
            else
            {
                db.Roles.Update(role);
                await db.SaveChangesAsync();
            }

            return Ok(role);
        }


        [HttpPost("Delete/{key}")]
        public async Task<IActionResult> Post([FromODataUri] Guid key)
        {
            var dataList = db.Roles.Where(p => p.id == key);
            if (!dataList.Any())
            {
                return NotFound();
            }
            var data = dataList.FirstOrDefault();
            data.is_deleted = true;

            db.Roles.Update(data);
            await db.SaveChangesAsync();

            return Ok(data);
        }
    }
}
