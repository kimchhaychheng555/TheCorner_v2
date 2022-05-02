using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace API.Models
{
    [Table("data_sale")]
    public class SaleModel : CoreModel
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Key]
        public Guid id { get; set; }
        public string invoice_number { get; set; }
        public decimal vat { get; set; }
        public decimal sub_total { get; set; }
        public string discount_type { get; set; }
        public decimal discount { get; set; }
        public decimal grand_total { get; set; }
        public bool is_paid { get; set; } = false;
        public bool status { get; set; } = false;
        public string sale_date { get; set; }

        public Guid table_id { get; set; }
        [ForeignKey("table_id")]
        public TableModel table { get; set; }

        public List<SaleProductModel> sale_products { get; set; }
    }
}
