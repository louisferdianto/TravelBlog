using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace XMLWSAssg.EndUser
{
    public partial class PostDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Request.QueryString["P"]))
            {
                Response.Redirect("Home.aspx");
            }
            else if (!string.IsNullOrEmpty(Request.QueryString["P"]))
            {
                string postID = Request.QueryString["P"];
                MultiView1.ActiveViewIndex = 1;
                XmlDocument xmldoc = XmlDataSource1.GetXmlDocument();
                XmlNodeList xnlist = xmldoc.SelectNodes("//Post[@id='" + postID + "']");

                for (int i = 0; i < xnlist.Count; i++)   // Loops only once if record exists
                {
                    lblTitle.Text = xnlist[i].ChildNodes[0].InnerText;
                    lblDatePost.Text = "Posted on: " + xnlist[i].ChildNodes[3].InnerText;
                    lblDesc.Text = xnlist[i].ChildNodes[4].InnerText;
                    lblAuthor.Text = "By: "+ xnlist[i].ChildNodes[2].InnerText;
                }
            }
        }

        protected void CommentBtn_Click(object sender, EventArgs e)
        {
            XmlDocument doc = XmlDataSource2.GetXmlDocument();
            XmlNodeList nodelist = doc.SelectNodes("//Response[last()]");

            String oldFeedbackID = nodelist[0].Attributes[0].Value.ToString();
            int feedback = int.Parse(oldFeedbackID.Substring(1));
            feedback++;
            String newFeedbackID = "F" + feedback;

            XmlNode node = doc.SelectNodes("/Feedback/Response")[0];
            XmlNode newnode = node.CloneNode(true);
            // update element values for the new node
            newnode.Attributes[0].Value = newFeedbackID;
            newnode.Attributes[1].Value = Request.QueryString["P"];
            newnode.SelectSingleNode("Name").InnerText = txtNameFeedback.Text;
            newnode.SelectSingleNode("Message").InnerText = txtMessageFeedback.Text;

            // append the new node to the document
            doc.DocumentElement.AppendChild(newnode);
            doc.Save(Server.MapPath("~/App_Data/Feedback.xml"));
        }
    }
}