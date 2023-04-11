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
    public class PermissionController : ControllerBase
    {
        private readonly MyDbContext db;
        public PermissionController(MyDbContext _db)
        {
            db = _db;
        }


        [HttpGet]
        [EnableQuery]
        public IQueryable<PermissionModel> Get()
        {
            return db.Permissions;

        }

        [HttpGet]
        [EnableQuery(MaxExpansionDepth = 8)]
        public IActionResult Get([FromODataUri] Guid key)
        {
            var permission = db.Permissions.Where(p => p.id == key);

            if (!permission.Any())
            {
                return NotFound();
            }

            return Ok(SingleResult.Create(permission));
        } 
    }
}
