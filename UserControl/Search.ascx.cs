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
using System.Data.SqlClient;

public partial class UserControl_Search : System.Web.UI.UserControl
{
    static String index1 ="";
    static String index2 = "";
    GetDataSet dsa = new GetDataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        DropDownList2.Enabled = false;
    }
    //public void GetDataDDL()
    //{
    //    DataSet ds = new DataSet();
    //    ds = dsa.getData("ProKind");

    //    DropDownList1.DataValueField = "KindID";
    //    DropDownList1.DataTextField = "Kindname";
    //    DropDownList1.DataSource = ds.Tables[0];
    //    DropDownList1.DataBind();
    //    DropDownList1.Items.Insert(0, "Please select...");

    //}

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
       index1 = DropDownList1.SelectedValue.ToString();
       DDL();
       DropDownList2.Enabled = true;
       Session["name"] = DropDownList2.SelectedItem.ToString();
    }
    protected void bSearch_Click(object sender, EventArgs e)
    {
        Session["kindid"] = index1;        
        if (Session["kindid"] != null && Session["name"] != null)
        {
            Response.Redirect("ViewSearch.aspx");
        }
        else 
        {
            Response.Redirect("ViewProducts.aspx");
        }
    }    
    protected void DropDownList1_DataBound(object sender, EventArgs e)
    {
        this.DropDownList1.Items.Add(new ListItem("-Select-", "-1"));
        this.DropDownList1.SelectedValue = "-1";        
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["name"] = DropDownList2.SelectedItem.ToString();
    //   index2 = DropDownList2.SelectedItem.ToString();
    //   Session["name"] = index2;
    }    
    public void DDL() 
    {
        DataSet ds = new DataSet();
        ds = dsa.getDatas(index1);

        DropDownList2.DataValueField = "ProID";
        DropDownList2.DataTextField = "ProName";
        DropDownList2.DataSource = ds.Tables[0];
        DropDownList2.DataBind();
    }
}
