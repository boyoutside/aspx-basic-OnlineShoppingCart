<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Login.ascx.cs" Inherits="UserControl_Login" %>
<table style="width: 209px; border-top-style: groove; border-right-style: groove;
    border-left-style: groove; border-bottom-style: groove">
    <tr>
        <td align="center" colspan="3" rowspan="3" style="height: 21px">
                        <asp:Label ID="Label1" runat="server" Text="Hi, "></asp:Label>
                        &nbsp;<asp:LinkButton ID="linkUpdate" runat="server" ForeColor="Red" OnClick="linkUpdate_Click" CausesValidation="False">Link</asp:LinkButton><br />
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" CausesValidation="False">LinkButton</asp:LinkButton>
            &nbsp;&nbsp;

        </td>
    </tr>
    <tr>
    </tr>
    <tr>
    </tr>
</table>
<br />
