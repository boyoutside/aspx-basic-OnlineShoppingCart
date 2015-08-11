using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Threading;

public partial class UserControl_CartItem : System.Web.UI.UserControl
{
    Products objPro = new Products();
    GetDataSet objGetData = new GetDataSet();
    bool check = true;
    TextBox txt;
    AutoGenerate objAuto = new AutoGenerate();
    KeyExist objKE = new KeyExist();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        
        if (!IsPostBack)
        {            
            if (Request.QueryString["id"] == null)
            {
                //ViewCart();
                //TotalPay();
                Response.Redirect("Home.aspx");
            }
            else
            {
                String sID = Request.QueryString["id"].ToString();
                objPro.proID = sID;
                ArrayList arr = null;
                if (Session["Cart"] != null)
                {
                    arr = (ArrayList)Session["Cart"];
                }
                else
                {
                    arr = new ArrayList();
                }
                String sName = objGetData.ProductName(objPro);
                double sPrice = objGetData.ProductPrice(objPro);
                double sTotal;
                bool available = false;
                try
                {
                    foreach (SCartItems item in arr)
                    {
                        if (item.proID == sID)
                        {
                            item.quantity += 1;
                            item.total = sPrice * item.quantity;
                            available = true;
                        }
                    }
                    if (available == false)
                    {
                        int sl = 1;
                        sTotal = sPrice * sl;
                        SCartItems item = new SCartItems(sID, sName, sl, sPrice, sTotal);
                        arr.Add(item);
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
                Session["Cart"] = arr;
                ViewCart();
                TotalPay();
            }
        }
    }
    //View Cart
    void ViewCart()
    {        
        ArrayList arr = (ArrayList)Session["Cart"];        
        int count = 0;
        foreach (SCartItems item in arr) 
        {
            count += item.quantity;
        }
        lbCount.Text = count.ToString();
        GridView1.DataSource = arr;
        GridView1.DataBind();
    }
    void TotalPay()
    {
        //Get total payment
        double tp = 0;
        ArrayList arr = (ArrayList)Session["Cart"];
        foreach (SCartItems item in arr)
        {
            tp = tp + item.quantity * item.price;
        }
        lbTotal.Text = tp.ToString();
    }
   //Process cart 
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        String temp = e.CommandArgument.ToString();       
        if (e.CommandName == "Xoa")
        {
            ArrayList arr = (ArrayList)Session["Cart"];
            int i = 0;
            foreach (SCartItems item in arr)
            {
                if (item.proID == temp)
                {
                    arr.RemoveAt(i);
                    Session["Cart"] = arr;
                    ViewCart();
                    TotalPay();
                    return;
                }
                else
                {
                    i += 1;
                }
            }
        }
        else
        {
            if (e.CommandName == "Sua")
            {
                ArrayList arr = (ArrayList)Session["Cart"];
                int i = 0;
                foreach (SCartItems item in arr)
                {
                    int c = 0;
                    if (item.proID == temp)
                    {
                        objPro.proID = temp;
                        int slsp = objGetData.ProductQuantity(objPro);
                        txt = (TextBox)GridView1.Rows[i].Cells[2].FindControl("TextBox1");                        
                        try
                        {
                            c = Int32.Parse(txt.Text);
                            if (c > 0 && c <= slsp)
                            {
                                item.quantity = c;
                                item.total = item.quantity * item.price;
                                ViewCart();
                                TotalPay();
                                check = true;
                                Button1.Enabled = true;
                                return;
                            }
                            else 
                            {
                                check = false;
                                txt.Focus();
                                Button1.Enabled = false;
                                MessageBox.Show("Quantity must be greater than 0 and less than " + slsp.ToString() + ".");
                            }    
                        }
                        catch 
                        {
                            check = false;
                            txt.Focus();
                            Button1.Enabled = false;
                            MessageBox.Show("Quantity must be positive number.");
                        }                                                                    
                    }
                    else
                    {
                        i += 1;                        
                    }
                }
            }           
        }        
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //Begin order
        if (check)
        {
            getInformation();
            Panel2.Visible = false;

        }
        else
        {
            ArrayList arr = (ArrayList)Session["Cart"];
            if (arr.Count == 0)
            {
                MessageBox.Show("Your cart is empty.");
            }
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //Clear cart
        ArrayList arr = (ArrayList)Session["Cart"];
        arr.Clear();        
        ViewCart();
        lbTotal.Text = "0.00";
        lbCount.Text = "0";
    }
    public void getInformation() 
    {
        //Check user login
        if (Session["vdName"] == null)
        {
            //User have not yet login
            Response.Redirect("Login.aspx");
        }
        else
        {
            //User have login and check again information
            viewInfo();
            getDDL1();
            getDDL2();
            Panel1.Visible = true;
            ArrayList arr = (ArrayList)Session["Cart"];
            double tp = 0;
            foreach (SCartItems item in arr)
            {
                tp = tp + item.quantity * item.price;
            }
            lbTotalView.Text = tp.ToString();
            GridView2.DataSource = arr;
            GridView2.DataBind();
        }
    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        TextBox abc = (TextBox)sender;
        Session["abc"] = abc.ToString();
    }
    public void getDDL1() 
    {
        //Get Transportation
        DataSet ds = new DataSet();
        ds = objGetData.getData("Transportation");

        DropDownList1.DataValueField = "TransID";
        DropDownList1.DataTextField = "TransName";
        DropDownList1.DataSource = ds.Tables[0];
        DropDownList1.DataBind();
        DropDownList1.Items.Insert(0, "Please select..."); 
    }
    public void getDDL2()
    {
        //Get Payment
        DataSet ds = new DataSet();
        ds = objGetData.getData("Payment");

        DropDownList2.DataValueField = "PayID";
        DropDownList2.DataTextField = "Payment";
        DropDownList2.DataSource = ds.Tables[0];
        DropDownList2.DataBind();
        DropDownList2.Items.Insert(0, "Please select...");
    }
    public void viewInfo() 
    {
        //Get Customer Information
        DataSet ds = new DataSet();
        ds = objGetData.getView("GetCustomer", Session["vdName"].ToString());
        DataTable dt = new DataTable();
        dt = ds.Tables[0];
        GridView3.DataSource = dt;
        GridView3.DataBind();
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //Get value from dropdownlist
        Session["hdTrans"] = DropDownList1.SelectedValue.ToString();
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        //Get value from dropdownlist
        Session["payment"] = DropDownList2.SelectedValue.ToString();         
    }    
    protected void bCancel_Click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        Panel2.Visible = true;
    }

