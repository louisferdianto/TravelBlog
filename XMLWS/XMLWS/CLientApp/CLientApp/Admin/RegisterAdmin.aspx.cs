using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace XMLWSAssg
{
    public partial class WriteNewXml : System.Web.UI.Page
    {
        private const string AdminXmlFilePath = "~/App_Data/Admin.xml";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void adminSaveBtn_Click(object sender, EventArgs e)
        {
            //XML Data Source : AdminPost.xml
            XmlDocument xmldoc = XmlDataSource1.GetXmlDocument();
            //Get the XML Data Latest Post Record
            XmlNodeList xnlist = xmldoc.SelectNodes("//user[last()]");

            //Get the Latest Record ID
            String olduserID = xnlist[0].Attributes[0].Value.ToString();
            int user = int.Parse(olduserID.Substring(1));
            user++;
            String newUserID = "U" + user;

            XmlDocument doc = new System.Xml.XmlDocument();
            doc.Load(Server.MapPath(AdminXmlFilePath));

            XmlNode adminNode = doc.CreateElement("user");
            XmlAttribute adminAttribute = doc.CreateAttribute("id");
            adminAttribute.Value = newUserID;
            adminNode.Attributes.Append(adminAttribute);
            doc.DocumentElement.AppendChild(adminNode);

            XmlNode emailNode = doc.CreateElement("email");
            emailNode.AppendChild(doc.CreateTextNode(this.adminEmail.Text));
            adminNode.AppendChild(emailNode);


            XmlNode passNode = doc.CreateElement("pass");
            passNode.AppendChild(doc.CreateTextNode(this.adminPassword.Text));
            adminNode.AppendChild(passNode);

            XmlNode nameNode = doc.CreateElement("name");
            nameNode.AppendChild(doc.CreateTextNode(this.adminName.Text));
            adminNode.AppendChild(nameNode);

            XmlNode numberNode = doc.CreateElement("numberPost");
            numberNode.AppendChild(doc.CreateTextNode("0"));
            adminNode.AppendChild(numberNode);

            doc.Save(Server.MapPath(AdminXmlFilePath));
            Response.Redirect("AdminSignIn.aspx");
        }
    }
}