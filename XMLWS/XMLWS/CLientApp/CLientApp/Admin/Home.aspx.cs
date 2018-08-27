using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace XMLWSAssg.Admin
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Name"] == null && Session["UserId"] == null && Session["Email"] == null)
            {
                Response.Redirect("AdminSignIn.aspx");
            }
            else
            {
                lblAccountName.Text = (string)Session["Name"];
                DataSet ds = new DataSet();
                ds.ReadXml(Server.MapPath("~/App_Data/Admin.xml"));
                Chart1.Series["Series1"].XValueMember = "name";
                Chart1.Series["Series1"].YValueMembers = "numberPost";
                this.Chart1.DataSource = ds;
                this.Chart1.DataBind();
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

        protected void ReportBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Report.aspx");
        }

        protected void logOutBtn_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("AdminSignIn.aspx");
        }
    }
}