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
        [ODataRoute("User/Save")]
        public System.Web.Http.IHttpActionResult Save([FromBody] UserModel person)
        {
            if (!ModelState.IsValid)
            {
                return (System.Web.Http.IHttpActionResult)BadRequest(ModelState);
            }

            // add the person to the People collection
            db.Users.Add(person);
            db.SaveChanges();

            // return the created person
            return (System.Web.Http.IHttpActionResult)Ok(person);
        }


        [HttpPost]
        [Route("Login")]
        public ActionResult LoginUser([FromBody] UserModel person)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            // add the person to the People collection
            db.Users.Add(person);
            db.SaveChanges();

            // return the created person
            return Ok(person);
        }

    }
}
