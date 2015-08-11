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


public partial class UserControl_ReturnBillControl : System.Web.UI.UserControl
{
    SqlConnection con;
    SqlDataAdapter da;
    DataTable tb;
    List<string> column;
    
    static Label l;
    static String sql = "select * from ReturnBill";
    static String sqlsort = "";
    ReturnBill returnbill = new ReturnBill();
    
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["vdName"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["OSCConnection"].ConnectionString.ToString());
        column = new List<string>();
        FillDDList();
        DetailsViewBill.Visible = false;
        DetailsViewProduct.Visible = false;
        lbSort.Visible = true;
        DropDownList2.Visible = true;
        lbDetail1.Visible = false;
        //DDLDetail.Visible = false;
           
        if (!IsPostBack) {
            DropDownList1.SelectedIndex = 0;
            DropDownList2.SelectedIndex = 0;
            DropDownList3.Visible = false;
           
            returnbill.ConfirmStatus(GridView1);
            lbDetail.Visible = false;
            DDLDetail.Visible = false;   
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
                Label l = (Label)GridView1.SelectedRow.FindControl("LabelReturnBillID");


                String sql1 = String.Format("Update ReturnBill set IsConfirm = 'true' where ReturnID = '{0}'", l.Text);
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
        returnbill.ConfirmStatus(GridView1);

    }
    private void FillDDList(){
        if (DropDownList1.Items.Count <= 1)
        {
            try
            {
                con.Open();
                da = new SqlDataAdapter("select * from ReturnBill", con);
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
        lbDetail1.Visible = false;
        DetailsViewBill.Visible = false;
        DetailsViewProduct.Visible = false;
            
        lbDetail.Visible = false;
        DDLDetail.Visible = false;
        DropDownList2.SelectedIndex = 0;
        DropDownList3.SelectedIndex = 0;

        if (DropDownList1.SelectedValue.Equals("All"))
        {
            sql = string.Format("select * from ReturnBill");
            returnbill.FillData(sql,SqlDataSource2,GridView1);
            
        }
        else if (DropDownList1.SelectedValue.Equals("ReturnDate"))
        {
            try
            {
                sql = string.Format("select * from ReturnBill where ReturnDate = '{0}'", txtSearch.Text);
                returnbill.FillData(sql, SqlDataSource2, GridView1);
            }
            catch {
                MessageBox.Show("irrcorrect format mm/dd/yyyy");
                txtSearch.Focus();
            }
        }
        else if (DropDownList1.SelectedValue.Equals("IsPaid"))
        {
            try
            {
                bool status = bool.Parse(txtSearch.Text);
                sql = string.Format("select * from ReturnBill where IsPaid ='{0}' ", status);
               
            }
            catch {
                sql = "select * from ReturnBill where ReturnID = 'ga'";
            }
            returnbill.FillData(sql, SqlDataSource2, GridView1);
           
            
        }
        else if (DropDownList1.SelectedValue.Equals("IsDelivered"))
        {
            try
            {
                bool status = bool.Parse(txtSearch.Text);
                sql = string.Format("select * from ReturnBill where IsDelivered ='{0}' ", status);

            }
            catch
            {
                sql = "select * from ReturnBill where ReturnID = 'ga'";
            }
            returnbill.FillData(sql, SqlDataSource2, GridView1);


        }
        else {
            try
            {
                for (int i = 0; i < column.Count; i++)
                {
                    if (column[i].Equals(DropDownList1.SelectedValue.ToString()))
                    {
                        sql = string.Format("select * from ReturnBill where {0} = '{1}'", column[i].ToString(), txtSearch.Text);
                        returnbill.FillData(sql, SqlDataSource2, GridView1);

                    }
                }
            }
            catch {
                MessageBox.Show("irrcorrect format");
                txtSearch.Focus();
            }
        }
        returnbill.ConfirmStatus(GridView1);
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        lbDetail.Visible = true;
        DDLDetail.Visible = true;
        Label lbBill = (Label)GridView1.SelectedRow.FindControl("LabelBillID");
        Session["BillID"] = lbBill.Text;
        returnbill.ConfirmStatus(GridView1);
        l = (Label)GridView1.SelectedRow.FindControl("LabelReturnID");
        LinkButton lbutEdit = (LinkButton)GridView1.SelectedRow.FindControl("LinkButtonEdit");
        lbutEdit.Enabled = true;
        LinkButton lbutDel = (LinkButton)GridView1.SelectedRow.FindControl("LinkButtonDelete");
        lbutDel.Enabled = true;
        int t = GridView1.SelectedRow.RowIndex;
        Label ReturnID = (Label)GridView1.SelectedRow.FindControl("LabelReturnBillID");
        DetailsViewBill.Visible = false;
        DetailsViewProduct.Visible = false;
            
        
       

       
        DDLDetail.SelectedIndex = 0;

        lbDetail1.Visible = false;
        lbDetail.Visible = true;
        DDLDetail.Visible = true;
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        lbDetail.Visible = false;
        DDLDetail.Visible = false;
        DetailsViewBill.Visible = false;
        DetailsViewProduct.Visible = false;
            
        
        txtSearch.Text = "";
        lbWarning.Text = "";
        if (DropDownList1.SelectedValue.Equals("All"))
        {
            txtSearch.Visible = false;
            Calendar1.Visible = true;
            sql = string.Format("select * from ReturnBill");
            returnbill.FillData(sql, SqlDataSource2, GridView1);
            returnbill.ConfirmStatus(GridView1);
           
        }
        else if (DropDownList1.SelectedValue.Equals("ReturnDate"))
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
            returnbill.FillData(sqlsort, SqlDataSource2, GridView1);

        }
        else if (DropDownList3.SelectedIndex == 1)
        {
            sqlsort = sql + " order by " + DropDownList2.SelectedValue.ToString() + " " + DropDownList3.SelectedValue.ToString();
            returnbill.FillData(sqlsort, SqlDataSource2, GridView1);
        }
        returnbill.ConfirmStatus(GridView1);
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedValue.ToString().Equals("ReturnDate"))
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
        DropDownList ddl = (DropDownList)GridView1.Rows[GridView1.EditIndex].FindControl("DropDownListProID");
        Session["ProID"] = ddl.Text;
        if (!CheckUpdate())
        {
            e.Cancel = true;
        }
        else {
            e.Cancel = false;
        }
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        lbSort.Visible = false;
        DropDownList2.Visible = false;
        DropDownList3.Visible = false;
        lbDetail.Visible = false;
        DDLDetail.Visible = false;
        e.NewEditIndex = 0;
        GridView1.EditIndex = e.NewEditIndex;
        sql = string.Format("select * from ReturnBill where ReturnID ='"+ l.Text+"'");
        returnbill.FillData(sql, SqlDataSource2, GridView1);
           
    }

