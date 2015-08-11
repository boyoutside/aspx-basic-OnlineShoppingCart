using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;



/// <summary>
/// Summary description for Order
/// </summary>
public class ReturnBill
{
	public ReturnBill()
	{
		
	}
    public void FillData(String sql ,SqlDataSource sqldatasource, GridView gridview) {
        sqldatasource.SelectCommand = sql;
        sqldatasource.DataBind();
        gridview.DataBind();
            
    }
    public void ConfirmStatus(GridView gv) {
        for (int i = 0; i <  gv.Rows.Count; i++)
        {
            LinkButton btE = (LinkButton)gv.Rows[i].FindControl("LinkButtonEdit");
            btE.Enabled = false;
            LinkButton btD = (LinkButton)gv.Rows[i].FindControl("LinkButtonDelete");
            btD.Enabled = false;
        }
    }
    public void mess() { 
        
    }
}
