<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ShoppingUserControl.ascx.cs" Inherits="UserControl_ShoppingUserControl" %>
<table style="width: 209px; border-top-style: groove; border-right-style: groove;
    border-left-style: groove; border-bottom-style: groove">
    <tr>
        <td align="center" colspan="3" rowspan="3" style="height: 21px">
                        <asp:LinkButton ID="linkShopping" runat="server" OnClick="linkShopping_Click" Font-Bold="True" Font-Italic="True" ForeColor="Red">View Cart</asp:LinkButton>
            &nbsp;&nbsp;&nbsp;
            <br />
            <asp:LinkButton ID="LinkButton1" runat="server" Font-Bold="True" Font-Italic="True"
                ForeColor="Red" OnClick="LinkButton1_Click">View All Orders.</asp:LinkButton></td>
    </tr>
    <tr>
    </tr>
    <tr>
    </tr>
</table>
