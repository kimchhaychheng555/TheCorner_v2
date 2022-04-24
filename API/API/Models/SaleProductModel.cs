using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace API.Models
{
    [Table("data_sale_product")]
    public class SaleProductModel : CoreModel
    {
        public Guid id { get; set; }
        public decimal quantity { get; set; }
        public decimal price { get; set; }
        public bool is_free { get; set; } = false;
        public bool is_remove_stock_done { get; set; } = false;

        public Guid sale_id { get; set; }
        [ForeignKey("sale_id")]
        public SaleModel sale { get; set; }
        public Guid product_id { get; set; }
        [ForeignKey("product_id")]
        public ProductModel product { get; set; }

    }
}
