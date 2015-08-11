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

public partial class UserControl_ManageProductWebUserControl : System.Web.UI.UserControl
{
    String connectString = "";

    String ProID = "";
    String ProName = "";

    String path = "";
    String picPath = "";
    String file = "";
    String regex = "";
    bool ketqua;

    

    ManaPro mana = new ManaPro();
    protected void Page_Load(object sender, EventArgs e)
    {
        connectString = WebConfigurationManager.ConnectionStrings["OSCConnection"].ConnectionString;
        if (Session["vdName"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
        BeforeUpdate();
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        String sqlSelect = "SELECT * FROM Product WHERE ProID = @proid";
        SqlConnection conn = new SqlConnection(connectString);
        SqlCommand comm = new SqlCommand(sqlSelect, conn);
        //Add Parameter Product ID
        SqlParameter paramProID = new SqlParameter("@proid", SqlDbType.NVarChar, 20);
        paramProID.Value = txtProID.Text.Trim();
        comm.Parameters.Add(paramProID);
        try
        {
            conn.Open();
            SqlDataReader rd = comm.ExecuteReader();
            if (rd.HasRows)
            {
                rd.Read();
                txtProName.Text = rd.GetString(1).ToString();
                DropKind.SelectedValue = rd.GetString(2).ToString();
                txtPrice.Text = rd.GetDouble(3).ToString();
                txtQuantity.Text = rd.GetInt32(4).ToString();
                Session["vdPT"] = rd.GetString(5).ToString();
                txtProducer.Text = rd.GetString(6).ToString();
                txtWarranty.Text = rd.GetInt32(7).ToString();
                txtDescription.Text = rd.GetString(8).ToString();
                AfterUpdate();
            }
            else
            {
                MessageBox.Show("Product ID is wrong!!");
            }
            conn.Close();
            
        }
        catch
        {
            conn.Close();
        }

    }
    private bool ktReturnBill()
    {
        bool a = mana.checkReturnBill(ProID);
        if (a == true)
        {
            String infoReturnBill = "You can not delete " + ProName + " because " + ProName + " have ReturnBill.";
            MessageBox.Show(infoReturnBill);
            return false;
        }
        return true;
    }
    private bool ktWarranty()
    {
        bool b = mana.checkWarranty(ProID);
        if (b == true)
        {
            String infoWarranty = "You can not delete " + ProName + " because " + ProName + " have Warranty.";
            MessageBox.Show(infoWarranty);
            return false;
        }
        return true;
    }
    private bool ktOrders()
    {
        bool b = mana.checkOrders(ProID);
        if (b == true)
        {
            String infoOrders = "You can not delete " + ProName + " because " + ProName + " have Orders.";
            MessageBox.Show(infoOrders);
            return false;
        }
        return true;
    }

    private bool ktAll()
    {
        if (!ktReturnBill())
        {
            return false;
        }
        if (!ktWarranty())
        {
            return false;
        }
        if (!ktOrders())
        {
            return false;
        }
        return true;
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        ProID = e.Values[0].ToString();
        ProName = e.Values[1].ToString();
        if (ktAll())
        {
            ParameterCollection pc = this.ObjectDataSource1.DeleteParameters;
            pc["ProID"].DefaultValue = e.Values[0].ToString();
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/ManageProduct.aspx");
    }

    private bool getFile()
    {
        if (FileUpload1.HasFile.ToString() == "False")
        {
            picPath = "~/DataUpload/";
            picPath = Session["vdPT"].ToString();
            ketqua = true;
        }
        else
        {
            if (FileUpload1.PostedFile.ContentLength > 2048576)
            {
                ketqua = false;
                MessageBox.Show("The file size must be < 2MB");
            }
            else
            {
                if (Session["vdPath"] != null)
                {
                    path = Session["vdPath"].ToString();
                }
                file = path + "\\DataUpload\\" + FileUpload1.FileName.ToString();
                regex = System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName.ToLower().ToString());
                picPath = "~/DataUpload/" + FileUpload1.FileName.ToString();
                if (regex == ".bmp" || regex == ".jpg" || regex == ".gif" || regex == ".png")
                {
                    ketqua = true;
                }
                else
                {
                    ketqua = false;
                    MessageBox.Show("The file image must be format by .jpg,.bmp,.gif,.png");
                }
            }

        }
        return ketqua;
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (getFile())
        {
            MessageBox.Show(picPath);
            String SqlUpdatePro = "EXEC UpdateProduct @proname,@kindid,@price,@quantity,@images,@producer,@warranty,@description,@proid";
            SqlConnection conn = new SqlConnection(connectString);
            SqlCommand comm = new SqlCommand(SqlUpdatePro, conn);

            //Add Parameter Product Name
            SqlParameter paramProName = new SqlParameter("@proname", SqlDbType.NVarChar, 50);
            paramProName.Value = txtProName.Text.Trim();
            comm.Parameters.Add(paramProName);

            //Add Parameter Product Kind
            SqlParameter paramProKind = new SqlParameter("@kindid", SqlDbType.NVarChar, 20);
            paramProKind.Value = DropKind.SelectedValue.ToString();
            comm.Parameters.Add(paramProKind);

            //Add Parameter Price
            SqlParameter paramPrice = new SqlParameter("@price", SqlDbType.Float);
            paramPrice.Value = Convert.ToDouble(txtPrice.Text.Trim());
            comm.Parameters.Add(paramPrice);

            //Add Parameter Quantity
            SqlParameter paramQuantity = new SqlParameter("@quantity", SqlDbType.Int);
            paramQuantity.Value = Convert.ToInt32(txtQuantity.Text.Trim());
            comm.Parameters.Add(paramQuantity);
            
            //Add Parameter Images
            SqlParameter paramImages = new SqlParameter("@images", SqlDbType.NVarChar, 250);
            paramImages.Value = picPath.ToString();
            comm.Parameters.Add(paramImages);

            //Add Parameter Producer
            SqlParameter paramProducer = new SqlParameter("@producer", SqlDbType.NVarChar, 20);
            paramProducer.Value = txtProducer.Text.Trim();
            comm.Parameters.Add(paramProducer);

            //Add Parameter Warranty
            SqlParameter paramWarranty = new SqlParameter("@warranty", SqlDbType.Int);
            paramWarranty.Value = Convert.ToInt32(txtWarranty.Text.Trim());
            comm.Parameters.Add(paramWarranty);

            //Add Parameter Description
            SqlParameter paramDescription = new SqlParameter("@description", SqlDbType.NVarChar, 300);
            paramDescription.Value = txtDescription.Text.Trim();
            comm.Parameters.Add(paramDescription);

            //Add Parameter Product ID
            SqlParameter paramProID = new SqlParameter("@proid", SqlDbType.NVarChar, 20);
            paramProID.Value = txtProID.Text.Trim();
            comm.Parameters.Add(paramProID);
            try
            {
                conn.Open();
                comm.ExecuteNonQuery();
                FileUpload1.SaveAs(file);

                
            }
            catch
            {
                conn.Close();
            }
            Response.Redirect("~/Admin/ManageProduct.aspx");
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
    private void BeforeUpdate()
    {
        txtProID.Enabled = true;
        txtProName.Enabled = false;
        DropKind.Enabled = false;
        txtPrice.Enabled = false;
        txtQuantity.Enabled = false;
        FileUpload1.Enabled = false;
        txtProducer.Enabled = false;
        txtWarranty.Enabled = false;
        txtDescription.Enabled = false;
        btnSearch.Enabled = true;
        btnUpdate.Enabled = false;
        btnCancel.Enabled = true;
    }
    private void AfterUpdate()
    {
        txtProID.Enabled = false;
        txtProName.Enabled = true;
        DropKind.Enabled = true;
        txtPrice.Enabled = true;
        txtQuantity.Enabled = true;
        FileUpload1.Enabled = true;
        txtProducer.Enabled = true;
        txtWarranty.Enabled = true;
        txtDescription.Enabled = true;
        btnSearch.Enabled = false;
        btnUpdate.Enabled = true;
        btnCancel.Enabled = true;
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtProID.Text = GridView1.SelectedRow.Cells[1].Text.ToString();
        btnSearch_Click(sender, e);
        
    }
}
