using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Web.Configuration;
using System.Data.SqlClient;

/// <summary>
/// Summary description for CheckExist
/// </summary>
public class CheckExist
{
    String connectString = "";
	public CheckExist()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public bool checkFAQEx(String CusID)
    {
        connectString = WebConfigurationManager.ConnectionStrings["OSCConnection"].ConnectionString;
        String sqlcheckExistFAQ = "EXEC CustomerExistFAQ @cusid";
        SqlConnection conn = new SqlConnection(connectString);
        SqlCommand comm = new SqlCommand(sqlcheckExistFAQ, conn);
        conn.Open();
        //Add Parameter Customer ID
        SqlParameter paramCusID = new SqlParameter("@cusid", SqlDbType.NVarChar, 20);
        paramCusID.Value = CusID;
        comm.Parameters.Add(paramCusID);
        SqlDataReader rd = comm.ExecuteReader(CommandBehavior.CloseConnection);
        return rd.HasRows;
    }
    public bool checkOrderEx(String CusID)
    {
        connectString = WebConfigurationManager.ConnectionStrings["OSCConnection"].ConnectionString;
        String sqlcheckExistOrder = "EXEC CustomerExistOrders @cusid";
        SqlConnection conn = new SqlConnection(connectString);
        SqlCommand comm = new SqlCommand(sqlcheckExistOrder, conn);
        conn.Open();
        //Add Parameter Customer ID
        SqlParameter paramCusID = new SqlParameter("@cusid", SqlDbType.NVarChar, 20);
        paramCusID.Value = CusID;
        comm.Parameters.Add(paramCusID);
        SqlDataReader rd = comm.ExecuteReader(CommandBehavior.CloseConnection);
        return rd.HasRows;
    }
}
