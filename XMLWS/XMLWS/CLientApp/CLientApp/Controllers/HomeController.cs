using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Net.Http;
using System.Xml;
using CLientApp.Models;

namespace CLientApp.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            return View();
        }
        private HttpClient client;

        // GET: Weather
  
        public ActionResult CurrentWeather()
        {
            client = new HttpClient();
            string url = "http://localhost:57001/api/Weather/";
            client.BaseAddress = new Uri(url);

            var response = client.GetAsync("http://localhost:57001/api/Weather/").GetAwaiter().GetResult();
            response.EnsureSuccessStatusCode();
            var result = response.Content.ReadAsStringAsync().GetAwaiter().GetResult();

            XmlDocument xd = new XmlDocument();
            xd.LoadXml(result);
            XmlNode node = xd.SelectSingleNode(String.Format("/current"));
            
            WeatherModel weatherModel = new WeatherModel();
            if (node != null)
            {
                weatherModel.City = node["city"].Attributes["name"].Value;
                weatherModel.Weather = node["weather"].Attributes["value"].Value;
                weatherModel.Humidity = node["humidity"].Attributes["value"].Value + " %";
                weatherModel.Temperature = node["temperature"].Attributes["value"].Value;
                string tempT = weatherModel.Temperature.ToString();
                double fahrenheit = double.Parse(tempT, System.Globalization.CultureInfo.InvariantCulture);
                double celsius = (fahrenheit - 32) * 5 / 9;
                celsius = Math.Round(celsius, 2);
                weatherModel.Temperature = celsius.ToString() + " °C";
                ViewBag.Message = weatherModel;
            }

            return View("CurrentWeather",weatherModel);
        }
    }
}