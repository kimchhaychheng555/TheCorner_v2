using System;
using System.Collections.Generic; 
using System.Linq;
using System.Threading.Tasks;

namespace API.Models
{ 
    public class PrintModel : CoreModel
    { 
        public Guid id { get; set; }
        public string key { get; set; }
        public Guid sale_id { get; set; } 
        public SaleModel sale { get; set; }

    }
}
