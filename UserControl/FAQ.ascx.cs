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

public partial class UserControl_FAQ : System.Web.UI.UserControl
{
    FAQ objFAQ = new FAQ();
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (Session["vdName"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        Label1.Text = DateTime.Now.ToShortDateString().ToString();
        Label2.Text = Session["vdName"].ToString();
        Label3.Text = DateTime.Now.ToShortTimeString();

        TextBox2.Text = "";
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
       
        objFAQ.InsertFAQ(Session["vdCusID"].ToString(), TextBox2.Text, "False", Label1.Text);
        MessageBox.Show("Your question had been send to Administrator.");
        Response.Redirect("ViewFeedback.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("ViewFeedback.aspx");
    }
   
}
