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


public partial class UserControl_BillControl : System.Web.UI.UserControl
{
    SqlConnection con;
    SqlDataAdapter da;
    SqlCommand cmd;
    DataTable tb;
    List<string> column;
    static int t = 0;
    static Label l;
    static String sql = "select * from Bill";
    static String sqlsort = "";
    Bill bill = new Bill();
    static bool check1 = false;
    static bool check2 = false;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["vdName"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
        con = new SqlConnection("server=.;database=ShoppingOnline;uid=sa;pwd=");
        column = new List<string>();
        //bill.IsReturnBill(sql, GridView1);
        //lbWarning.Text = sql;
        FillDDList();
        if (!IsPostBack) {
            
            DropDownList1.SelectedIndex = 0;
            DropDownList2.SelectedIndex = 0;
            lbSort.Visible = true;
            DropDownList2.Visible = true;
            DropDownList3.Visible = false;
            //GridView1.Columns.Add("Confirm");
            //GridView1.Columns[10].ControlStyle(LinkButton);
            bill.ConfirmStatus(GridView1);
            lbCusDetail.Visible = false;
            DetailsViewCustomer.Visible = false;
            
            txtSearch.Visible = false;
        }
        
    }
    protected void ConfirmReturn(object sender, EventArgs e)
    {
        Label lbBill = (Label)GridView1.SelectedRow.FindControl("LabelBillID");
        Session["tri_billid"] = lbBill.Text;
        Label lbDate = (Label)GridView1.SelectedRow.FindControl("LabelBillDate");
        DateTime date = Convert.ToDateTime(lbDate.Text);
        TimeSpan ts = new TimeSpan();
        DateTime now = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day);
        ts = now.Subtract(date);
        
            if (check1 == true && check2 == true)
            {
                if (ts.TotalDays <= 7)
                {
                    LinkButton lk1 = (LinkButton)GridView1.SelectedRow.FindControl("LinkButtonCreateReturn");
                    lk1.Visible = true;
                }
                else
                {
                    MessageBox.Show("This bill can not be returned because it's greater than 7 days validation");
                }
            }
            else {
                MessageBox.Show("This action's not supported for undelivered bill") ;
            }
        
