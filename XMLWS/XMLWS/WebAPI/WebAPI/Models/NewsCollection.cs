using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebAPI.Models
{
    public class NewsCollection
    {
        private List<NewsModel> news;

        public List<NewsModel>  News { get => news; set => news = value; }
    }
}
