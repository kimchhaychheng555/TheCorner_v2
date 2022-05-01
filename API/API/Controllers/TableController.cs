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
    public class TableController : ControllerBase
    {
        private readonly MyDbContext db;
        public TableController(MyDbContext _db)
        {
            db = _db;
        }


        [HttpGet]
        [EnableQuery]
        public IQueryable<TableModel> Get()
        {
            return db.Tables;

        }



        [HttpGet]
        [EnableQuery(MaxExpansionDepth = 0)]
        public SingleResult<TableModel> Get([FromODataUri] Guid key)
        {
            var c = db.Tables.Where(r => r.id == key).AsQueryable();
            return SingleResult.Create(c);
        }


        [HttpPost("save")]
        public async Task<ActionResult<string>> Save([FromBody] TableModel model)
        {
            try
            {
                if (model.id == Guid.Empty)
                {
                    model.id = Guid.NewGuid();
                    model.created_date = DateTime.Now;
                    db.Tables.Add(model);
                }
                else
                {
                    db.Tables.Update(model);
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
