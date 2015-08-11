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
/// Summary description for DelEmp
/// </summary>
public class DelEmp
{
    String connectString = "";
	public DelEmp()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public DataSet getEmp()
    {
        connectString = WebConfigurationManager.ConnectionStrings["OSCConnection"].ConnectionString;
        SqlConnection con = new SqlConnection(connectString);
        con.Open();
        SqlDataAdapter adapter = new SqlDataAdapter("SELECT * FROM GetEmployee", con);
        DataSet ds = new DataSet();
        adapter.Fill(ds);
        return ds;
    }
    public bool DeleteEmp(string EmpID)
    {
        connectString = WebConfigurationManager.ConnectionStrings["OSCConnection"].ConnectionString;
        String SqlDeleteEmp = "EXEC DeleteEmployee @empid";
        SqlConnection conn = new SqlConnection(connectString);
        SqlCommand comm = new SqlCommand(SqlDeleteEmp, conn);

        //Add Parameter Employee ID
        SqlParameter paramEmpID = new SqlParameter("@empid", SqlDbType.NVarChar, 20);
        paramEmpID.Value = EmpID;
        comm.Parameters.Add(paramEmpID);

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
