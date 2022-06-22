using System;
using System.Collections.Generic; 
using System.Linq;
using System.Threading.Tasks;

namespace API.Models
{ 
    public class SalePaymentModel : CoreModel
    { 
        public Guid id { get; set; }
        public double? payment_amount { get; set; }
        public double? exchange_rate { get; set; }
        public string payment_method_name { get; set; }

        public Guid sale_id { get; set; } 
        public SaleModel sale { get; set; }

        public Guid payment_method_id { get; set; } 
        public PaymentMethodModel payment_method { get; set; }

    }
}
