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
/// Summary description for Order
/// </summary>
public class Order
{
	public Order()
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
            Button bt = (Button)gv.Rows[i].FindControl("btnConfirm");
            bt.Enabled = false;
            LinkButton bDel = (LinkButton)gv.Rows[i].FindControl("LinkButton2");
            bDel.Enabled = false;
        }
    }
    public void IsValidDate() {
        int count = 0;
        DateTime now = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day);
        String sql = "select * from Orders where IsConfirm = 'False'";
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["OSCConnection"].ConnectionString.ToString());
        DataSet ds = new DataSet();
        con.Open();
        SqlDataAdapter da= new SqlDataAdapter(sql, con);
        da.Fill(ds);
        con.Close();
        for(int i = 0;i < ds.Tables[0].Rows.Count;i++ ){
            DateTime date = (DateTime)ds.Tables[0].Rows[i][8];
            TimeSpan ts = new TimeSpan();
            ts = now.Subtract(date);
            if (ts.TotalDays>3 ) { 
                string sqlDel = "delete Orders where OrderID = '" +ds.Tables[0].Rows[i][0].ToString()+"'";
                con.Open();
                SqlCommand cmd = new SqlCommand(sqlDel,con);
                cmd.ExecuteNonQuery();
                con.Close();
                count =count + 1;
            }
            
        }
        String mess = "There is "+ count +" orders 've deleted because of Validation";
        MessageBox.Show(mess);
        
    }
}
