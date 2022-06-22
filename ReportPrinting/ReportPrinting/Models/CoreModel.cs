using System;
using System.Collections.Generic;
using System.ComponentModel; 
using System.Linq;
using System.Threading.Tasks;

namespace API.Models
{
    public class CoreModel
    {
        public DateTime? created_date { get; set; }
        public string created_by { get; set; }

        public bool? is_deleted { get; set; } = false;

        public DateTime? deleted_date { get; set; }
        public string deleted_by { get; set; }

    }



    public class InvoiceNumberModel
    {
        public string prefix { get; set; }

        public string max_length { get; set; }
        public int value { get; set; }
        
         
    }
}
