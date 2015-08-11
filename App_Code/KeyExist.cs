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
/// Summary description for KeyExist
/// </summary>
public class KeyExist
{
    String connectString = "";
	public KeyExist()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public bool CheckID(String table, String column, String value)
    {
        connectString = WebConfigurationManager.ConnectionStrings["OSCConnection"].ConnectionString;
        String select = String.Format("SELECT * FROM {0} WHERE {1} = '{2}'",table,column,value);
        SqlConnection conn = new SqlConnection(connectString);
        SqlCommand comm = new SqlCommand(select,conn);

        //Add Parameter Account ID
        SqlParameter paramID = new SqlParameter("@id", SqlDbType.NVarChar, 20);
        paramID.Value = value;
        comm.Parameters.Add(paramID);

        conn.Open();
        SqlDataReader rd = comm.ExecuteReader(CommandBehavior.CloseConnection);
        return rd.HasRows;
    }

    public bool AccID(String AccID)
    {
        connectString = WebConfigurationManager.ConnectionStrings["OSCConnection"].ConnectionString;
        String selectAccID = "SELECT * FROM Account WHERE AccID = @accid";
        SqlConnection conn = new SqlConnection(connectString);
        SqlCommand comm = new SqlCommand(selectAccID,conn);

        //Add Parameter Account ID
        SqlParameter paramAccID = new SqlParameter("@accid", SqlDbType.NVarChar, 20);
        paramAccID.Value = AccID;
        comm.Parameters.Add(paramAccID);

        conn.Open();
        SqlDataReader rd = comm.ExecuteReader(CommandBehavior.CloseConnection);
        return rd.HasRows;
    }

    public bool ProID(String ProID)
    {
        connectString = WebConfigurationManager.ConnectionStrings["OSCConnection"].ConnectionString;
        String selectAccID = "SELECT * FROM Product WHERE ProID = @proid";
        SqlConnection conn = new SqlConnection(connectString);
        SqlCommand comm = new SqlCommand(selectAccID, conn);

        //Add Parameter Product ID
        SqlParameter paramProID = new SqlParameter("@proid", SqlDbType.NVarChar, 20);
        paramProID.Value = ProID;
        comm.Parameters.Add(paramProID);

        conn.Open();
        SqlDataReader rd = comm.ExecuteReader(CommandBehavior.CloseConnection);
        return rd.HasRows;
    }
}
