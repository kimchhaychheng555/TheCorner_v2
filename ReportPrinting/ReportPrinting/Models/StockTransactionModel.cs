using System;
using System.Collections.Generic; 
using System.Linq;
using System.Threading.Tasks;

namespace API.Models
{ 
    public class StockTransactionModel : CoreModel
    { 
        public Guid id { get; set; }
        public decimal? quantity { get; set; }
        public string type { get; set; }

        public Guid product_id { get; set; } 
        public ProductModel product { get; set; }
    }
}
