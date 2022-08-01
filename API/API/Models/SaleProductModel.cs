using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace API.Models
{
    [Table("data_sale_product")]
    public class SaleProductModel : CoreModel
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Key]
        public Guid id { get; set; }
        public string image { get; set; }
        public string product_name { get; set; }
        public decimal? quantity { get; set; }
        public string discount_type { get; set; }
        public decimal? discount { get; set; }
        public decimal? price { get; set; }
        public bool? is_free { get; set; } = false;
        public bool? stockable { get; set; } = false;

        public Guid sale_id { get; set; }
        [ForeignKey("sale_id")]
        public SaleModel sale { get; set; }
        public Guid product_id { get; set; }
        [ForeignKey("product_id")]
        public ProductModel product { get; set; }


        public Guid? product_group_id { get; set; }
        [ForeignKey("product_group_id")]
        public ProductGroupModel product_group { get; set; }

    }
}
