using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace API.Models
{
    [Table("data_stock_transaction")]
    public class StockTransactionModel : CoreModel
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Key]
        public Guid id { get; set; }
        public decimal? quantity { get; set; }
        public string type { get; set; }
        public string description { get; set; }
        public bool? status { get; set; } = false;

        public Guid product_id { get; set; }
        [ForeignKey("product_id")]
        public ProductModel product { get; set; }
        public string sale_date { get; set; }
    }
}
