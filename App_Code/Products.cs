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
/// Summary description for Products
/// </summary>
/// 
[Serializable]
public class Products
{
    //private String ProID;
    //private String ProName;
    //private String Price;
    //private String Quantity;
    //private String KinID;
    //private String ProSize;
    //private String Producer;
    //private String Warranty;
    //private String Description;
    public Products()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    private String ProID;

    public String proID
    {
        get { return ProID; }
        set { ProID = value; }
    }
    private String ProName;

    public String proName
    {
        get { return ProName; }
        set { ProName = value; }
    }
    private String Price;

    public String price
    {
        get { return Price; }
        set { Price = value; }
    }
    private String Quantity;

    public String quantity
    {
        get { return Quantity; }
        set { Quantity = value; }
    }

    private String KindID;

    public String kindID
    {
        get { return KindID; }
        set { KindID = value; }
    }
    private String ProSize;

    public String proSize
    {
        get { return ProSize; }
        set { ProSize = value; }
    }
    private String Producer;

    public String producer
    {
        get { return Producer; }
        set { Producer = value; }
    }
    private String Warranty;

    public String warranty
    {
        get { return Warranty; }
        set { Warranty = value; }
    }
    private String Description;

    public String description
    {
        get { return Description; }
        set { Description = value; }
    }
}

