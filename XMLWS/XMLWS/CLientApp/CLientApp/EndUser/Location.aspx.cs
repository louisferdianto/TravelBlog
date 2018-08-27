using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace XMLWSAssg.EndUser
{
    public partial class Location : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["L"] != null)
            {
                xmlLocation.DocumentSource = "~/App_Data/AdminPost.xml";
                xmlLocation.TransformSource = "~/App_Data/LocationBased.xsl";
                System.Xml.Xsl.XsltArgumentList xsltArg = new System.Xml.Xsl.XsltArgumentList();
                xsltArg.AddParam("_locationString", "", Request.QueryString["L"]);
                xmlLocation.TransformArgumentList = xsltArg;
            }
            else if (Request.QueryString["L"] == null)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "My title", "alert(' null ');", true);
                return;
            }
        }
    }
}