    protected void DDLDetail_SelectedIndexChanged(object sender, EventArgs e)
    {
        String sqlDetail="";

        
         if (DDLDetail.SelectedValue.Equals("BillID"))
        {
            Label lbCus = (Label)GridView1.SelectedRow.FindControl("LabelBillID");
            sqlDetail = "select * from Bill where BillID = '" + lbCus.Text + "'";
            SqlDataSourceBill.SelectCommand = sqlDetail;
            SqlDataSourceBill.DataBind();
            DetailsViewBill.DataBind();
            DetailsViewBill.Visible = true;
            lbDetail1.Text = "Bill's details";
            lbDetail1.Visible = true;
            
            
        }
        else if (DDLDetail.SelectedValue.Equals("ProID"))
        {
            Label lbCus = (Label)GridView1.SelectedRow.FindControl("LabelProID");
            sqlDetail = "select * from Product where ProID = '" + lbCus.Text + "'";
            SqlDataSourceProduct.SelectCommand = sqlDetail;
            SqlDataSourceProduct.DataBind();
            DetailsViewProduct.DataBind();
            DetailsViewProduct.Visible = true;
            lbDetail1.Text = "Product's details";
            lbDetail1.Visible = true;
           

        }
        else if(DDLDetail.SelectedIndex == 0) {
            DetailsViewProduct.Visible = false;
            DetailsViewBill.Visible = false;
            
            lbDetail1.Visible = false;
        }
    }
    
    protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        DropDownList2.SelectedIndex = 0;
        DropDownList3.SelectedIndex = 0;
        DropDownList3.Visible = false;
    }
    private bool CheckUpdate() {

        TextBox qua = (TextBox)GridView1.Rows[GridView1.EditIndex].FindControl("TextBoxQuatity");
        int maxqua = 0;
        try{
            String sqlGetmaxqua = String.Format("select Quantity from Orders where BillID='{0}' and ProId='{1}' ",Session["BillID"].ToString(),Session["ProID"].ToString());
            con.Open();
            da  = new SqlDataAdapter(sqlGetmaxqua,con);
            DataTable tb= new DataTable();
            da.Fill(tb);
            con.Close();
            maxqua = Convert.ToInt32(tb.Rows[0][0].ToString());


        }catch{
            
        }
        try
        {
            Double qual = Convert.ToDouble(qua.Text);
            if (qual <= 0 || qual> maxqua) {
                MessageBox.Show("Quantity must be greater than 0 and less than saled product 's quantity :"+ maxqua);
                qua.Focus();
                return false;
            }
            
        }
        catch {
            MessageBox.Show("Quantity must be a number");
            qua.Focus();
            return false;
        }
        return true;
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
