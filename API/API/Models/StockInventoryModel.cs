using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace API.Models
{
    [Table("data_stock_inventory")]
    public class StockInventoryModel : CoreModel
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Key]
        public Guid id { get; set; }
        public decimal quantity_stock { get; set; }
        public decimal min_quantity { get; set; }

        public Guid product_id { get; set; }
        [ForeignKey("product_id")]
        public ProductModel product { get; set; }
    }
}
