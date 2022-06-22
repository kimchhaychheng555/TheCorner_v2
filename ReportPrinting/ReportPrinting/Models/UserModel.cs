using System;
using System.Collections.Generic; 
using System.Linq;
using System.Threading.Tasks;

namespace API.Models { 
    public class UserModel : CoreModel
    { 
        public Guid id { get; set; }
        public string fullname { get; set; }
        public string username { get; set; }
        public string password { get; set; }
        public string profile { get; set; }

        public Guid role_id { get; set; } 
        public RoleModel role { get; set; }

    }
}
