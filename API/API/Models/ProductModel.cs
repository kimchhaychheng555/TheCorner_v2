using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace API.Models
{
    [Table("data_product")]
    public class ProductModel : CoreModel
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Key]
        public Guid id { get; set; }
        public string name { get; set; }
        public decimal? min_quantity { get; set; }
        public decimal? cost { get; set; }
        public decimal? price { get; set; }
        public string image { get; set; }
        public bool stockable { get; set; }


        public Guid category_id { get; set; }
        [ForeignKey("category_id")]
        public CategoryModel category { get; set; }

        public Guid product_group_id { get; set; }
        [ForeignKey("product_group_id")]
        public ProductGroupModel product_group { get; set; }
    }
}