    protected void bSubmit_Click(object sender, EventArgs e)
    {
        if (Session["submit"] == null)
        {
            Session["submit"] = 1;

            if (Session["hdTrans"] != null)
            {
                if (Session["payment"] != null)
                {
                    double tp = 0;
                    ArrayList arr = (ArrayList)Session["Cart"];
                    foreach (SCartItems item in arr)
                    {
                        tp = tp + item.quantity * item.price;
                    }
                    //Create BillID consist of 8 digits
                    String str = "";
                    do
                    {
                        str = "BIL" + objAuto.RandomNumber(5).ToString();
                    } while (objKE.CheckID("Bill", "BillID", str));

                    Session["hdBillID"] = str;

                    String sql = "Exec InsertBill @billid,@cusid,@total,@billdate,@ispaid,@isdelivered";
                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OSCConnection"].ConnectionString);
                    SqlCommand comm = new SqlCommand(sql, conn);

                    //Add Parameter BillID
                    SqlParameter prBillid = new SqlParameter("@billid", SqlDbType.NVarChar, 20);
                    prBillid.Value = str;
                    comm.Parameters.Add(prBillid);

                    //Add Parameter CusID
                    SqlParameter prCusID = new SqlParameter("@cusid", SqlDbType.NVarChar, 20);
                    prCusID.Value = Session["vdCusID"].ToString();
                    comm.Parameters.Add(prCusID);

                    //Add Parameter total
                    SqlParameter prTotal = new SqlParameter("@total", SqlDbType.Float);
                    prTotal.Value = tp.ToString();
                    comm.Parameters.Add(prTotal);

                    //Add Parameter Bill Date
                    SqlParameter prDate = new SqlParameter("@billdate", SqlDbType.DateTime);
                    prDate.Value = DateTime.Now.ToShortDateString().ToString();
                    comm.Parameters.Add(prDate);

                    //Add Parameter Ispaid
                    SqlParameter prPaid = new SqlParameter("@ispaid", SqlDbType.Bit);
                    prPaid.Value = "False";
                    comm.Parameters.Add(prPaid);

                    //Add Parameter Isdelivered
                    SqlParameter prDeli = new SqlParameter("@isdelivered", SqlDbType.Bit);
                    prDeli.Value = "False";
                    comm.Parameters.Add(prDeli);
                    try
                    {
                        conn.Open();
                        comm.ExecuteNonQuery();
                        ProcessOrder();
                        arr.Clear();
                        Session["Cart"] = arr;
                        Response.Redirect("OrderSucceed.aspx");
                    }
                    catch
                    {
                        conn.Close();
                    }
                    finally
                    {
                        conn.Close();
                    }
                }
                else
                {
                    MessageBox.Show("Please select Payment.");
                    Panel1.Visible = true;
                }
            }
            else
            {
                MessageBox.Show("Please select Transportation.");
                Panel1.Visible = true;
            }
        }
      
        
        else
        {
            Session.Remove("submit");
            Response.Redirect("Home.aspx");
        }
    }
    //Process order
    public void ProcessOrder() 
    {
        //Insert table Orders
        ArrayList arr = (ArrayList)Session["Cart"];
        foreach (SCartItems item in arr) 
        {
            //Create OrderID consist of 16 digit (First digit is Transportation type, 7 digits is Product ID, 8 digits is Order)
            String hdOrderID = "";
            do
            {
                hdOrderID = Session["hdTrans"].ToString() + item.proID.ToString() + objAuto.RandomNumber(8).ToString();
            } while (objKE.CheckID("Orders", "OrderID", hdOrderID));

            String sql = "Exec InsertOrders @orderid,@billid,@cusid,@proid,@quantity,@amount,@payid,@transid,@orderdate,@isconfirm";            
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OSCConnection"].ConnectionString);
            SqlCommand comm = new SqlCommand(sql, conn);

            //Add parameter OrderID
            SqlParameter prOrderID = new SqlParameter("@orderid", SqlDbType.NVarChar, 20);
            prOrderID.Value = hdOrderID;
            comm.Parameters.Add(prOrderID);

            //Add parameter BillID
            SqlParameter prBillid = new SqlParameter("@billid", SqlDbType.NVarChar, 20);
            prBillid.Value = Session["hdBillID"].ToString();
            comm.Parameters.Add(prBillid);

            //Add Parameter CusID
            SqlParameter prCusID = new SqlParameter("@cusid", SqlDbType.NVarChar, 20);
            prCusID.Value = Session["vdCusID"].ToString();
            comm.Parameters.Add(prCusID);

            //Add Parameter ProID
            SqlParameter prProID = new SqlParameter("@proid", SqlDbType.NVarChar, 20);
            prProID.Value = item.proID.ToString();
            comm.Parameters.Add(prProID);

            //Add Parameter Quantity
            SqlParameter prQuantity = new SqlParameter("@quantity", SqlDbType.Int);
            prQuantity.Value = item.quantity.ToString();
            comm.Parameters.Add(prQuantity);

            //Add Parameter Amount
            SqlParameter prAmount = new SqlParameter("@amount", SqlDbType.Float);
            prAmount.Value = item.total.ToString();
            comm.Parameters.Add(prAmount);

            //Add Parameter PayID
            SqlParameter prPayID = new SqlParameter("@payid", SqlDbType.Int);
            prPayID.Value = Session["payment"].ToString();
            comm.Parameters.Add(prPayID);

            //Add Parameter TransID
            SqlParameter prTransID = new SqlParameter("@transid", SqlDbType.Int);
            prTransID.Value =  Session["hdTrans"].ToString();
            comm.Parameters.Add(prTransID);

            //Add Parameter Order Date
            SqlParameter prDate = new SqlParameter("@orderdate", SqlDbType.DateTime);
            prDate.Value = DateTime.Now.ToShortDateString().ToString();
            comm.Parameters.Add(prDate);

            //Add Parameter IsConfirm
            SqlParameter prIsConfrim = new SqlParameter("@isconfirm", SqlDbType.Bit);
            prIsConfrim.Value = "False";
            comm.Parameters.Add(prIsConfrim);

            try
            {
                conn.Open();
                comm.ExecuteNonQuery();                
            }
            catch
            { 
                conn.Close(); 
            }
            finally 
            {
                conn.Close();
            }
            //Insert Quantity of table Product
            objPro.proID = item.proID;
            int quan = objGetData.ProductQuantity(objPro) - item.quantity;
            SqlCommand comm2 = new SqlCommand("Update Product set Quantity = " + quan + " where ProID ='" + item.proID + "'", conn);
            try
            {
                conn.Open();
                comm2.ExecuteNonQuery();
            }
            catch
            {
                conn.Close();
            }
            finally 
            {
                conn.Close();
            }
        }
    }    
}
