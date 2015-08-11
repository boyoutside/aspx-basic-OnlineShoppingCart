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

public partial class UserControl_ManaProKindUserControl : System.Web.UI.UserControl
{
    String connectString = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        connectString = WebConfigurationManager.ConnectionStrings["OSCConnection"].ConnectionString;
        if (Session["vdName"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
        btnUpdate.Enabled = false;
    }

    protected void btnInsert_Click(object sender, EventArgs e)
    {
        if (txtKindID.Text.Trim() != "" && txtKindID.Text.Length < 20)
        {
            String SqlInsertProKind = "EXEC InsertProKind @kindid,@kindname,@description";
            SqlConnection conn = new SqlConnection(connectString);
            SqlCommand comm = new SqlCommand(SqlInsertProKind, conn);

            //Add Parameter Product Kind ID
            SqlParameter paramKindID = new SqlParameter("@kindid", SqlDbType.NVarChar, 20);
            paramKindID.Value = txtKindID.Text.Trim();
            comm.Parameters.Add(paramKindID);

            //Add Parameter Product Kind Name
            SqlParameter paramKindName = new SqlParameter("@kindname", SqlDbType.NVarChar, 50);
            paramKindName.Value = txtKindName.Text.Trim();
            comm.Parameters.Add(paramKindName);

            //Add Parameter Description
            SqlParameter paramDescription = new SqlParameter("@description", SqlDbType.NVarChar, 300);
            paramDescription.Value = txtDescription.Text.Trim();
            comm.Parameters.Add(paramDescription);

            try
            {
                conn.Open();
                comm.ExecuteNonQuery();
                Response.Redirect("~/Admin/ManageKind.aspx");
            }
            catch
            {
                conn.Close();
                MessageBox.Show("Product Kind ID is exist!!");
            }
        }
        else
        {
            MessageBox.Show("Product Kind ID cannot blank and length < 20!!");
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        btnUpdate.Enabled = true;
        btnInsert.Enabled = false;
        String sqlSelect = "SELECT * FROM ProKind WHERE KindID = @kindid";
        SqlConnection conn = new SqlConnection(connectString);
        SqlCommand comm = new SqlCommand(sqlSelect, conn);

        //Add Parameter Product Kind ID
        SqlParameter paramKindID = new SqlParameter("@kindid", SqlDbType.NVarChar, 20);
        paramKindID.Value = txtKindID.Text.Trim();
        comm.Parameters.Add(paramKindID);
        try
        {
            conn.Open();
            SqlDataReader rd = comm.ExecuteReader();
            if (rd.HasRows)
            {
                rd.Read();
                txtKindID.Enabled = false;
                btnSearch.Enabled = false;
                txtKindName.Text = rd.GetString(1).ToString();
                txtDescription.Text = rd.GetString(2).ToString();
            }
            else
            {
                btnUpdate.Enabled = false;
                btnInsert.Enabled = true;
                txtKindID.Enabled = true;
                MessageBox.Show("Product Kind ID is wrong!!");
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
        Response.Redirect("~/Admin/ManageKind.aspx");
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        String SqlUpdateProKind= "EXEC UpdateProKind @kindname,@description,@kindid";
        SqlConnection conn = new SqlConnection(connectString);
        SqlCommand comm = new SqlCommand(SqlUpdateProKind, conn);

        //Add Parameter Product Kind Name
        SqlParameter paramKindName = new SqlParameter("@kindname", SqlDbType.NVarChar, 50);
        paramKindName.Value = txtKindName.Text.Trim();
        comm.Parameters.Add(paramKindName);

        //Add Parameter Description
        SqlParameter paramDescription = new SqlParameter("@description", SqlDbType.NVarChar, 300);
        paramDescription.Value = txtDescription.Text.Trim();
        comm.Parameters.Add(paramDescription);

        //Add Parameter Product Kind ID
        SqlParameter paramKindID = new SqlParameter("@kindid", SqlDbType.NVarChar, 20);
        paramKindID.Value = txtKindID.Text.Trim();
        comm.Parameters.Add(paramKindID);
        try
        {
            conn.Open();
            comm.ExecuteNonQuery();
            Response.Redirect("~/Admin/ManageKind.aspx");
        }
        catch
        {
            
            conn.Close();
        }
    }
    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            // when mouse is over the row, save original color to new attribute, and change it to highlight yellow color
            e.Row.Attributes.Add("onmouseover",

          "this.originalstyle=this.style.backgroundColor;this.style.backgroundColor='#FFFF00'");

            // when mouse leaves the row, change the bg color to its original value   

            e.Row.Attributes.Add("onmouseout",

            "this.style.backgroundColor=this.originalstyle;");
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtKindID.Text = GridView1.SelectedRow.Cells[1].Text.ToString();
        btnSearch_Click(sender, e);
    }
}
