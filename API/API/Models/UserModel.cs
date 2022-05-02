using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace API.Models
{
    [Table("data_user")]
    public class UserModel : CoreModel
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Key]
        public Guid id { get; set; }
        public string username { get; set; }
        public string password { get; set; }
        public string profile { get; set; }

        public Guid role_id { get; set; }
        [ForeignKey("role_id")]
        public RoleModel role { get; set; }

    }
}
