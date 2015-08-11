<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Answer.ascx.cs" Inherits="UserControl_Answer" %>
<table width="580">
    <tr>
        <td colspan="4">
            User Name :
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></td>
    </tr>
    <tr>
        <td colspan="1" style="height: 158px" valign="top">
            Question</td>
        <td colspan="3" style="height: 158px">
            <asp:TextBox ID="TextBox2" runat="server" Height="158px" TextMode="MultiLine" Width="475px"></asp:TextBox></td>
    </tr>
    <tr>
        <td colspan="1" style="height: 158px" valign="top">
            Answer :</td>
        <td colspan="3" style="height: 158px">
            <asp:TextBox ID="TextBox3" runat="server" Height="158px" TextMode="MultiLine" Width="475px"></asp:TextBox></td>
    </tr>
    <tr>
        <td style="width: 171px; height: 20px">
        </td>
        <td style="width: 171px; height: 20px">
        </td>
        <td style="width: 193px; height: 20px">
        </td>
        <td style="width: 41px; height: 20px">
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        </td>
    </tr>
    <tr>
        <td colspan="2" style="height: 19px">
            <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Home.aspx"><< Home page</asp:LinkButton></td>
        <td style="width: 193px; height: 19px">
            &nbsp;<asp:Button ID="Button2" runat="server" Text="Back" />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Send" /></td>
        <td style="width: 41px; height: 19px">
        </td>
    </tr>
    <tr>
        <td colspan="2" style="height: 21px">
        </td>
        <td style="width: 193px; height: 21px">
        </td>
        <td style="width: 41px; height: 21px">
        </td>
    </tr>
</table>
