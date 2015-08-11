using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// Summary description for AddItems
/// </summary>
public class AddItems:Products
{
	public AddItems()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public System.Collections.Generic.List<SCartItems> chose;
    public void AddItem(SCartItems item) 
    {
        chose.Add(item);
    }
}
