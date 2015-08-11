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
/// Summary description for Connection
/// </summary>
public class StrConnection
{
    public StrConnection()
	{      
	
	}
    public String GetConnect() 
    {
        return ConfigurationManager.ConnectionStrings["OSCConnection"].ToString();        
    }
}
