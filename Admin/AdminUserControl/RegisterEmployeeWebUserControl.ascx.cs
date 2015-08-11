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

public partial class UserControl_RegisterEmployeeWebUserControl : System.Web.UI.UserControl
{
    String connectString = "";
    String EmpID = "";
    String AccID = "";
    AutoGenerate auto = new AutoGenerate();
    KeyExist ke = new KeyExist();
    protected void Page_Load(object sender, EventArgs e)
    {
        connectString = WebConfigurationManager.ConnectionStrings["OSCConnection"].ConnectionString;
        if (Session["vdName"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
    }
    private void CreateKey()
    {
        String key = auto.RandomNumber(8);
        EmpID = "Emp" + key;
        AccID = "Acc" + key;

    }
    protected void btnInsert_Click(object sender, EventArgs e)
    {
        do
        {
            CreateKey();
        } while (ke.AccID(AccID));

        String SqlRegisterEmp = "EXEC RegisterEmployee @empid,@empname,@address,@rollid,@dealerid,@accid,@user,@pass";
        SqlConnection conn = new SqlConnection(connectString);
        SqlCommand comm = new SqlCommand(SqlRegisterEmp, conn);

        //Add Parameter Employee ID
        SqlParameter paramEmpID = new SqlParameter("@empid", SqlDbType.NVarChar, 20);
        paramEmpID.Value = EmpID;
        comm.Parameters.Add(paramEmpID);

        //Add Parameter Employee Name
        SqlParameter paramEmpName = new SqlParameter("@empname", SqlDbType.NVarChar, 50);
        paramEmpName.Value = txtName.Text.Trim();
        comm.Parameters.Add(paramEmpName);

        //Add Parameter Address
        SqlParameter paramAddress = new SqlParameter("@address", SqlDbType.NVarChar, 300);
        paramAddress.Value = txtAddress.Text.Trim();
        comm.Parameters.Add(paramAddress);

        //Add Parameter Roll ID
        SqlParameter paramRollID = new SqlParameter("@rollid", SqlDbType.NVarChar, 20);
        paramRollID.Value = DropRoll.SelectedValue.ToString();
        comm.Parameters.Add(paramRollID);

        //Add Parameter Dealer ID
        SqlParameter paramDealerID = new SqlParameter("@dealerid", SqlDbType.NVarChar, 20);
        paramDealerID.Value = DropDealer.SelectedValue.ToString();
        comm.Parameters.Add(paramDealerID);

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
            txtUser.Text = "";
            txtPass.Text = "";
            txtConfirm.Text = "";
            txtName.Text = "";
            txtAddress.Text = "";
            DropRoll.SelectedIndex = 1;
            DropDealer.SelectedIndex = 0;
            MessageBox.Show("Register Employee successful!!");
        }
        catch
        {
            conn.Close();
        }

    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/EmployeeRegister.aspx");
    }
}
