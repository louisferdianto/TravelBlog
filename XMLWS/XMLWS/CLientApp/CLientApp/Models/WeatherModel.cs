using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CLientApp.Models
{
    public class WeatherModel
    {
        public string City { get; set; }
        public string Weather { get; set; }
        public string Temperature { get; set; }
        public string Humidity { get; set; }
    }
}