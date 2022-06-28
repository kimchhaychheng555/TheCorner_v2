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
    public class PermissionRoleController : ControllerBase
    {
        private readonly MyDbContext db;
        public PermissionRoleController(MyDbContext _db)
        {
            db = _db;
        }


        [HttpGet]
        [EnableQuery]
        public IQueryable<PermissionRoleModel> Get()
        {
            return db.PermissionRoles;

        }

        [HttpGet]
        [EnableQuery(MaxExpansionDepth = 8)]
        public IActionResult Get([FromODataUri] Guid key)
        {
            var role = db.PermissionRoles.Where(p => p.id == key);

            if (!role.Any())
            {
                return NotFound();
            }

            return Ok(SingleResult.Create(role));
        }

        [HttpPost("Save")]
        public async Task<IActionResult> Post([FromBody] PermissionRoleModel permissionRole)
        {
            if (permissionRole.id == Guid.Empty)
            {
                db.PermissionRoles.Add(permissionRole);
                await db.SaveChangesAsync();
            }
            else
            {
                db.PermissionRoles.Update(permissionRole);
                await db.SaveChangesAsync();
            }

            return Ok(permissionRole);
        }


        [HttpPost("Delete/{key}")]
        public async Task<IActionResult> Post([FromODataUri] Guid key)
        {
            var dataList = db.PermissionRoles.Where(p => p.id == key);
            if (!dataList.Any())
            {
                return NotFound();
            }
            var data = dataList.FirstOrDefault(); 

            db.PermissionRoles.Remove(data);
            await db.SaveChangesAsync();

            return Ok(data);
        }   
    }
}
