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
/// Summary description for ManaPro
/// </summary>
public class ManaPro
{
    String connectString = "";
	public ManaPro()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public DataSet getPro()
    {
        connectString = WebConfigurationManager.ConnectionStrings["OSCConnection"].ConnectionString;
        SqlConnection con = new SqlConnection(connectString);
        con.Open();
        SqlDataAdapter adapter = new SqlDataAdapter("SELECT * FROM Product", con);
        DataSet ds = new DataSet();
        adapter.Fill(ds);
        return ds;
    }

    public bool DeletePro(string ProID)
    {
        connectString = WebConfigurationManager.ConnectionStrings["OSCConnection"].ConnectionString;
        String SqlDeletePro = "EXEC DeleteProduct @proid";
        SqlConnection conn = new SqlConnection(connectString);
        SqlCommand comm = new SqlCommand(SqlDeletePro, conn);

        //Add Parameter Product ID
        SqlParameter paramProID = new SqlParameter("@proid", SqlDbType.NVarChar, 20);
        paramProID.Value = ProID;
        comm.Parameters.Add(paramProID);

        try
        {
            conn.Open();
            comm.ExecuteNonQuery();
        }
        catch
        {
            conn.Close();
        }
        return true;
    }

    public bool checkReturnBill(String ProID)
    {
        connectString = WebConfigurationManager.ConnectionStrings["OSCConnection"].ConnectionString;
        String sqlcheckReturnBillExist = "EXEC ReturnBillExist @proid";
        SqlConnection conn = new SqlConnection(connectString);
        SqlCommand comm = new SqlCommand(sqlcheckReturnBillExist, conn);
        conn.Open();
        //Add Parameter Product ID
        SqlParameter paramProID = new SqlParameter("@proid", SqlDbType.NVarChar, 20);
        paramProID.Value = ProID;
        comm.Parameters.Add(paramProID);
        SqlDataReader rd = comm.ExecuteReader(CommandBehavior.CloseConnection);
        return rd.HasRows;
    }
    public bool checkWarranty(String ProID)
    {
        connectString = WebConfigurationManager.ConnectionStrings["OSCConnection"].ConnectionString;
        String sqlcheckWarrantyExist = "EXEC WarrantyExist @proid";
        SqlConnection conn = new SqlConnection(connectString);
        SqlCommand comm = new SqlCommand(sqlcheckWarrantyExist, conn);
        conn.Open();
        //Add Parameter Product ID
        SqlParameter paramProID = new SqlParameter("@proid", SqlDbType.NVarChar, 20);
        paramProID.Value = ProID;
        comm.Parameters.Add(paramProID);
        SqlDataReader rd = comm.ExecuteReader(CommandBehavior.CloseConnection);
        return rd.HasRows;
    }
    public bool checkOrders(String ProID)
    {
        connectString = WebConfigurationManager.ConnectionStrings["OSCConnection"].ConnectionString;
        String sqlcheckOrdersExist = "EXEC OrdersExist @proid";
        SqlConnection conn = new SqlConnection(connectString);
        SqlCommand comm = new SqlCommand(sqlcheckOrdersExist, conn);
        conn.Open();
        //Add Parameter Product ID
        SqlParameter paramProID = new SqlParameter("@proid", SqlDbType.NVarChar, 20);
        paramProID.Value = ProID;
        comm.Parameters.Add(paramProID);
        SqlDataReader rd = comm.ExecuteReader(CommandBehavior.CloseConnection);
        return rd.HasRows;
    }
}
