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

public partial class UserControl_InsertProductUserControl : System.Web.UI.UserControl
{
    String connectString = "";
    String ProdID = "";

    String path = "";
    String picPath = "";
    String file = "";
    String regex = "";
    bool ketqua;

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
        String key = auto.RandomNumber(5);
        ProdID = "PR" + key;
    }
    private bool getFile()
    {
        if (FileUpload1.HasFile == false)
        {
            picPath = "~/DataUpload/";
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

    protected void btnInsert_Click(object sender, EventArgs e)
    {
        do
        {
            CreateKey();
        } while (ke.ProID(ProdID));
        if (getFile())
        {
            String SqlRegisterPro = "EXEC InsertProduct @proid,@proname,@kindid,@price,@quantity,@images,@producer,@warranty,@description";
            SqlConnection conn = new SqlConnection(connectString);
            SqlCommand comm = new SqlCommand(SqlRegisterPro, conn);

            //Add Parameter Product ID
            SqlParameter paramProID = new SqlParameter("@proid", SqlDbType.NVarChar, 20);
            paramProID.Value = ProdID;
            comm.Parameters.Add(paramProID);

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
            paramImages.Value = picPath;
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
            txtProName.Text = "";
            DropKind.SelectedIndex = 0;
            txtPrice.Text = "";
            txtQuantity.Text = "";
            txtProducer.Text = "";
            txtWarranty.Text = "";
            txtDescription.Text = "";
            MessageBox.Show("Insert Product successful!!");
            //Response.Redirect("~/Admin/InsertProduct.aspx");
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/InsertProduct.aspx");
    }
    protected void DropKind_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["hdKind"] = DropKind.SelectedValue.ToString();
    }
}
