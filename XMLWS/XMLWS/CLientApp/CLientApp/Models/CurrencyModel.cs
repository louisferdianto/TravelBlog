using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CLientApp.Models
{
   public class Quotes
    {
        public double USDAUD { get; set; }
        public double USDCHF { get; set; }
        public double USDEUR { get; set; }
        public double USDGBP { get; set; }
        public double USDPLN { get; set; }
        public double USDMYR { get; set; }
    }
    public class Root
    {
        public bool success { get; set; }
        public string terms { get; set; }
        public string privacy { get; set; }
        public int timestamp { get; set; }
        public string source { get; set; }
        public  Quotes  quotes { get; set;}
    }
}