        bill.ConfirmStatus(GridView1);

    }
    protected void CreateReturn(object sender, EventArgs e)
    {
        Label lbBill = (Label)GridView1.SelectedRow.FindControl("LabelBillID");
        String proid = "";
        String returnid = "";
        AutoGenerate auto = new AutoGenerate();
        KeyExist kex = new KeyExist();
        do
        {
            String num = auto.RandomNumber(5);
            returnid = "RET" + num;
        } while (kex.CheckID("ReturnBill", "ReturnID", returnid) == true);
        try {
            string sqlSelect = "Select ProID from Orders where BillID = '" + lbBill.Text + "'";
            da = new SqlDataAdapter(sqlSelect, con);
            DataTable tb = new DataTable();
            con.Open();
            da.Fill(tb);
            con.Close();
            proid = tb.Rows[0][0].ToString();
        }
        catch { }

        //DateTime today = new DateTime(DateTime.Now.Day,DateTime.Now.Year,DateTime.Now.Month);
        //today = DateTime.Now;
        String sqlInsert = String.Format( "insert into ReturnBill values('{0}','{1}','{2}','{3}','{4}','{5}')",returnid,proid,0,lbBill.Text,DateTime.Now.ToShortDateString(),"New");
        lbWarning.Text = sqlInsert;
        lbWarning.Visible = true;
        cmd = new SqlCommand(sqlInsert, con);
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            MessageBox.Show(" Successful !");
            Response.Redirect("ManageReturnBill.aspx");
        }
        catch (SqlException ex){
            
            MessageBox.Show("");
        }
    }
    private void FillDDList(){
        if (DropDownList1.Items.Count <= 1)
        {
            try
            {
                con.Open();
                da = new SqlDataAdapter("select * from Bill", con);
                tb = new DataTable();
                da.Fill(tb);
                for (int i = 0; i < tb.Columns.Count; i++)
                {
                    column.Add(tb.Columns[i].ColumnName.ToString());
                    if (t == 0)
                    {
                        DropDownList1.Items.Add(column[i]);
                        DropDownList2.Items.Add(column[i]);

                    }
                    else
                    {

                    }
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
        lbCusDetail.Visible = false;
        DetailsViewCustomer.Visible = false;
        
        DropDownList2.SelectedIndex = 0;
        DropDownList3.SelectedIndex = 0;
        DropDownList3.Visible = false;

        if (DropDownList1.SelectedValue.Equals("All"))
        {
            sql = string.Format("select * from Bill");
            bill.FillData(sql,SqlDataSource2,GridView1);
            
        }
        
        else if (DropDownList1.SelectedValue.Equals("BillDate"))
        {
            lbWarning.Text = "Choose value on calendar or type mm/dd/yyyy";
            try
            {
                sql = string.Format("select * from Bill where BillDate = '{0}'", txtSearch.Text);
                bill.FillData(sql, SqlDataSource2, GridView1);
            }
            catch {
                MessageBox.Show("Ircorrect format(mm/dd/yyyy)");
            }
        }
        else if (DropDownList1.SelectedValue.Equals("IsPaid"))
        {
            try
            {
                bool status = bool.Parse(txtSearch.Text);
                sql = string.Format("select * from Bill where IsPaid ='{0}' ", status);
               
            }
            catch {
                sql = "select * from Bill where BillID = 'ga'";
            }
            bill.FillData(sql, SqlDataSource2, GridView1);
           
            
        }
        else if (DropDownList1.SelectedValue.Equals("IsDelivered"))
        {
            try
            {
                bool status = bool.Parse(txtSearch.Text);
                sql = string.Format("select * from Bill where IsDelivered ='{0}' ", status);

            }
            catch
            {
                sql = "select * from Bill where BillID = 'ga'";
            }
            bill.FillData(sql, SqlDataSource2, GridView1);


        }
        else {
            try
            {
                sql = string.Format("select * from Bill where {0} = '{1}'", DropDownList1.SelectedValue.ToString(), txtSearch.Text);
                bill.FillData(sql, SqlDataSource2, GridView1);
            }
            catch {
                MessageBox.Show("Irrcorrect format");
                txtSearch.Focus();
            }   
               
            
        }
        bill.ConfirmStatus(GridView1);
        //bill.IsReturnBill(sql, GridView1);
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        int t = GridView1.SelectedRow.RowIndex;
        l = (Label)GridView1.SelectedRow.FindControl("LabelBillID");
        CheckBox ck1 =(CheckBox) GridView1.SelectedRow.FindControl("CheckBox1");
        CheckBox ck2 =(CheckBox) GridView1.SelectedRow.FindControl("CheckBox2");
        check1 = ck1.Checked;
        check2 = ck2.Checked;
        bill.ConfirmStatus(GridView1);
        LinkButton lk = (LinkButton)GridView1.SelectedRow.FindControl("LinkButtonEdit");
        lk.Enabled = true;
        LinkButton lk1 = (LinkButton)GridView1.SelectedRow.FindControl("LinkButtonReturn");
        lk1.Enabled = true;
       
        
        //Button btt = (Button)GridView1.Rows[t].FindControl("btnConfirm");
        //btt.Enabled = true;

        Label lbCus = (Label)GridView1.SelectedRow.FindControl("LabelCusID");
        String sqlDetail = "select * from Customer where CusID = '" + lbCus.Text + "'";
        SqlDataSourceCustomer.SelectCommand = sqlDetail;
        SqlDataSourceCustomer.DataBind();
        DetailsViewCustomer.DataBind();
        lbCusDetail.Visible = true;
        DetailsViewCustomer.Visible = true;

        //bill.IsReturnBill(sql, GridView1);
        
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        lbCusDetail.Visible = false;
        DetailsViewCustomer.Visible = false;
        
        txtSearch.Text = "";
        lbWarning.Text = "";
        if (DropDownList1.SelectedValue.Equals("All"))
        {
            txtSearch.Visible = false;
            Calendar1.Visible = true;
            sql = string.Format("select * from Bill");
            bill.FillData(sql, SqlDataSource2, GridView1);
            bill.ConfirmStatus(GridView1);
            DropDownList2.SelectedIndex = 0;
            DropDownList3.SelectedIndex = 0;
            DropDownList3.Visible = false;
        }
        else if (DropDownList1.SelectedValue.Equals("BillDate"))
        {
            txtSearch.Visible = true;
            Calendar1.Visible = true;
            lbWarning.Text = "Choose value on calendar or type mm/dd/yyyy";
            
        }
        else if (DropDownList1.SelectedValue.Equals("IsPaid") || DropDownList1.SelectedValue.Equals("IsDelivered"))
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
        //bill.IsReturnBill(sql, GridView1);
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
            bill.FillData(sqlsort, SqlDataSource2, GridView1);

        }
        else if (DropDownList3.SelectedIndex == 1)
        {
            sqlsort = sql + " order by " + DropDownList2.SelectedValue.ToString() + " " + DropDownList3.SelectedValue.ToString();
            bill.FillData(sqlsort, SqlDataSource2, GridView1);
        }
        bill.ConfirmStatus(GridView1);
        
        //bill.IsReturnBill(sqlsort, GridView1);
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedValue.ToString().Equals("BillDate"))
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
        if (!CheckUpdate()) {
            e.Cancel = true;
        }
        //bill.IsReturnBill(sql, GridView1);
        //lbWarning.Text = sql;
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        e.NewEditIndex = 0;
        GridView1.EditIndex = e.NewEditIndex;
        
        sql = string.Format("select * from Bill where BillID = '" + l.Text + "'");        
        bill.FillData(sql, SqlDataSource2, GridView1);
        DropDownList2.Visible = false;
        lbSort.Visible = false;
        
        //bill.IsReturnBill(sql, GridView1);
        //lbWarning.Text = sql;
       
    }

    protected void SqlDataSource2_Updating(object sender, SqlDataSourceCommandEventArgs e)
    {
       
    }
    private bool CheckUpdate() {
        CheckBox ck1 = (CheckBox)GridView1.Rows[GridView1.EditIndex].FindControl("CheckBox1");
        CheckBox ck2 = (CheckBox)GridView1.Rows[GridView1.EditIndex].FindControl("CheckBox2");
        TextBox total = (TextBox)GridView1.Rows[GridView1.EditIndex].FindControl("TextBoxTotal");
        if (check1 == true && ck1.Checked == false  ) {
            MessageBox.Show("Can not uncheck this IsPaid ");
            return false;
        }
        else if( check2 == true && ck2.Checked == false ){
            MessageBox.Show("Can not uncheck this IsDelivered ");
            return false;
        }
        else if ( ck2.Checked == true && ck1.Checked == false )
        {
            MessageBox.Show("Can not check IsDelivered when IsPaid is not checked");
            return false;
        }
       
        return true;
    }


    protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {

    }
    
    protected void GridView1_RowCreated1(object sender, GridViewRowEventArgs e)
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