using System;
using System.Collections.Generic; 
using System.Linq;
using System.Threading.Tasks;

namespace API.Models
{ 
    public class CategoryModel : CoreModel
    { 
        public Guid id { get; set; }
        public string name { get; set; }

        public List<ProductModel> products { get; set; }

    }
}
