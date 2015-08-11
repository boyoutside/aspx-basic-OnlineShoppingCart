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

public partial class UserControl_RegisterCustomerUserControl : System.Web.UI.UserControl
{
    String connectString = "";
    String CusID = "";
    String AccID = "";
    AutoGenerate auto = new AutoGenerate();
    KeyExist ke = new KeyExist();
    protected void Page_Load(object sender, EventArgs e)
    {
        connectString = WebConfigurationManager.ConnectionStrings["OSCConnection"].ConnectionString;
    }
    private void CreateKey()
    {
        String key = auto.RandomNumber(8);
        CusID = "Cus" + key;
        AccID = "Acc" + key;

    }
    protected void btnInsert_Click(object sender, EventArgs e)
    {
        do
        {
            CreateKey();
        } while (ke.AccID(AccID));

        String SqlRegisterCus = "EXEC RegisterCustomer @cusid,@custname,@rollid,@ic,@phone,@email,@address,@accid,@user,@pass";
        SqlConnection conn = new SqlConnection(connectString);
        SqlCommand comm = new SqlCommand(SqlRegisterCus, conn);

        //Add Parameter Customer ID
        SqlParameter paramCusID = new SqlParameter("@cusid", SqlDbType.NVarChar, 20);
        paramCusID.Value = CusID;
        comm.Parameters.Add(paramCusID);

        //Add Parameter Customer Name
        SqlParameter paramCusName = new SqlParameter("@custname", SqlDbType.NVarChar, 50);
        paramCusName.Value = txtName.Text.Trim();
        comm.Parameters.Add(paramCusName);

        //Add Parameter Roll ID
        SqlParameter paramRollID = new SqlParameter("@rollid", SqlDbType.NVarChar, 20);
        paramRollID.Value = "R03";
        comm.Parameters.Add(paramRollID);

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

        //Add Parameter Account ID
        SqlParameter paramAccID = new SqlParameter("@accid", SqlDbType.NVarChar, 20);
        paramAccID.Value = AccID;
        comm.Parameters.Add(paramAccID);

        //Add Parameter User Name
        SqlParameter paramUserName = new SqlParameter("@user", SqlDbType.NVarChar, 20);
        paramUserName.Value = txtUser.Text.Trim();
        comm.Parameters.Add(paramUserName);

        //Add Parameter Password
        SqlParameter paramPassword = new SqlParameter("@pass", SqlDbType.NVarChar, 20);
        paramPassword.Value = txtPass.Text.Trim();
        comm.Parameters.Add(paramPassword);

        try
        {
            conn.Open();
            comm.ExecuteNonQuery();
            Response.Redirect("~/Login.aspx");
        }
        catch
        {
            conn.Close();
        }

    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("CustomerRegister.aspx");
    }
}
