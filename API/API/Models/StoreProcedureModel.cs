using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace API.Models
{
    public class StoreProcedureModel
    { 
            public string procedureName { get; set; }
            public List<string> parameterName { get; set; }
            public List<object> parameterValue { get; set; }
    }
}
