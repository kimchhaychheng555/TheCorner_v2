using API.Models;
using Microsoft.AspNet.OData;
using Microsoft.AspNet.OData.Routing;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class UserController : ODataController
    {
        private readonly MyDbContext db;
        public UserController(MyDbContext _db)
        {
            db = _db;
        }

        [HttpGet]
        public IActionResult Get()
        {
            return Ok(db.Users);
        }

        [HttpGet]
        [EnableQuery(MaxExpansionDepth = 8)] 
        public IActionResult Get([FromODataUri] Guid key)
        {
            var people = db.Users.Where(p => p.id == key);

            if (!people.Any())
            {
                return NotFound();
            }

            return Ok(SingleResult.Create(people));
        }

        [HttpPost]
        public async Task<IActionResult> Post([FromBody] UserModel user)
        {
            user.id = Guid.NewGuid();
            db.Users.Add(user);
            await db.SaveChangesAsync();
            return Ok(user);
        }


        [HttpPost("Login")]
        public IActionResult Login([FromBody] UserModel user)
        {
            return Ok(user);
        }

    }
}
