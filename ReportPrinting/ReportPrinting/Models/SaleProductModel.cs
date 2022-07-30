using System;
using System.Collections.Generic; 
using System.Linq;
using System.Threading.Tasks;

namespace API.Models
{ 
    public class SaleProductModel : CoreModel
    { 
        public Guid id { get; set; }
        public string image { get; set; }
        public string product_name { get; set; }
        public decimal? quantity { get; set; }
        public string discount_type { get; set; }
        public decimal? discount { get; set; }
        public decimal? price { get; set; }
        public bool? is_free { get; set; } = false;
        public bool? is_remove_stock_done { get; set; } = false;

        public Guid sale_id { get; set; } 
        public SaleModel sale { get; set; }
        public Guid product_id { get; set; } 
        public ProductModel product { get; set; }

    }
}
