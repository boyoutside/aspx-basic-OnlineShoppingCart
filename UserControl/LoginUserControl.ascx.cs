using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Web.Configuration;
using System.Data.SqlClient;

public partial class UserControl_LoginUserControl : System.Web.UI.UserControl
{
    String connectString = "";
    String roll = "";
    String result = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["name"] != null)
        {
            this.Login1.UserName = Request.Cookies["name"].Value;
        }
        connectString = WebConfigurationManager.ConnectionStrings["OSCConnection"].ConnectionString;
        

    }
    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
        CheckLogin(Login1.UserName, Login1.Password);
        if (result == "3")
        {
            Login1.FailureText = "Account is not exist!!"; ;
        }
        else if (result == "2")
        {
            Login1.FailureText = "Password is wrong!!";
        }
        else if (result == "1")
        {
            if (Login1.RememberMeSet.ToString() == "True")
            {
                HttpCookie cookName = new HttpCookie("name", this.Login1.UserName);
                cookName.Expires = DateTime.Now.AddMinutes(30);
                Response.Cookies.Add(cookName);
            }

            String sqlCheckRoll = "EXEC checkRollLogin @user";
            SqlConnection conn = new SqlConnection(connectString);
            SqlCommand comm = new SqlCommand(sqlCheckRoll, conn);

            //Add Parameter User Name
            SqlParameter paramUserName = new SqlParameter("@user", SqlDbType.NVarChar, 20);
            paramUserName.Value = Login1.UserName;
            comm.Parameters.Add(paramUserName);
            try
            {
                conn.Open();
                SqlDataReader rd = comm.ExecuteReader();
                if (rd.HasRows)
                {
                    rd.Read();
                    roll = rd.GetString(4).ToString();
                    Session["vdID"] = rd.GetString(0).ToString();
                    Session["vdName"] = rd.GetString(1).ToString();
                    
                    Session["vdRoll"] = rd.GetString(4).ToString();
                    
                    Session["vdPath"] = Server.MapPath(Request.RawUrl).Substring(0, Server.MapPath(Request.RawUrl).LastIndexOf("\\"));
                    if (roll == "R03")
                    {
                        Session["vdCusID"] = rd.GetString(5).ToString();
                    }
                    else
                    {
                        Session["vdEmpID"] = rd.GetString(3).ToString();
                    }
                }
                conn.Close();
            }
            catch
            {
                conn.Close();
            }
            if (roll == "R01")
            {
                //Admin
                Response.Redirect(String.Format("~/Admin/MainAdmin.aspx?id= {0}", Session["vdName"].ToString()));
            }
            else if (roll == "R02")
            {
                //Employee
                Response.Redirect(String.Format("~/Admin/MainEmployee.aspx?id= {0}", Session["vdName"].ToString()));
            }
            else
            {
                //Customer
                Response.Redirect("Home.aspx");
            }
        }
    }
    public void CheckLogin(string name, string pass)
    {

        String sqlCheck = "EXEC checkLogin @user,@pass";
        SqlConnection conn = new SqlConnection(connectString);
        SqlCommand comm = new SqlCommand(sqlCheck, conn);

        //Add Parameter User Name
        SqlParameter paramUserName = new SqlParameter("@user", SqlDbType.NVarChar, 20);
        paramUserName.Value = name;
        comm.Parameters.Add(paramUserName);
        //Add Parameter Password
        SqlParameter paramPassword = new SqlParameter("@pass", SqlDbType.NVarChar, 20);
        paramPassword.Value = pass;
        comm.Parameters.Add(paramPassword);
        try
        {
            conn.Open();
            SqlDataReader rd = comm.ExecuteReader();
            if (rd.HasRows)
            {
                rd.Read();
                result = rd.GetInt32(0).ToString();
            }
            conn.Close();
        }
        catch
        {
            conn.Close();
        }

    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }
}
