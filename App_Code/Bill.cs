using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;



/// <summary>
/// Summary description for Bill
/// </summary>
public class Bill
{
	public Bill()
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
            LinkButton btReturn = (LinkButton)gv.Rows[i].FindControl("LinkButtonReturn");
            btReturn.Enabled = false;
            LinkButton btEdit = (LinkButton)gv.Rows[i].FindControl("LinkButtonEdit");
            btEdit.Enabled = false;
        }
    }
   
    public void IsReturnBill(string sql,GridView gv)
    {
        int count = 0;
        DateTime now = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day);
        
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["OSCConnection"].ConnectionString.ToString());
        DataSet ds = new DataSet();
        con.Open();
        SqlDataAdapter da = new SqlDataAdapter(sql, con);
        da.Fill(ds);
        con.Close();
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            LinkButton lkb = (LinkButton)gv.Rows[i].FindControl("LinkButtonReturn");
            DateTime date = (DateTime)ds.Tables[0].Rows[i][3];
            TimeSpan ts = new TimeSpan();
            ts = now.Subtract(date);
            if (ds.Tables[0].Rows[i][4].ToString().Equals("True") && ds.Tables[0].Rows[i][5].ToString().Equals("True"))
            {

                if (ts.TotalDays <= 7)
                {

                    lkb.Enabled = true;

                }
                else
                {
                    lkb.Enabled = false;
                }
            }
            else {
                lkb.Enabled = false;
            }
        }
       

    }
}
