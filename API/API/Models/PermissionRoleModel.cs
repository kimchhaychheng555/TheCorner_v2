using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace API.Models
{

    [Table("data_permission_role")]
    public class PermissionRoleModel
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Key]
        public Guid id { get; set; }


        [Required]
        public Guid role_id { get; set; }
        [ForeignKey("role_id")]
        public RoleModel role { get; set; }

        [Required]
        public Guid permission_id { get; set; }
        [ForeignKey("permission_id")]
        public PermissionModel permission { get; set; }

    }
}
