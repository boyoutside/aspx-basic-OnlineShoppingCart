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

public partial class UserControl_UpdateEmployeeUserControl : System.Web.UI.UserControl
{
    String connectString = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        connectString = WebConfigurationManager.ConnectionStrings["OSCConnection"].ConnectionString;
        if (Session["vdName"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
        txtUser.Text = Session["vdName"].ToString();
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        String SqlUpdateEmp = "EXEC UpdateEmployee @pass,@accid";
        SqlConnection conn = new SqlConnection(connectString);
        SqlCommand comm = new SqlCommand(SqlUpdateEmp, conn);
        //Add Parameter Password
        SqlParameter paramPassword = new SqlParameter("@pass", SqlDbType.NVarChar, 20);
        paramPassword.Value = txtPass.Text.Trim();
        comm.Parameters.Add(paramPassword);

        //Add Parameter Account ID
        SqlParameter paramAccID = new SqlParameter("@accid", SqlDbType.NVarChar, 20);
        paramAccID.Value = Session["vdID"].ToString();
        comm.Parameters.Add(paramAccID);
        try
        {
            conn.Open();
            comm.ExecuteNonQuery();
            txtPass.Text = "";
            txtConfirm.Text = "";
            MessageBox.Show("Update is successfull!!");
        }
        catch
        {
            conn.Close();
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/UpdateEmployee.aspx");
    }
}
