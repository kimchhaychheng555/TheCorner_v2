using System;
using System.Collections.Generic; 
using System.Linq;
using System.Threading.Tasks;

namespace API.Models
{ 
    public class PaymentMethodModel : CoreModel
    { 
        public Guid id { get; set; }
        public string payment_method_name { get; set; }
        public decimal exchange_rate { get; set; }

    }
}
