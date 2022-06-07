using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace API.Models
{
    [Table("data_expense")]
    public class ExpenseModel : CoreModel
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Key]
        public Guid id { get; set; }
        public double? amount { get; set; }
        public double? exchange_rate { get; set; }
        public string description { get; set; }
        public string note { get; set; }
        public string payment_method_name { get; set; }

    }
}
