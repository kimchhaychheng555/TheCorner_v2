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
    public class ExpenseController : ControllerBase
    {
        private readonly MyDbContext db;
        public ExpenseController(MyDbContext _db)
        {
            db = _db;
        }


        [HttpGet]
        [EnableQuery]
        public IQueryable<ExpenseModel> Get()
        {
            return db.Expenses;

        }

        [HttpGet]
        [EnableQuery(MaxExpansionDepth = 8)]
        public IActionResult Get([FromODataUri] Guid key)
        {
            var expense = db.Expenses.Where(p => p.id == key);

            if (!expense.Any())
            {
                return NotFound();
            }

            return Ok(SingleResult.Create(expense));
        }

        [HttpPost("Save")]
        public async Task<IActionResult> Post([FromBody] ExpenseModel expense)
        {
            if (expense.id == Guid.Empty)
            {
                db.Expenses.Add(expense);
                await db.SaveChangesAsync();
            }
            else
            {
                db.Expenses.Update(expense);
                await db.SaveChangesAsync();
            }

            return Ok(expense);
        }

        [HttpPost("Delete/{key}")]
        public async Task<IActionResult> Post([FromODataUri] Guid key)
        {
            var dataList = db.Expenses.Where(p => p.id == key);
            if (!dataList.Any())
            {
                return NotFound();
            }
            var data = dataList.FirstOrDefault();
            data.is_deleted = true;

            db.Expenses.Update(data);
            await db.SaveChangesAsync();

            return Ok(data);
        }
        [HttpPost("Restore/{key}")]
        public async Task<IActionResult> PostRestore([FromODataUri] Guid key)
        {
            var dataList = db.Expenses.Where(p => p.id == key);
            if (!dataList.Any())
            {
                return NotFound();
            }
            var data = dataList.FirstOrDefault();
            data.is_deleted = false;

            db.Expenses.Update(data);
            await db.SaveChangesAsync();

            return Ok(data);
        }
    }
}
