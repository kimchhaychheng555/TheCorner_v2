using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace API.Models
{
    [Table("data_document")]
    public class DocumentModel
    {
        public Guid id { get; set; }
        public string key_name { get; set; }
        public string label { get; set; }
        public string value { get; set; }

    }
}
