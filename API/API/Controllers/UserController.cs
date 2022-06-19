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

        [HttpPost("Save")]
        public async Task<IActionResult> Post([FromBody] UserModel user)
        {
            if(user.id == Guid.Empty)
            {
                var checkUser = db.Users.Where(r => r.username == user.username && r.is_deleted == false);
                if (checkUser.Any())
                {
                    return BadRequest(new BadRequestModel() { message = "username_has_already_exists" });
                }

                 
                db.Users.Add(user);
                await db.SaveChangesAsync();
            }
            else
            {
                var checkUser = db.Users.Where(r => r.username == user.username && r.is_deleted == false);
                if (checkUser.Any())
                {
                    return BadRequest(new BadRequestModel() { message = "username_has_already_exists" });
                }

                db.Users.Update(user);
                await db.SaveChangesAsync();
            }
            
            return Ok(user);
        }


        [HttpPost("Login")]
        public IActionResult Login([FromBody] UserModel model)
        {
            var user = db.Users.Where(u => u.username == model.username && u.password == model.password && u.is_deleted == false);
            if (user.Any())
            {
                return Ok(user.FirstOrDefault());
            }

            return NotFound();
        }

        [HttpPost("Delete/{key}")]
        public async Task<IActionResult> Post([FromODataUri] Guid key)
        {
            var dataList = db.Users.Where(p => p.id == key);
            if (!dataList.Any())
            {
                return NotFound();
            }
            var data = dataList.FirstOrDefault();
            data.is_deleted = true;

            db.Users.Update(data);
            await db.SaveChangesAsync();

            return Ok(data);
        }
        [HttpPost("Restore/{key}")]
        public async Task<IActionResult> PostRestore([FromODataUri] Guid key)
        {
            var dataList = db.Users.Where(p => p.id == key);
            if (!dataList.Any())
            {
                return NotFound();
            }
            var data = dataList.FirstOrDefault();
            data.is_deleted = false;

            db.Users.Update(data);
            await db.SaveChangesAsync();

            return Ok(data);
        }

    }
}
