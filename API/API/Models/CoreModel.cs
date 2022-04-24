using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace API.Models
{
    public class CoreModel
    {
        public DateTime created_date { get; set; } = DateTime.Now;
        public string created_by { get; set; }
        public bool is_deleted { get; set; } = false;
        public DateTime deleted_date { get; set; }
        public string deleted_by { get; set; }

    }
}
