using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace API.Models
{
    [Table("data_sale")]
    public class SalePaymentModel : CoreModel
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Key]
        public Guid id { get; set; }
        public double payment_amount { get; set; }
        public double exchange_rate { get; set; }
        public string payment_method_name { get; set; }

        public Guid sale_id { get; set; }
        [ForeignKey("sale_id")]
        public SaleModel sale { get; set; }

        public Guid payment_method_id { get; set; }
        [ForeignKey("payment_method_id")]
        public PaymentMethodModel payment_method { get; set; }

    }
}
