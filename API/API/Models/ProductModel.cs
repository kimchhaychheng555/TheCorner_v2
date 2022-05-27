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
        public decimal? price { get; set; }
        public string image { get; set; }


        public Guid category_id { get; set; }
        [ForeignKey("category_id")]
        public CategoryModel category { get; set; }

    }
}
