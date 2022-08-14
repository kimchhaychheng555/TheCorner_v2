using API.Models;
using Microsoft.AspNet.OData;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace API.Controllers
{
    [ApiController]
    [Route("api")]
    public class AppController : ControllerBase
    {

        private readonly MyDbContext db; 
        public IConfiguration Configuration { get; }
        public AppController(MyDbContext _db, IConfiguration configuration)
        {
            db = _db;
            Configuration = configuration;
        }


        [HttpPost]
        [Route("StoreProcedure")]
        public ActionResult GetData([FromBody] StoreProcedureModel spModel)
        {
            var connStr = Configuration.GetConnectionString("SqlServerConnection");
            try
            {
                using (SqlConnection con = new SqlConnection(connStr))
                {
                    using (SqlCommand cmd = new SqlCommand(spModel.procedureName, con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        if (spModel.parameterName.Count() > 0)
                        {
                            for (var i = 0; i < spModel.parameterName.Count(); i++)
                            {
                                var pName = spModel.parameterName[i];
                                var pValue = spModel.parameterValue[i];
                                cmd.Parameters.AddWithValue(pName, pValue);
                            }
                        }
                        con.Open();
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                return Ok(reader["data"]);
                            }

                        }
                    }
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }

            return NotFound();
        }
    }
}
