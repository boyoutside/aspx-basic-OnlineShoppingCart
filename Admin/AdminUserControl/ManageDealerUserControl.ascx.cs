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

public partial class UserControl_ManageDealerUserControl : System.Web.UI.UserControl
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
        if (txtDealerID.Text.Trim() != "" && txtDealerID.Text.Length < 20)
        {
            String SqlInsertDealer = "EXEC InsertDealer @dealerid,@dealname,@address,@desription";
            SqlConnection conn = new SqlConnection(connectString);
            SqlCommand comm = new SqlCommand(SqlInsertDealer, conn);

            //Add Parameter Dealer ID
            SqlParameter paramDealerID = new SqlParameter("@dealerid", SqlDbType.NVarChar, 20);
            paramDealerID.Value = txtDealerID.Text.Trim();
            comm.Parameters.Add(paramDealerID);

            //Add Parameter Dealer Name
            SqlParameter paramDealerName = new SqlParameter("@dealname", SqlDbType.NVarChar, 50);
            paramDealerName.Value = txtDealerName.Text.Trim();
            comm.Parameters.Add(paramDealerName);

            //Add Parameter Address
            SqlParameter paramAddress = new SqlParameter("@address", SqlDbType.NVarChar, 300);
            paramAddress.Value = txtAddress.Text.Trim();
            comm.Parameters.Add(paramAddress);

            //Add Parameter Description
            SqlParameter paramDescription = new SqlParameter("@desription", SqlDbType.NVarChar, 300);
            paramDescription.Value = txtDescription.Text.Trim();
            comm.Parameters.Add(paramDescription);

            try
            {
                conn.Open();
                comm.ExecuteNonQuery();
                Response.Redirect("~/Admin/ManageDealer.aspx");
            }
            catch
            {
                conn.Close();
                MessageBox.Show("Dealer ID is exist!!");
            }
        }
        else
        {
            MessageBox.Show("Dealer ID cannot blank and length < 20!!");
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        btnUpdate.Enabled = true;
        btnInsert.Enabled = false;
        String sqlSelect = "SELECT * FROM Dealer WHERE DealerID = @dealerid";
        SqlConnection conn = new SqlConnection(connectString);
        SqlCommand comm = new SqlCommand(sqlSelect, conn);

        //Add Parameter Dealer ID
        SqlParameter paramDealerID = new SqlParameter("@dealerid", SqlDbType.NVarChar, 20);
        paramDealerID.Value = txtDealerID.Text.Trim();
        comm.Parameters.Add(paramDealerID);

        try
        {
            conn.Open();
            SqlDataReader rd = comm.ExecuteReader();
            if (rd.HasRows)
            {
                rd.Read();
                txtDealerID.Enabled = false;
                btnSearch.Enabled = false;
                txtDealerName.Text = rd.GetString(1).ToString();
                txtAddress.Text = rd.GetString(2).ToString();
                txtDescription.Text = rd.GetString(3).ToString();
            }
            else
            {
                btnUpdate.Enabled = false;
                btnInsert.Enabled = true;
                txtDealerID.Enabled = true;
                MessageBox.Show("Dealer ID is wrong!!");
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
        String SqlUpdateDealer = "EXEC UpdateDealer @dealname,@address,@desription,@dealerid";
        SqlConnection conn = new SqlConnection(connectString);
        SqlCommand comm = new SqlCommand(SqlUpdateDealer, conn);

        //Add Parameter Dealer Name
        SqlParameter paramDealerName = new SqlParameter("@dealname", SqlDbType.NVarChar, 50);
        paramDealerName.Value = txtDealerName.Text.Trim();
        comm.Parameters.Add(paramDealerName);

        //Add Parameter Address
        SqlParameter paramAddress = new SqlParameter("@address", SqlDbType.NVarChar, 300);
        paramAddress.Value = txtAddress.Text.Trim();
        comm.Parameters.Add(paramAddress);

        //Add Parameter Description
        SqlParameter paramDescription = new SqlParameter("@desription", SqlDbType.NVarChar, 300);
        paramDescription.Value = txtDescription.Text.Trim();
        comm.Parameters.Add(paramDescription);

        //Add Parameter Dealer ID
        SqlParameter paramDealerID = new SqlParameter("@dealerid", SqlDbType.NVarChar, 20);
        paramDealerID.Value = txtDealerID.Text.Trim();
        comm.Parameters.Add(paramDealerID);

        try
        {
            conn.Open();
            comm.ExecuteNonQuery();
            Response.Redirect("~/Admin/ManageDealer.aspx");
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
        txtDealerID.Text = GridView1.SelectedRow.Cells[1].Text.ToString();
        btnSearch_Click(sender, e);
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/ManageDealer.aspx");
    }
}
