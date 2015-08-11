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

public partial class UserControl_OrderSucceed : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String note = "Order successfull.";
        note += "\n Our agent will contact you in 3 days or you can contact us to confirm your order(s).";
        note += "\n Remember to ask us about the transportation's charge . ";
        note += "\n Thank you for shopping with us.";
        note += "\n Any request, please ";
        Label1.Text = note;
    }
}
