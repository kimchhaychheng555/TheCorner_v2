using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace API.Models
{
    [Table("data_role")]
    public class RoleModel : CoreModel
    {
        public Guid id { get; set; }
        public string name { get; set; }
        public List<PermissionModel> permissions { get; set; }

    }
}
