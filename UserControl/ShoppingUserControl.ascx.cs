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

public partial class UserControl_ShoppingUserControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["vdName"] == null)
        {
            linkShopping.Visible = false;
            LinkButton1.Visible = false;
        }
        else
        {
            linkShopping.Visible = true;
            LinkButton1.Visible = true;
        }
    }
    protected void linkShopping_Click(object sender, EventArgs e)
    {
        if (Session["Cart"] == null)
        {
            Response.Redirect("Home.aspx");
        }
        else 
        {
            Response.Redirect("ShoppingCart.aspx");
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        if (Session["vdCusID"] == null)
        {
            MessageBox.Show("You have not any Order.");
            Response.Redirect("Home.aspx");
        }
        else 
        {
            Response.Redirect("ViewYourOrders.aspx?cusid=" + Session["vdCusID"].ToString());
        }
    }
}
