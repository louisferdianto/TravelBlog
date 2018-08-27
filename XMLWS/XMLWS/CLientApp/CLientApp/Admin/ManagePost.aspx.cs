using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace XMLWSAssg.Admin
{
    public partial class ManagePost : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["P"] != null && !IsPostBack)
            {
                XmlDocument xmlDoc = XmlDataSource2.GetXmlDocument();
                XmlNodeList xmlNode = xmlDoc.SelectNodes("/AdminPost/Post[@id='" + Request.QueryString["P"] + "']");
                txtEditTitle.Text = xmlNode[0].ChildNodes[0].InnerText;
                txtEditLoc.Text = xmlNode[0].ChildNodes[1].InnerText;
                txtDescription.Value = xmlNode[0].ChildNodes[4].InnerText;
                txtEditTag.Text = xmlNode[0].ChildNodes[5].InnerText;
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect("ManagePost.aspx?P=" + GridView1.SelectedValue.ToString());
        }

        protected void UpdateBtn_Click(object sender, EventArgs e)
        {
            XmlDocument xmlDoc = XmlDataSource2.GetXmlDocument();
            XmlNodeList xmlNode = xmlDoc.SelectNodes("/AdminPost/Post[@id='" + Request.QueryString["P"] + "']");
            //Update Title
            xmlNode[0].ChildNodes[0].InnerText = txtEditTitle.Text;
            //Update Location
            xmlNode[0].ChildNodes[1].InnerText = txtEditLoc.Text;
            //Update desc
            xmlNode[0].ChildNodes[4].InnerText = txtDescription.Value;
            

            xmlDoc.Save(Server.MapPath("~/App_Data/AdminPost.xml"));

            Response.Redirect("ManagePost.aspx");
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "delete")
            {
                XmlDocument xmlDoc = XmlDataSource2.GetXmlDocument();
                XmlNodeList xmlNodel = xmlDoc.SelectNodes("/AdminPost/Post[@id='" + Request.QueryString["P"] + "']");
                XmlNode xmlNode = xmlNodel[0];
                XmlNode xParent = xmlNode.ParentNode;
                xParent.RemoveChild(xmlNode);
                //Save File
                xmlDoc.Save(Server.MapPath("~/App_Data/AdminPost.xml"));
                Response.Redirect("ManagePost.aspx");
            }
        }

        protected void postPageBtn_Click(object sender, EventArgs e)
        {
            if (Session["Name"] == null && Session["UserId"] == null && Session["Email"] == null)
            {
                Response.Redirect("AdminSignIn.aspx");
            }
            else
            {
                Response.Redirect("AddPost.aspx");
            }
        }

        protected void listPostPageBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManagePost.aspx");
        }

        protected void logOutBtn_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("AdminSignIn.aspx");
        }
    }
}