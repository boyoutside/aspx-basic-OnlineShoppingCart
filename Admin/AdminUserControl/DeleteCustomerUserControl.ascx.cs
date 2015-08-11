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

public partial class DeleteCustomerUserControl : System.Web.UI.UserControl
{
    String CusID = "";
    String CusName = "";
    CheckExist chkExt = new CheckExist();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["vdName"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
    }
    private bool ktFAQ()
    {
        bool a = chkExt.checkFAQEx(CusID);
        if (a == true)
        {
            
            String infoFAQ = "You can not delete "+ CusName +" because "+ CusName +" have FAQ.";
            MessageBox.Show(infoFAQ);
            return false;
        }
        return true;
    }
    private bool ktOrder()
    {
        bool b = chkExt.checkOrderEx(CusID);
        if (b == true)
        {
            
            String infoOrder = "You can not delete " + CusName +" because "+ CusName +" have order.";
            MessageBox.Show(infoOrder);
            return false;
        }
        return true;
    }
    private bool ktAll()
    {
        if (!ktOrder())
        {
            return false;
        }
        if (!ktFAQ())
        {
            return false;
        }
        return true;
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        CusID = e.Values[0].ToString();
        CusName = e.Values[1].ToString();
        if (ktAll())
        {
            ParameterCollection pc = this.ObjectDataSource1.DeleteParameters;
            pc["CusID"].DefaultValue = e.Values[0].ToString();
        }
    }
    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        // only apply changes if its DataRow

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            // when mouse is over the row, save original color to new attribute, and change it to highlight yellow color
            e.Row.Attributes.Add("onmouseover",

          "this.originalstyle=this.style.backgroundColor;this.style.backgroundColor='#FFFF00'");

            // when mouse leaves the row, change the bg color to its original value   

            e.Row.Attributes.Add("onmouseout",

            "this.style.backgroundColor=this.originalstyle;");

        }
    }
}
