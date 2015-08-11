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
/// Summary description for DelCus
/// </summary>
public class DelCus
{
    String connectString = "";
	public DelCus()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public DataSet getCus()
    {
        connectString = WebConfigurationManager.ConnectionStrings["OSCConnection"].ConnectionString;
        SqlConnection con = new SqlConnection(connectString);
        con.Open();
        SqlDataAdapter adapter = new SqlDataAdapter("SELECT * FROM GetCustomer", con);
        DataSet ds = new DataSet();
        adapter.Fill(ds);
        return ds;
    }


    public bool DeleteCusID(string CusID)
    {
        connectString = WebConfigurationManager.ConnectionStrings["OSCConnection"].ConnectionString;
        String SqlDeleteCus = "EXEC DeleteCustomer @cusid";
        SqlConnection conn = new SqlConnection(connectString);
        SqlCommand comm = new SqlCommand(SqlDeleteCus, conn);

        //Add Parameter Customer ID
        SqlParameter paramCusID = new SqlParameter("@cusid", SqlDbType.NVarChar, 20);
        paramCusID.Value = CusID;
        comm.Parameters.Add(paramCusID);

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
}
