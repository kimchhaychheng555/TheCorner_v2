using System;
using System.Collections.Generic; 
using System.Linq;
using System.Threading.Tasks;

namespace API.Models
{ 
    public class StockInventoryModel : CoreModel
    { 
        public Guid id { get; set; }
        public decimal? quantity_stock { get; set; }
        public decimal? min_quantity { get; set; }

        public Guid product_id { get; set; } 
        public ProductModel product { get; set; }
    }
}
