using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace API.Models
{
    public class BadRequestModel
    { 
            public string title { get; set; } = "Bad Request";
            public bool status { get; set; } = false;
            public int statusCode { get; set; } = 400;
            public string message { get; set; } 
    }
}
