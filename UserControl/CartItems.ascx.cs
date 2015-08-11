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


public partial class UserControl_CartItems : System.Web.UI.UserControl
{
    Products objPro = new Products();   
    GetDataSet objData = new GetDataSet();
    //ArrayList arr;
    protected void Page_Load(object sender, EventArgs e)
    {        
        if (!IsPostBack)
        {            
            if (Request.QueryString["id"] == null)
            {
                ViewCart();
            }
            else
            {
                String proid = Request.QueryString["id"].ToString();
                //ArrayList arr = new ArrayList();//(ArrayList)Session["Cart"];  
                ArrayList arr = (ArrayList)Session["Cart"];              
                objPro.proID = proid;
                String sname = objData.ProductName(objPro);
                double sprice = objData.ProductPrice(objPro);
                double stotal;
               
                bool availabe = false;
                try
                {
                    foreach (SCartItems item in arr)
                    {
                        if (item.proID == proid)
                        {
                            item.quantity += 1;
                            item.total = sprice * item.quantity;
                            availabe = true;
                        }
                    }                    
                    if (availabe == false)
                    {
                        int count = 1;
                        stotal = sprice * count;
                        SCartItems sitem = new SCartItems(proid, sname, count, sprice, stotal);                        
                        arr.Add(sitem);
                        Session["Cart"] = arr;                        
                    }                   
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Your cart is empty.");
                }
                ViewCart();
               // TotalBill();
            }
        }
    }
    public void ViewCart()
    {
        ArrayList arr = (ArrayList)Session["Cart"];
        GridView1.DataSource = Session["Cart"];
        GridView1.DataBind();
    }
    void TotalBill()
    {
        //double realbill = 0;
        //ArrayList arr = (ArrayList)Session["Cart"];
        //foreach (SCartItems num in arr)
        //{
        //    realbill = realbill + num.price * num.quantity;
        //}
        //lbTotalBill.Text = realbill.ToString();

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //ArrayList arr = new ArrayList();
        //SCartItems item = new SCartItems("ID01", "POI", 1, 15, 15);
        //arr.Add(item);
        //String a = "";
        //foreach (SCartItems itm in arr)
        //{
        //    a += itm.proName;
        //}
        //MessageBox.Show(a);
        Response.Redirect("ViewProducts.aspx");
    }

}
