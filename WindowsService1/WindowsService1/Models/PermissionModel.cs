using System;
using System.Collections.Generic; 
using System.Linq;
using System.Threading.Tasks;

namespace API.Models
{ 
    public class PermissionModel : CoreModel
    {
     
        public Guid id { get; set; }
        public string slug { get; set; }
        public string description { get; set; }

        public Guid role_id { get; set; }
         
        public RoleModel role { get; set; }

    }
}
