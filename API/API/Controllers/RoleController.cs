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
    }
}
