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

public partial class UserControl_ListProducts : System.Web.UI.UserControl
{
    GetDataSet objGetData = new GetDataSet();
    static int currentPage = 0;
    double b = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) 
        {
            if (Request.QueryString["kindid"] == null) 
            {
                lbInvisible.Text = "Data is empty.";
                lbInvisible.Visible = true;
            }
            GetData();
        }
    }
    public void GetData()
    {
        PagedDataSource objPage = new PagedDataSource();
        try
        {
            DataSet ds = new DataSet();
            ds = objGetData.getDatas(Request.QueryString["kindid"]);
            DataTable dt = new DataTable();
            dt = ds.Tables[0];           

            objPage.AllowPaging = true;
            objPage.DataSource = dt.DefaultView;
            objPage.PageSize = 9;
            objPage.CurrentPageIndex = currentPage;
            LinkButton1.Enabled = !objPage.IsFirstPage;
            LinkButton4.Enabled = !objPage.IsFirstPage;
            LinkButton2.Enabled = !objPage.IsLastPage;
            LinkButton3.Enabled = !objPage.IsLastPage;

            DataList1.RepeatColumns = 3;
            DataList1.DataSource = objPage;
            DataList1.DataBind();
            
            double a = ds.Tables[0].Rows.Count / objPage.PageSize;
            if (Math.Truncate(a) == a)
            {
                if (Math.Truncate(a) == 0)
                {
                    b = Math.Truncate(a) + 1;                   
                }
                else 
                {
                    b = Math.Truncate(a) + 1;                    
                }
                lbCurrent.Text = Convert.ToString(currentPage + 1);   
            }
            else
            {
                b = Math.Truncate(a) + 1;
                lbCurrent.Text = Convert.ToString(currentPage + 1);
            }
            lbTotal.Text = b.ToString();

        }
        catch (Exception ex)
        {

        }
        finally
        {
            objPage = null;
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        currentPage -= 1;
        GetData();
    }
    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        currentPage = 0;
        GetData();
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        currentPage += 1;
        GetData();
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        currentPage = Convert.ToInt32(b - 1);
        GetData();
    }
}
