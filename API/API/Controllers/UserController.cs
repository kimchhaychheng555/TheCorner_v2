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
        [EnableQuery]
        public IQueryable<UserModel> Get()
        {
            return db.Users;

        }



        [HttpGet]
        [EnableQuery(MaxExpansionDepth = 8)]
        public async Task<SingleResult<UserModel>> Get([FromODataUri] Guid key)
        {
            return await Task.Factory.StartNew(() => SingleResult.Create<UserModel>(db.Users.Where(r => r.id == key).AsQueryable()));
        }


        [HttpPost("save")]
        public async Task<ActionResult<string>> Save([FromBody] UserModel model)
        {
            try
            {
                if (model.id == Guid.Empty)
                {
                    model.id = Guid.NewGuid();
                    model.created_date = DateTime.Now;
                    db.Users.Add(model);
                }
                else
                {
                    db.Users.Update(model);
                }

                await db.SaveChangesAsync();
                return Ok(model);
            }
            catch (Exception _ex)
            {
                return BadRequest(_ex.Message);
            }
        }

        [HttpPost("login")]
        public ActionResult<string> Login([FromBody] UserModel model)
        {
            var _username = model.username;
            var _password = model.password;

            var c = db.Users.Where(r => r.username == _username &&
                                        r.password == _password &&
                                        r.is_deleted == false).AsQueryable();

            if (c.Any())
            {
                return Ok(model);
            }
            return BadRequest();
        }

    }
}
