using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Xml;
using System.Xml.Linq;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using NewsAPI;
using NewsAPI.Constants;
using NewsAPI.Models;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using WebAPI.Models;

namespace WebAPI.Controllers
{
    [Route("api/Weather")]
    public class WeatherController : Controller
    {
        private const string API_KEY = "175dae4e66ee43c1b308e000cd28e1a5";
        private const string currentURL = "http://api.openweathermap.org/data/2.5/weather?q=@LOC@&mode=xml&units=imperial&APPID=" + API_KEY;

        [HttpGet]
        public string GET()
        {
            string city = "Kuala Lumpur";
            string url = currentURL.Replace("@LOC@", city);
            string xml = GetFormattedXml(url);

            return xml;
        }

        private string GetFormattedXml(string url)
        {
            using (WebClient client = new WebClient())
            {
                string xml = client.DownloadString(url);
                XmlDocument xd = new XmlDocument();
                xd.LoadXml(xml);

                XDocument doc = XDocument.Parse(xml);

                using (StringWriter writer = new StringWriter())
                {
                    XmlTextWriter xmlWriter = new XmlTextWriter(writer);
                    xmlWriter.Formatting = System.Xml.Formatting.Indented;
                    xd.WriteTo(xmlWriter);

                    return writer.ToString();
                }
            }
        }
    }

    [Route("api/News")]
    public class NewsTestController : Controller
    {
        [HttpGet]
        public JsonResult GetJson()
        {
            var newsApiClient = new NewsApiClient("e43bd86cba4e44c9953fbc0e959cfab3");
            var articlesResponse = newsApiClient.GetEverything(new EverythingRequest
            {
                Q = "bbc-sport",
                SortBy = SortBys.Popularity,
                Language = Languages.EN
            });
            if (articlesResponse.Status == Statuses.Ok)
            {
                string json = JsonConvert.SerializeObject(articlesResponse);
                return Json(articlesResponse);
            }
            return Json(articlesResponse);
        }
    }

   [Route("api/Currency")]
   public class TravelController: Controller
    {
        
        private string APIAddress = "http://apilayer.net/api/live?access_key=2bedc2878c498acd5f7209f2a90d93f6&currencies=AUD,CHF,EUR,GBP,PLN,MYR&format=1";

        [HttpGet]
        public string GET()
        {
            string xml = GetFormattedXml(APIAddress);
            return xml;
        }

        private string GetFormattedXml(string url)
        {
            using (WebClient client = new WebClient())
            {
                string xml = client.DownloadString(url);
                return xml;
            }
        }
    }


}