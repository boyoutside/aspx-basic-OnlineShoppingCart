using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class UserControl_Login : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
            if (Session["vdName"] == null)
            {
                Label1.Visible = false;
                linkUpdate.Text = "Register";
                LinkButton1.Text = "LogIn";
            }
            else
            {
                LinkButton1.Text = "LogOut";
                linkUpdate.Text = Session["vdName"].ToString();
            }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        if(LinkButton1.Text == "LogIn")
        {
            Response.Redirect("Login.aspx");
        }
        else
        {
            Session.Abandon();
            Session.Clear();
            //Response.Redirect(Request.Url.ToString());
            Response.Redirect("Home.aspx");
        }
    }
    protected void linkUpdate_Click(object sender, EventArgs e)
    {
        if (linkUpdate.Text == "Register")
        {
            Response.Redirect("~/CustomerRegister.aspx");
        }
        else
        {
            if (Session["vdRoll"] != null)
            {
                if (Session["vdRoll"].ToString() == "R03")
                {
                    Response.Redirect(String.Format("~/UpdateCustomer.aspx?id= {0}", Session["vdName"].ToString()));
                }
                else
                {
                    Response.Redirect("Home.aspx");
                }
            }
        }
    }
}
