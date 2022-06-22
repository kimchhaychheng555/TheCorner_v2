using System;
using System.Collections.Generic;  
using System.Linq;
using System.Threading.Tasks;

namespace API.Models
{ 
    public class ExpenseModel : CoreModel
    { 
        public Guid id { get; set; }
        public double? amount { get; set; }
        public double? exchange_rate { get; set; }
        public string description { get; set; }
        public string note { get; set; }
        public string payment_method_name { get; set; }

    }
}
