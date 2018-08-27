using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.Linq;
namespace XMLWSAssg.EndUser
{
    public partial class TagList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.QueryString["s"] != null)
            {
                xmlSearch.DocumentSource = "~/App_Data/AdminPost.xml";
                xmlSearch.TransformSource = "~/App_Data/TagSearch.xsl";
                System.Xml.Xsl.XsltArgumentList xsltArg = new System.Xml.Xsl.XsltArgumentList();
                xsltArg.AddParam("_tagString", "", Request.QueryString["s"]);
                xmlSearch.TransformArgumentList = xsltArg;
            }
            else if (Request.QueryString["s"] == null)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "My title", "alert(' null ');", true);
                return;
            }
        }
    }
}