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

public partial class Admin_MainEmployee : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["vdName"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
    }
    protected void linkEdit_Click(object sender, EventArgs e)
    {
        Response.Redirect(String.Format("~/Admin/UpdateEmployee.aspx?id= {0}", Session["vdName"].ToString()));
    }
    protected void linkInsertProduct_Click(object sender, EventArgs e)
    {
        Response.Redirect(String.Format("~/Admin/InsertProduct.aspx?id= {0}", Session["vdName"].ToString()));
    }
    protected void linkDeleteProduct_Click(object sender, EventArgs e)
    {
        Response.Redirect(String.Format("~/Admin/ManageProduct.aspx?id= {0}", Session["vdName"].ToString()));
    }
    protected void linkProKind_Click(object sender, EventArgs e)
    {
        Response.Redirect(String.Format("~/Admin/ManageKind.aspx?id= {0}", Session["vdName"].ToString()));
    }
}
