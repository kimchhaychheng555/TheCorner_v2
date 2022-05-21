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
    public class DocumentController : ControllerBase
    {
        private readonly MyDbContext db;
        public DocumentController(MyDbContext _db)
        {
            db = _db;
        }


        [HttpGet]
        [EnableQuery]
        public IQueryable<DocumentModel> Get()
        {
            return db.Documents;

        }

        [HttpGet]
        [EnableQuery(MaxExpansionDepth = 8)]
        public IActionResult Get([FromODataUri] Guid key)
        {
            var role = db.Documents.Where(p => p.id == key);

            if (!role.Any())
            {
                return NotFound();
            }

            return Ok(SingleResult.Create(role));
        }

        [HttpPost("Save")]
        public async Task<IActionResult> Post([FromBody] DocumentModel doc)
        {
            
            var _doc = db.Documents.Where(p => p.key_name == doc.key_name);
            if (_doc.Any())
            {
                doc.id = _doc.FirstOrDefault().id;
                db.Documents.Update(doc);
                await db.SaveChangesAsync();
            }
            else
            {

                if (doc.id == Guid.Empty)
                {
                    db.Documents.Add(doc);
                    await db.SaveChangesAsync();
                }
                else
                {
                    db.Documents.Update(doc);
                    await db.SaveChangesAsync();
                }
            }

            return Ok(doc);
        }

        [HttpGet("Find/{key}")]
        [EnableQuery(MaxExpansionDepth = 8)]
        public IActionResult PostKey([FromODataUri] string key)
        {
            var role = db.Documents.Where(p => p.key_name == key);

            if (!role.Any())
            {
                return NotFound();
            }

            return Ok(SingleResult.Create(role));
        }
    }
}
