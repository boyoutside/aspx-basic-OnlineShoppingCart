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

public partial class UserControl_ViewProducts : System.Web.UI.UserControl
{
    GetDataSet objGet = new GetDataSet();
    static int CurrentPage = 0;
    double b = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        GetData();    
    }
    public void GetData()
    {
        PagedDataSource objPage = new PagedDataSource();
        try
        {
            DataSet ds = new DataSet();
            ds = objGet.getData("Product");
            DataTable dt = new DataTable();
            dt = ds.Tables[0];

            //DataView dv = new DataView(dt);
            //dv.RowFilter = "productID = 1 and " ;

            objPage.AllowPaging = true;
            objPage.DataSource = dt.DefaultView;
            objPage.PageSize = 9;
            objPage.CurrentPageIndex = CurrentPage;
            LinkButton1.Enabled = !objPage.IsFirstPage;
            LinkButton4.Enabled = !objPage.IsFirstPage;
            LinkButton2.Enabled = !objPage.IsLastPage;
            LinkButton3.Enabled = !objPage.IsLastPage;

            DataList1.RepeatColumns = 3;
            DataList1.DataSource = objPage;
            DataList1.DataBind();
            lbCurrent.Text = Convert.ToString(CurrentPage + 1);
            double a = ds.Tables[0].Rows.Count / objPage.PageSize;
            if (Math.Truncate(a) == a)
            {
                b = Math.Truncate(a);
            }
            else 
            {
                b = Math.Truncate(a) + 1;
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
    //protected void bPre_Click(object sender, EventArgs e)
    //{
    //    CurrentPage -= 1;
    //    GetData();
    //}
    //protected void bNext_Click(object sender, EventArgs e)
    //{
    //    CurrentPage += 1;
    //    GetData();
    //}
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        CurrentPage -= 1;
        GetData();
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        CurrentPage += 1;
        GetData();
    }
    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        CurrentPage = 0;
        GetData();
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        CurrentPage = Convert.ToInt32(b - 1);
        GetData();
    }
}
