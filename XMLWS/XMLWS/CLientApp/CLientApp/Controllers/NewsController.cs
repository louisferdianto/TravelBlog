using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using System.Xml;
using CLientApp.Models;
using System.Net;
using System.IO;

namespace CLientApp.Controllers
{
    public class NewsController : Controller
    {
        // GET: News
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult GetNews()
        {
            string url = "http://localhost:57001/api/News";
            WebRequest request = WebRequest.Create(url);
            request.Method = "GET";
            request.ContentType = "application/json; charset=utf-8";

            var response = (HttpWebResponse)request.GetResponse();
            string jsonText;
            using (var st = new StreamReader(response.GetResponseStream()))
            {
                jsonText = st.ReadToEnd();
            }
           var desirilized = JsonConvert.DeserializeObject<RootObject>(jsonText);
            ViewBag.Deserialized = desirilized;
           
            return View("View",desirilized.articles);
        }
       
    }
}