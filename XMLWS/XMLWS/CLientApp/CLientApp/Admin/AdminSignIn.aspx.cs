using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace XMLWSAssg
{
    public partial class AdminSignIn : System.Web.UI.Page
    {
        private const string AdminXmlFilePath = "~/App_Data/Admin.xml";

        protected void Page_Load(object sender, EventArgs e)
        {
            this.lblAuthError.Visible = false;
        }

        private void LoginCredentials(string email, string password)
        {
            XmlDocument adminsDoc = new XmlDocument();
            adminsDoc.Load(Server.MapPath(AdminXmlFilePath));
            XmlNode adminNode = adminsDoc.SelectSingleNode("/admin_credentials/user[email='" + email + "']");
            if(adminNode == null)
            {
                // error message
                this.lblAuthError.Text = "The account for this email does not exist.";
                this.lblAuthError.Visible = true;
                return;
            }
            else
            {
                XmlNode passwordNode = adminsDoc.SelectSingleNode("/admin_credentials/user[pass='" + password + "']");
                if(passwordNode == null)
                {
                    this.lblAuthError.Text = "Password Wrong.";
                    this.lblAuthError.Visible = true;
                    return;
                }
               
                Session["UserId"] = adminNode.Attributes["id"].Value;
                Session["Email"] = adminNode.SelectSingleNode("email").InnerText;
                Session["Name"] = adminNode.SelectSingleNode("name").InnerText;
                Response.Redirect("Home.aspx");


            }
        }

        protected void LoginBtn_Click(object sender, EventArgs e)
        {
            string email = this.LoginEmail.Text;
            string password = this.LoginPassword.Text;
            LoginCredentials(email,password);
        }
    }
}