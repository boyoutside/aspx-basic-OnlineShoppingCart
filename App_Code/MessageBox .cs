 using System;  
 using System.Text;  
 using System.Web.UI; 
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
 public static class MessageBox  
 {  
 // Create a string builder to help format the javascript  
 private static StringBuilder sb;  
 public static void Show(string strMessage)  
 {  
 // make sure our string builder is initialized with an empty value  
 sb = new StringBuilder();  
 // Rewrite our Message to conform with javascript syntax  
 strMessage = strMessage.Replace("\n", "\\n");  
 strMessage = strMessage.Replace("\"", "'");  
 // Create the javascript to be sent to the client  
 sb.Append("<script language=\"javascript\" type=\"text/javascript\">");  
 sb.Append(@"alert( """ + strMessage + @""" );");  
 sb.Append(@"</script>");  
 // Get the page that is requesting this method  
 Page pgExecutingPage = HttpContext.Current.Handler as Page;  
 // Wire up the unload event of the requesting page so that we can  
 // add our javascript to the end of the response  
 pgExecutingPage.Unload += new EventHandler(pgExecutingPage_Unload);  
 } 
 private static void pgExecutingPage_Unload(object sender, EventArgs e)  
 {  
 // Write the javascript to the end of the current response  
 HttpContext.Current.Response.Write(sb);  
 }  
 }  