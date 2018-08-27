using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace XMLWSAssg.Admin
{
    public partial class AddPost : System.Web.UI.Page
    {
        private const string PostXmlFilePath = "~/App_Data/AdminPost.xml";
        private const string AdminXmlFilePath = "~/App_Data/Admin.xml";
        private const string LocationXmlFilePath = "~/App_Data/Location.xml";
        string userid;
        protected void Page_Load(object sender, EventArgs e)
        {
            string userId = (string)Session["UserId"];
            userid = userId;
            if (Session["Name"] == null)
            {
                Response.Redirect("AdminSignIn.aspx");
            }
            else
            {
                lblSessionName.Text = (string)Session["Name"];
            }
        }

        protected void dateBtn_Click(object sender, EventArgs e)
        {
            Calendar1.Visible = true;
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            lblDate.Text = Calendar1.SelectedDate.ToString("dd-MM-yyyy");
            Calendar1.Visible = false;
        }

        private void savePost()
        {
            //XML Data Source : AdminPost.xml
            XmlDocument xmldoc = XmlDataSource1.GetXmlDocument();
            //Get the XML Data Latest Post Record
            XmlNodeList xnlist = xmldoc.SelectNodes("//Post[last()]");

            //Get the Latest Record ID
            String oldPostID = xnlist[0].Attributes[0].Value.ToString();
            int post = int.Parse(oldPostID.Substring(1));
            post++;
            String newPostID = "P" + post;

            string title = txtTitle.Text;
            string location = txtLocation.Text;
            string author = (string)Session["Name"];
            string date = lblDate.Text;
            string desc = Request.Form["TextArea1"];
            string tag = txtTag.Text;

            XmlDocument doc = new XmlDocument();
            doc.Load(Server.MapPath(PostXmlFilePath));

            XmlNode postNode = doc.CreateElement("Post");
            XmlAttribute adminAttribute = doc.CreateAttribute("id");
            adminAttribute.Value = newPostID;
            postNode.Attributes.Append(adminAttribute);
            doc.DocumentElement.AppendChild(postNode);

            XmlNode titleNode = doc.CreateElement("Title");
            titleNode.AppendChild(doc.CreateTextNode(title));
            postNode.AppendChild(titleNode);

            if(txtLocation.Text != "")
            {
                XmlNode locNode = doc.CreateElement("Location");
                locNode.AppendChild(doc.CreateTextNode(txtLocation.Text));
                postNode.AppendChild(locNode);

                XmlDocument docLoc = new XmlDocument();
                docLoc.Load(Server.MapPath(LocationXmlFilePath));
                XmlNode locationNode = docLoc.CreateElement("Location");
                docLoc.DocumentElement.AppendChild(locationNode);

                XmlNode locNameNode = docLoc.CreateElement("Name");
                locNameNode.AppendChild(docLoc.CreateTextNode(txtLocation.Text));
                locationNode.AppendChild(locNameNode);
                docLoc.Save(Server.MapPath(LocationXmlFilePath));

            }
            else if(txtLocation.Text == "")
            {
                XmlNode locNode = doc.CreateElement("Location");
                locNode.AppendChild(doc.CreateTextNode(DropDownList1.SelectedItem.Value));
                postNode.AppendChild(locNode);
            }

            XmlNode authorNode = doc.CreateElement("Author");
            authorNode.AppendChild(doc.CreateTextNode(author));
            postNode.AppendChild(authorNode);

            XmlNode dateNode = doc.CreateElement("Date");
            dateNode.AppendChild(doc.CreateTextNode(date));
            postNode.AppendChild(dateNode);

            XmlNode descNode = doc.CreateElement("Description");
            descNode.AppendChild(doc.CreateTextNode(desc));
            postNode.AppendChild(descNode);

            XmlNode hashtag = doc.CreateElement("Hashtag");
            string[] words = tag.Split(',');
            int count = words.Length; // get the array length
            string result = "";
            foreach (string word in words)
            {
                //Console.WriteLine(word);
                result = word;
                XmlNode tagNode = doc.CreateElement("Tag");
                tagNode.AppendChild(doc.CreateTextNode(word));
                postNode.AppendChild(tagNode);
                hashtag.AppendChild(tagNode);

            }
            postNode.AppendChild(hashtag);
            doc.Save(Server.MapPath(PostXmlFilePath));

            XmlDocument docNew = new XmlDocument();
            docNew.Load(Server.MapPath(AdminXmlFilePath));
            XmlNode adminNode = docNew.DocumentElement.SelectSingleNode("/admin_credentials/user[@id='" + userid + "']/numberPost");
            string data = adminNode.InnerText;
            int x = Int32.Parse(data);
            x++;
            XmlNodeList node = docNew.SelectNodes("/admin_credentials/user[@id='" + userid + "']");
            node[0].ChildNodes[3].InnerText = x.ToString();
            docNew.Save(Server.MapPath("~/App_Data/Admin.xml"));
            Response.Redirect("Home.aspx");
        }

        protected void addPostBtn_Click(object sender, EventArgs e)
        {
            savePost();
        }

        protected void newLocBtn_Click(object sender, EventArgs e)
        {
            txtLocation.Visible = true;
            DropDownList1.Visible = false;
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