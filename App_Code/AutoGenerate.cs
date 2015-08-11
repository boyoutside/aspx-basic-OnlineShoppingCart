using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text;

/// <summary>
/// Summary description for AutoGenerate
/// </summary>
public class AutoGenerate
{
    Random rdAuto = new Random();

	public AutoGenerate()
	{
	}

    public String RandomNumber(int length)
    {
        StringBuilder builderNumber = new StringBuilder();
        for (int i = 0; i < length; i++)
        {
            builderNumber.Append(rdAuto.Next(0, 9));
        }
        return builderNumber.ToString();
    }

    public String RandomString(int size, bool uppercase)
    {
        StringBuilder builderString = new StringBuilder();
        char ch;
        for (int i = 0; i < size; i++)
        {
            ch = Convert.ToChar(Convert.ToInt32(Math.Floor(26 * rdAuto.NextDouble() + 65)));
            builderString.Append(ch);
        }
        if (uppercase)
            return builderString.ToString();
        return builderString.ToString().ToLower();
    }
}
