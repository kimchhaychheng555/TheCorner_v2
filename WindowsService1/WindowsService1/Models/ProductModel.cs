using System;
using System.Collections.Generic; 
using System.Linq;
using System.Threading.Tasks;

namespace API.Models
{ 
    public class ProductModel : CoreModel
    { 
        public Guid id { get; set; }
        public string name { get; set; }
        public decimal? cost { get; set; }
        public decimal? price { get; set; }
        public string image { get; set; }
        public bool stockable { get; set; }


        public Guid category_id { get; set; } 
        public CategoryModel category { get; set; }

    }
}
