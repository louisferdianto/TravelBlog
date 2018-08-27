using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using CLientApp.Models;

namespace CLientApp.Controllers
{
    public class CurrencyController : Controller
    {
        // GET: Currency
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult GetCurrency()
        {
            string url = "http://localhost:57001/api/Currency";
            WebRequest request = WebRequest.Create(url);
            request.Method = "GET";
            request.ContentType = "application/json; charset=utf-8";

            var response = (HttpWebResponse)request.GetResponse();
            string jsonText;
            using (var st = new StreamReader(response.GetResponseStream()))
            {
                jsonText = st.ReadToEnd();
            }
            var desirilized = JsonConvert.DeserializeObject<Root>(jsonText);
            ViewBag.Deserialized = desirilized;

            return View("GetCurrency", desirilized.quotes);
        }
    }
}