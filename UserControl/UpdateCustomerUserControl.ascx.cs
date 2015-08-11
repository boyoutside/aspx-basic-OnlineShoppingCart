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

public partial class UserControl_UpdateCustomerUserControl : System.Web.UI.UserControl
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
        Search();
    }
    private void Search()
    {
        String sqlSelect = "SELECT * FROM Customer WHERE CusID = @cusid";
        SqlConnection conn = new SqlConnection(connectString);
        SqlCommand comm = new SqlCommand(sqlSelect, conn);
        //Add Parameter Customer ID
        SqlParameter paramCusID = new SqlParameter("@cusid", SqlDbType.NVarChar, 20);
        paramCusID.Value = Session["vdCusID"].ToString();
        comm.Parameters.Add(paramCusID);
        try
        {
            conn.Open();
            SqlDataReader rd = comm.ExecuteReader();
            if (rd.HasRows)
            {
                rd.Read();
                txtName.Text = rd.GetSqlString(1).ToString();
                txtIC.Text = rd.GetSqlString(3).ToString();
                txtPhone.Text = rd.GetSqlString(4).ToString();
                txtEmail.Text = rd.GetSqlString(5).ToString();
                txtAddress.Text = rd.GetSqlString(6).ToString();
            }
            else
            {
                MessageBox.Show("Cus ID is wrong!!");
            }
            conn.Close();

        }
        catch
        {
            conn.Close();
        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        String SqlUpdateCus = "EXEC UpdateCustomer @pass,@accid,@custname,@ic,@phone,@email,@address,@cusid";
        SqlConnection conn = new SqlConnection(connectString);
        SqlCommand comm = new SqlCommand(SqlUpdateCus, conn);

        //Add Parameter Password
        SqlParameter paramPassword = new SqlParameter("@pass", SqlDbType.NVarChar, 20);
        paramPassword.Value = txtPass.Text.Trim();
        comm.Parameters.Add(paramPassword);

        //Add Parameter Account ID
        SqlParameter paramAccID = new SqlParameter("@accid", SqlDbType.NVarChar, 20);
        paramAccID.Value = Session["vdID"].ToString();
        comm.Parameters.Add(paramAccID);

        //Add Parameter Customer Name
        SqlParameter paramCusName = new SqlParameter("@custname", SqlDbType.NVarChar, 50);
        paramCusName.Value = txtName.Text.Trim();
        comm.Parameters.Add(paramCusName);

        //Add Parameter IC
        SqlParameter paramIC = new SqlParameter("@ic", SqlDbType.NVarChar, 20);
        paramIC.Value = txtIC.Text.Trim();
        comm.Parameters.Add(paramIC);

        //Add Parameter Phone
        SqlParameter paramPhone = new SqlParameter("@phone", SqlDbType.NVarChar, 20);
        paramPhone.Value = txtPhone.Text.Trim();
        comm.Parameters.Add(paramPhone);

        //Add Parameter Email
        SqlParameter paramEmail = new SqlParameter("@email", SqlDbType.NVarChar, 50);
        paramEmail.Value = txtEmail.Text.Trim();
        comm.Parameters.Add(paramEmail);

        //Add Parameter Address
        SqlParameter paramAddress = new SqlParameter("@address", SqlDbType.NVarChar, 300);
        paramAddress.Value = txtAddress.Text.Trim();
        comm.Parameters.Add(paramAddress);

        //Add Parameter Customer ID
        SqlParameter paramCusID = new SqlParameter("@cusid", SqlDbType.NVarChar, 20);
        paramCusID.Value = Session["vdCusID"].ToString();
        comm.Parameters.Add(paramCusID);
        try
        {
            conn.Open();
            comm.ExecuteNonQuery();
            Response.Redirect("~/Home.aspx");
        }
        catch
        {
            conn.Close();
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Page_Load(sender,e);
    }
}
