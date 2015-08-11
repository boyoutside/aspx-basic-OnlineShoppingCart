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

public partial class UserControl_ViewSearch : System.Web.UI.UserControl
{
    GetDataSet getDS = new GetDataSet();
    static int CurrentPage = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        FilterSearch();
    }
    public void FilterSearch() 
    {
        if (Session["kindid"] != null && Session["name"] != null)
        {
            PagedDataSource objPage = new PagedDataSource();
            try
            {
                DataSet ds = new DataSet();
                ds = getDS.getData("Product");
                DataTable dt = new DataTable();
                dt = ds.Tables[0];

                DataView dv = new DataView(dt);
                dv.RowFilter = "KindID = '" + Session["kindid"].ToString() + "' and ProName = '" + Session["name"].ToString() + "'";

                DataList1.RepeatColumns = 3;
                DataList1.DataSource = dv;
                DataList1.DataBind();
            }
            catch (Exception ex)
            {

            }
            finally
            {
                objPage = null;
            }
        }
        else 
        {
               
        }        
    }
}
