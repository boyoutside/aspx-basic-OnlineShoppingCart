using System;
using System.Data;
using System.Configuration;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Text;


public partial class UserControl_OrderControl : System.Web.UI.UserControl
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataAdapter da;
    DataTable tb;
    List<string> column;
    static int index1 = 0;
    static int index2 = 0;
    static string BillIDString;
    static String sql = "select * from Orders";
    static String sqlsort = "";
    static bool pback = false;
    Order order = new Order();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["vdName"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["OSCConnection"].ConnectionString.ToString());
        
        column = new List<string>();
        FillDDList();
        if (!IsPostBack) {
            
            DropDownList1.SelectedIndex = 0;
            DropDownList2.SelectedIndex = 0;
            DropDownList3.Visible = false;
            //GridView1.Columns.Add("Confirm");
            //GridView1.Columns[10].ControlStyle(LinkButton);
            order.ConfirmStatus(GridView1);
            lbDetail.Visible = false;
            DDLDetail.Visible = false;
            lbDetail1.Visible = false;
            DetailsViewCustomer.Visible = false;
            DetailsViewBill.Visible = false;
            DetailsViewProduct.Visible = false;
            DetailsViewPay.Visible = false;
            DetailsViewTrans.Visible = false;
            txtSearch.Visible = false;           
       }
        
    }
    protected void btnConfirm(object sender, EventArgs e)
    {
        
        CheckBox ckStatus = (CheckBox)GridView1.SelectedRow.FindControl("CheckBox1");
        if (ckStatus.Checked == true)
        {
            MessageBox.Show("Can not change this data's IsConfirm  status !");
        }
        else
        {
           
            try
            {
                Label l = (Label)GridView1.SelectedRow.FindControl("LabelOrderID");
                String sql1 = String.Format("Update Orders set IsConfirm = 'true' where OrderID = '{0}'", l.Text);
                SqlCommand cmd = new SqlCommand(sql1, con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                if (sqlsort.Equals(""))
                {
                    SqlDataSource2.SelectCommand = sql;
                }
                else
                {
                    SqlDataSource2.SelectCommand = sqlsort;
                }
                SqlDataSource2.DataBind();
                GridView1.DataBind();

            }
            catch
            {

            }
        }
        order.ConfirmStatus(GridView1);

    }
    private void FillDDList(){
        if (DropDownList1.Items.Count <= 1) {
            try
            {
                con.Open();
                da = new SqlDataAdapter("select * from Orders", con);
                tb = new DataTable();
                da.Fill(tb);


                for (int i = 0; i < tb.Columns.Count; i++)
                {
                    column.Add(tb.Columns[i].ColumnName.ToString());
                    DropDownList1.Items.Add(column[i]);
                    DropDownList2.Items.Add(column[i]);
                }

                con.Close();
            }
            catch (SqlException e)
            {
                Response.Write(e.Message);
            }
        
        }
        
        
       
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        DetailsViewCustomer.Visible = false;
        DetailsViewBill.Visible = false;
        DetailsViewProduct.Visible = false;
        DetailsViewPay.Visible = false;
        DetailsViewTrans.Visible = false;
        lbDetail.Visible = false;
        DDLDetail.Visible = false;
        lbDetail1.Visible = false;
        DropDownList2.SelectedIndex = 0;
        DropDownList3.SelectedIndex = 0;
        DropDownList3.Visible = false;

        if (DropDownList1.SelectedValue.Equals("All"))
        {
            sql = string.Format("select * from Orders");
            order.FillData(sql,SqlDataSource2,GridView1);
            
        }
        else if (DropDownList1.SelectedValue.Equals("OrderDate"))
        {
            try
            {
                sql = string.Format("select * from Orders where OrderDate = '{0}'", txtSearch.Text);
                order.FillData(sql, SqlDataSource2, GridView1);
            }
            catch {
                MessageBox.Show("ircorrect format (mm/dd/yyyy)");
                txtSearch.Focus();
            }
        }
        else if (DropDownList1.SelectedValue.Equals("IsConfirm"))
        {
            try
            {
                bool status = bool.Parse(txtSearch.Text);
                sql = string.Format("select * from Orders where IsConfirm ='{0}' ", status);
               
            }
            catch {
                sql = "select * from Orders where OrderID = 'ga'";
            }
            order.FillData(sql, SqlDataSource2, GridView1);
           
            
        }
        else {

            try
            {
                sql = string.Format("select * from Orders where {0} = '{1}'", DropDownList1.SelectedValue.ToString(), txtSearch.Text);
                order.FillData(sql, SqlDataSource2, GridView1);
            }
            catch {
                MessageBox.Show("irrcorrect format");
                txtSearch.Focus();
            }   
                
            }
        
        order.ConfirmStatus(GridView1);
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        int i = GridView1.SelectedIndex;
        order.ConfirmStatus(GridView1);
        LinkButton bDel = (LinkButton)GridView1.Rows[i].FindControl("LinkButton2");
        bDel.Enabled = true;
        Button bCon = (Button)GridView1.Rows[i].FindControl("btnConfirm");
        bCon.Enabled = true;
        Label lbBillID = (Label)GridView1.Rows[i].FindControl("LabelBillID");
        BillIDString = lbBillID.Text;
        DDLDetail.SelectedIndex = 0;
        DetailsViewCustomer.Visible = false;
        DetailsViewBill.Visible = false;
        DetailsViewProduct.Visible = false;
        DetailsViewPay.Visible = false;
        DetailsViewTrans.Visible = false;
        lbDetail.Visible = true;
        DDLDetail.Visible = true;
        lbDetail1.Visible = false;
        //lbWarning.Text = BillIDString;
        //lbWarning.Visible = true;
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        index1 = DropDownList1.SelectedIndex;
        lbDetail.Visible = false;
        lbDetail1.Visible = false;
        DDLDetail.Visible = false;
        DetailsViewCustomer.Visible = false;
        DetailsViewBill.Visible = false;
        DetailsViewProduct.Visible = false;
        txtSearch.Text = "";
        lbWarning.Text = "";
        if (DropDownList1.SelectedValue.Equals("All"))
        {
            txtSearch.Visible = false;
            Calendar1.Visible = true;
            sql = string.Format("select * from Orders");
            order.FillData(sql, SqlDataSource2, GridView1);
            order.ConfirmStatus(GridView1);
            DropDownList2.SelectedIndex = 0;
            DropDownList3.SelectedIndex = 0;
            DropDownList3.Visible = false;
        }
        else if (DropDownList1.SelectedValue.Equals("OrderDate"))
        {
            txtSearch.Visible = true;
            Calendar1.Visible = true;
            lbWarning.Text = "Choose value on calendar or type mm/dd/yyyy";
            
        }
        else if (DropDownList1.SelectedValue.Equals("IsConfirm"))
        {
            txtSearch.Visible = true;
            Calendar1.Visible = true;
            lbWarning.Text = "true or false";
        }
        else
        {
            txtSearch.Visible = true;
            Calendar1.Visible = true;
            
        }
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        index2 = DropDownList2.SelectedIndex;
        if (DropDownList2.SelectedIndex == 0) {
            DropDownList3.Visible = false;
        }
        else{
            DropDownList3.Visible = true; 
        }
    }
    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(DropDownList3.SelectedIndex == 0){
            sqlsort = sql + " order by " + DropDownList2.SelectedValue.ToString() + " " + DropDownList3.SelectedValue.ToString() ;
            order.FillData(sqlsort, SqlDataSource2, GridView1);

        }
        else if (DropDownList3.SelectedIndex == 1)
        {
            sqlsort = sql + " order by " + DropDownList2.SelectedValue.ToString() + " " + DropDownList3.SelectedValue.ToString();
            order.FillData(sqlsort, SqlDataSource2, GridView1);
        }
        order.ConfirmStatus(GridView1);
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedValue.ToString().Equals("OrderDate"))
        {
            txtSearch.Text = Calendar1.SelectedDate.ToShortDateString();
        }
        else { 
          
        }
    }
    protected void txtSearch_TextChanged(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        sql = string.Format("select * from Orders ");
        order.FillData(sql, SqlDataSource2, GridView1);
           
    }

    protected void DDLDetail_SelectedIndexChanged(object sender, EventArgs e)
    {
        String sqlDetail="";

        if(DDLDetail.SelectedValue.Equals("Customer")){
            lbDetail1.Text = "Customer's detail";
            lbDetail1.Visible = true;
            Label lbCus = (Label)GridView1.SelectedRow.FindControl("LabelCusID");
            sqlDetail = "select * from Customer where CusID = '" + lbCus.Text + "'";
            SqlDataSourceCustomer.SelectCommand = sqlDetail;
            SqlDataSourceCustomer.DataBind();
            DetailsViewCustomer.DataBind();
            DetailsViewCustomer.Visible = true;
            DetailsViewBill.Visible = false;
            DetailsViewProduct.Visible = false;
            DetailsViewPay.Visible = false;
            DetailsViewTrans.Visible = false;

           
        }
        else if (DDLDetail.SelectedValue.Equals("Bill"))
        {
            lbDetail1.Text = "Bill's detail";
            lbDetail1.Visible = true;
            Label lbCus = (Label)GridView1.SelectedRow.FindControl("LabelBillID");
            sqlDetail = "select * from Bill where BillID = '" + lbCus.Text + "'";
            SqlDataSourceBill.SelectCommand = sqlDetail;
            SqlDataSourceBill.DataBind();
            DetailsViewBill.DataBind();
            DetailsViewCustomer.Visible = false;
            DetailsViewBill.Visible = true;
            DetailsViewProduct.Visible = false;
            DetailsViewPay.Visible = false;
            DetailsViewTrans.Visible = false;
        }
        else if (DDLDetail.SelectedValue.Equals("Product"))
        {
            lbDetail1.Text = "Product's detail";
            lbDetail1.Visible = true;
            Label lbCus = (Label)GridView1.SelectedRow.FindControl("LabelProID");
            sqlDetail = "select * from Product where ProID = '" + lbCus.Text + "'";
            SqlDataSourceProduct.SelectCommand = sqlDetail;
            SqlDataSourceProduct.DataBind();
            DetailsViewProduct.DataBind();
            DetailsViewCustomer.Visible = false;
            DetailsViewBill.Visible = false;
            DetailsViewProduct.Visible = true;
            DetailsViewPay.Visible = false;
            DetailsViewTrans.Visible = false;
        }
        else if (DDLDetail.SelectedValue.Equals("Transportation"))
        {
            lbDetail1.Text = "Transportation's detail";
            lbDetail1.Visible = true;
            Label lbCus = (Label)GridView1.SelectedRow.FindControl("LabelTraID");
            sqlDetail = "select * from Transportation where TransID = '" + lbCus.Text + "'";
            SqlDataSourceTrans.SelectCommand = sqlDetail;
            SqlDataSourceTrans.DataBind();
            DetailsViewTrans.DataBind();
            DetailsViewCustomer.Visible = false;
            DetailsViewBill.Visible = false;
            DetailsViewProduct.Visible = false;
            DetailsViewPay.Visible = false;
            DetailsViewTrans.Visible = true;
        }
        else if (DDLDetail.SelectedValue.Equals("Payment"))
        {
            lbDetail1.Text = "Payment's detail";
            lbDetail1.Visible = true;
            Label lbCus = (Label)GridView1.SelectedRow.FindControl("LabelPayID");
            sqlDetail = "select * from Payment where PayID = '" + lbCus.Text + "'";
            SqlDataSourcePay.SelectCommand = sqlDetail;
            SqlDataSourcePay.DataBind();
            DetailsViewPay.DataBind();
            DetailsViewCustomer.Visible = false;
            DetailsViewBill.Visible = false;
            DetailsViewProduct.Visible = false;
            DetailsViewPay.Visible = true;
            DetailsViewTrans.Visible = false;
        }
        else if(DDLDetail.SelectedIndex == 0) {
            lbDetail1.Visible = false;
            DetailsViewCustomer.Visible = false;
            DetailsViewBill.Visible = false;
            DetailsViewProduct.Visible = false;
            DetailsViewPay.Visible = false;
            DetailsViewTrans.Visible = false;
        }
    }
    
 

    protected bool Check()
    {
        CheckBox ckStatus = (CheckBox)GridView1.SelectedRow.FindControl("CheckBox1");
        if (ckStatus.Checked == true)
        {
            MessageBox.Show("Can not delete this data !");
            return true;
        }
        else
        {
            return false;
        }
    }
    protected void GridView1_RowDeleting1(object sender, GridViewDeleteEventArgs e)
    {
        if (Check())
        {
            e.Cancel = true;

        }
        else
        {
           // UpdateBill();
        }
        

    }
    private void UpdateBill() {
        int total = 0;
        try
        {
            String sqlSum = "select sum(Quantity * Amount) as Total from Orders where BillID ='" + BillIDString+ "'";
            con.Open();
            cmd = new SqlCommand(sqlSum, con);
            SqlDataReader rd = cmd.ExecuteReader() ;
            if (rd.HasRows) {
                rd.Read();
                try
                {
                    total = Convert.ToInt32(rd.GetValue(0).ToString());
                }
                catch {
                    total = 0;
                }
            }
            //da = new SqlDataAdapter(sqlSum, con);
            //tb = new DataTable();
            //da.Fill(tb);
            //total = Int32.Parse(tb.Rows[0][0].ToString());
            con.Close();
            con.Open();
            if (total == 0)
            {
                MessageBox.Show("This action will delete Bill which BillID = "+ BillIDString);
                String sqlDelBill = "Delete Bill where BillID ='" + BillIDString + "'";
                cmd = new SqlCommand(sqlDelBill, con);
                cmd.ExecuteNonQuery();
            }
            else
            {
                String sqlUpdateBill = "Update Bill set Total =" + total + " where BillID ='" + BillIDString + "'";
                cmd = new SqlCommand(sqlUpdateBill, con);
                cmd.ExecuteNonQuery();
            }
            con.Close();
        }
        catch (SqlException e){
            MessageBox.Show(e.Message);
        }
      
    }

    protected void GridView1_RowDeleted1(object sender, GridViewDeletedEventArgs e)
    {
        UpdateBill();
    }
    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            // when mouse is over the row, save original color to new attribute, and change it to highlight yellow color
            e.Row.Attributes.Add("onmouseover",

          "this.originalstyle=this.style.backgroundColor;this.style.backgroundColor='#00CED1'");

            // when mouse leaves the row, change the bg color to its original value   

            e.Row.Attributes.Add("onmouseout",

            "this.style.backgroundColor=this.originalstyle;");
        }
    }
}
