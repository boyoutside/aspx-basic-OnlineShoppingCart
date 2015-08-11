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

public partial class Admin_AdminUserControl_LinkUserControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.UrlReferrer != null)
        {
            String a = Request.UrlReferrer.ToString();
            string[] words = a.Split('/');
            String b = words[words.Length - 1].ToString();
            string[] secondSplit = b.Split('.');
            if (secondSplit[0].ToString() == "MainAdmin")
            {
                Session["Sv"] = "Main Admin";
                LinkButton2.Visible = true;
                LinkButton2.Text = "Main Admin";
            }
            else if (secondSplit[0].ToString() == "MainEmployee")
            {
                Session["Sv"] = "Main Employee";
                LinkButton2.Visible = true;
                LinkButton2.Text = "Main Employee";
            }
            else if (secondSplit[0].ToString() == "Login")
            {
                LinkButton2.Visible = false;
            }
            else if (secondSplit[0].ToString() == "Home")
            {
                LinkButton2.Visible = false;
            }
            else if (secondSplit[0].ToString() == "UpdateCustomer")
            {
                LinkButton2.Visible = false;
            }
            else
            {
                if (Session["Sv"].ToString() == "Visible")
                {
                    LinkButton2.Visible = false;
                }
                else
                {
                    LinkButton2.Visible = true;
                    LinkButton2.Text = Session["Sv"].ToString();
                }

            }
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.Clear();
        Response.Redirect("~/Home.aspx");
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        if (LinkButton2.Text == "Main Employee")
        {
            Session["Sv"] = "Visible";
            Response.Redirect("~/Admin/MainEmployee.aspx");
        }
        else
        {
            Session["Sv"] = "Visible";
            Response.Redirect("~/Admin/MainAdmin.aspx");
        }
    }
}
