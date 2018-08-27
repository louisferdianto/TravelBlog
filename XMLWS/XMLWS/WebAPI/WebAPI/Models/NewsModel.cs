using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebAPI.Models
{

    public class NewsModel
    { 
        public string artiles { get; set; }
        public string source { get; set; }
        public string author { get; set; }
        public string title { get; set; }
        public string Description { get; set; }
        public string url { get; set; }
        public string urlToImage { get; set; }
        public string publishedAt { get; set; }
        public string id { get; set; }
        public string name { get; set; }
    }
}
