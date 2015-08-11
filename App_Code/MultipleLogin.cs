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
/// Summary description for MultipleLogin
/// </summary>
public class MultipleLogin
{
    String connectString = "";
	public MultipleLogin()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public String CheckMultipleLogin(String AccID)
    {
        connectString = WebConfigurationManager.ConnectionStrings["OSCConnection"].ConnectionString;
        String result = ""; 
        String sqlCheck = "SELECT * FROM Account WHERE AccID = @accid";
        SqlConnection conn = new SqlConnection(connectString);
        SqlCommand comm = new SqlCommand(sqlCheck, conn);
        //Add Parameter Account ID
        SqlParameter paramAccID = new SqlParameter("@accid", SqlDbType.NVarChar, 20);
        paramAccID.Value = AccID;
        comm.Parameters.Add(paramAccID);
        try
        {
            conn.Open();
            SqlDataReader rd = comm.ExecuteReader();
            if (rd.HasRows)
            {
                rd.Read();
                result = rd.GetBoolean(6).ToString();
            }
            conn.Close();
        }
        catch
        {
            conn.Close();
        }
        return result;
    }

    public void WhenUserLogin(String AccID)
    {
        connectString = WebConfigurationManager.ConnectionStrings["OSCConnection"].ConnectionString;
        String sqlUserLogin = "UPDATE Account SET Status = 'True' WHERE AccID = @accid";
        SqlConnection conn = new SqlConnection(connectString);
        SqlCommand comm = new SqlCommand(sqlUserLogin, conn);

        //Add Parameter Account ID
        SqlParameter paramAccID = new SqlParameter("@accid", SqlDbType.NVarChar, 20);
        paramAccID.Value = AccID;
        comm.Parameters.Add(paramAccID);

        try
        {
            conn.Open();
            comm.ExecuteNonQuery();
            conn.Close();
        }
        catch
        {
            conn.Close();
        }
    }

    public void WhenUserLogout(String AccID)
    {
        connectString = WebConfigurationManager.ConnectionStrings["OSCConnection"].ConnectionString;
        String sqlUserLogout = "UPDATE Account SET Status = 'False' WHERE AccID = @accid";
        SqlConnection conn = new SqlConnection(connectString);
        SqlCommand comm = new SqlCommand(sqlUserLogout, conn);

        //Add Parameter Account ID
        SqlParameter paramAccID = new SqlParameter("@accid", SqlDbType.NVarChar, 20);
        paramAccID.Value = AccID;
        comm.Parameters.Add(paramAccID);

        try
        {
            conn.Open();
            comm.ExecuteNonQuery();
            conn.Close();
        }
        catch
        {
            conn.Close();
        }
    }
}
