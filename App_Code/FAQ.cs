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
/// Summary description for FAQ
/// </summary>
public class FAQ
{
	public FAQ()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public void InsertFAQ(string cus, String quest, String isans, String date) 
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OSCConnection"].ConnectionString);
        SqlCommand comm = new SqlCommand("Insert into FAQ(CusID,Question,IsAnswer,Date) values ('" + cus + "','" + quest + "','" + isans + "','" + date + "')", conn);
        conn.Open();
        comm.ExecuteNonQuery();
        conn.Close();
    }
    public bool UpdateFAQ(String faq, String answer, String isans, String empid) 
    {
        bool a = false;
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OSCConnection"].ConnectionString);
        SqlCommand comm = new SqlCommand("Update ViewFAQ set Answer='" + answer + "' ,IsAnswer='true',EmpID='" + empid + "' where FAQID=" + faq, conn);
        try
        {
            conn.Open();
            comm.ExecuteNonQuery();
            conn.Close();
            a = true;
        }
        catch 
        {
            conn.Close();
            a = false;
        }
        return a;
    }
    
}
