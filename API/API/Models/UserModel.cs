using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace API.Models
{
    public class UserModel
    {

        public Guid id { get; set; }
        public string username { get; set; }
        public string password { get; set; }
        public string pincode { get; set; }

    }
}
