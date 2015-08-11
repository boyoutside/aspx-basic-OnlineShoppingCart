using System.Collections.Generic;
using System.Web;
using System.Configuration;
using System.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections;
using System.Data;
using System;

/// <summary>
/// Summary description for CartItems
/// </summary>
/// 
[Serializable]
public class SCartItems 
{
    private string ProID;
    private string ProName;
    private double Price;    
    private int Quantity;
	public SCartItems()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public string proID
    {
        get { return ProID; }
        set { ProID = value; }
    }
    public string proName
    {
        get { return ProName; }
        set { ProName = value; }
    }
    public double price
    {
        get { return Price; }
        set { Price = value; }
    }
    public int quantity
    {
        get { return Quantity; }
        set { Quantity = value; }
    }
    private double Total;

    public double total
    {
        set { Total = Price * Quantity; }
        get { return Total; }
    }
    
    public SCartItems(string proID, string proName, int quantity, double price, double total)
    {
        this.ProID = proID;
        this.ProName = proName;
        this.Quantity = quantity;
        this.Price = price;
        this.Total = total;
    }    
}
