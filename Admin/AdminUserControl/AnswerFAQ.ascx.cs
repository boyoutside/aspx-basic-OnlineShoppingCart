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
using System.Data.SqlClient;

public partial class Admin_AdminUserControl_AnswerFAQ : System.Web.UI.UserControl
{
    FAQ objFAQ = new FAQ();
    protected void Page_Load(object sender, EventArgs e)
    {
        lbCauHoi.Visible = false;
        if (Session["vdName"] != null)
        {
            if (Request.QueryString["id"] != null)
            {
                loadFAQ();
            }            
        }
        else 
        {
            Response.Redirect("~/Login.aspx");
        } 
    }
    void loadFAQ ()
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OSCConnection"].ConnectionString);
        SqlCommand comm = new SqlCommand("Select * from ViewFAQ where FAQID=" + Request.QueryString["id"].ToString(), conn);
        conn.Open();
        SqlDataReader dr = comm.ExecuteReader();
        dr.Read();
        lbCauHoi.Text = dr.GetString(3);
        lbCauHoi.Visible = true;
        conn.Close();
    }
    protected void bSend_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] != null)
        {
            bool a = objFAQ.UpdateFAQ(Request.QueryString["id"].ToString(), tTraLoi.Text, "True", Session["vdEmpID"].ToString());
            if (a = true)
            {
                MessageBox.Show("Answer is successful.");
                tTraLoi.Text = "";
            }
            else
            {
                MessageBox.Show("Can not answer. Try again.");
                tTraLoi.Text = "";
            }
        }
        else 
        {
            MessageBox.Show("Please chose question.");
            tTraLoi.Text = "";
        }        
    }
}
