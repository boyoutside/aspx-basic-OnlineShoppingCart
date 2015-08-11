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
/// Summary description for GetData
/// </summary>
public class GetDataSet
{
    //StrConnection getCon = new StrConnection();
	public GetDataSet()
	{            	
	}

    public String getPayment(int condition) 
    {
        String pay = "";
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OSCConnection"].ConnectionString.ToString());
        SqlCommand comm = new SqlCommand("Select Description from Payment where PayID = " + condition, conn);
        conn.Open();
        SqlDataReader dr = comm.ExecuteReader();
        dr.Read();
        pay = dr[0].ToString();
        conn.Close();
        return pay;
    }
    public DataSet getData(String tName) 
    {
         SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OSCConnection"].ConnectionString.ToString());
         SqlCommand comm = new SqlCommand("Select * from " + tName, conn);
         SqlDataAdapter da = new SqlDataAdapter(comm);
         DataSet ds = new DataSet();
         da.Fill(ds);
         return ds;
    }
    public DataSet getDatas(String kind)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OSCConnection"].ConnectionString.ToString());
        SqlCommand comm = new SqlCommand("Select * from Product where KindID='" + kind + "'", conn);
        SqlDataAdapter da = new SqlDataAdapter(comm);
        DataSet ds = new DataSet();
        da.Fill(ds);
        return ds;
    }
    public DataSet getData(String kind, String name)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OSCConnection"].ConnectionString.ToString());
        SqlCommand comm = new SqlCommand("Select * from Product where KindID='" + kind + "'and ProName like '%" + name + "%'", conn);
        SqlDataAdapter da = new SqlDataAdapter(comm);
        DataSet ds = new DataSet();
        da.Fill(ds);
        return ds;
    }

    public DataSet getView(String name, String useracc) 
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OSCConnection"].ConnectionString.ToString());
        SqlCommand comm = new SqlCommand("Select * from " + name + " where UserName='" + useracc + "'", conn);
        SqlDataAdapter da = new SqlDataAdapter(comm);
        DataSet ds = new DataSet();
        da.Fill(ds);
        return ds;    
    }

    public String ProductName(Products name) 
    {
        String productName = "";
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OSCConnection"].ConnectionString.ToString());
        SqlCommand comm = new SqlCommand("Select ProName from Product where ProID = '" + name.proID + "'", conn);
        conn.Open();
        SqlDataReader dr = comm.ExecuteReader(CommandBehavior.CloseConnection);
        dr.Read();
        productName = dr[0].ToString();
        conn.Close();
        return productName;
    }
    public double ProductPrice(Products price)
    {
        double getprice = 0;
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OSCConnection"].ConnectionString.ToString());
        SqlCommand comm = new SqlCommand("Select Price from Product where ProID = '" + price.proID + "'", conn);
        conn.Open();
        SqlDataReader dr = comm.ExecuteReader(CommandBehavior.CloseConnection);
        dr.Read();
        getprice = dr.GetDouble(0);
        conn.Close();
        return getprice;
    }
    public int ProductQuantity(Products pro)
    {
        int getquantity = 0;
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OSCConnection"].ConnectionString.ToString());
        SqlCommand comm = new SqlCommand("Select Quantity from Product where ProID = '" + pro.proID + "'", conn);
        conn.Open();
        SqlDataReader dr = comm.ExecuteReader(CommandBehavior.CloseConnection);
        dr.Read();
        getquantity = dr.GetInt32(0);
        conn.Close();
        return getquantity;
    }
}
