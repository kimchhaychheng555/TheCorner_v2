using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace API.Models
{
    [Table("data_print")]
    public class PrintModel : CoreModel
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Key]
        public Guid id { get; set; }
        public string key { get; set; }
        public Guid sale_id { get; set; }
        [ForeignKey("sale_id")]
        public SaleModel sale { get; set; }

    }
}
