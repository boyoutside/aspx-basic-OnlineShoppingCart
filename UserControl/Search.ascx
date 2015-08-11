<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Search.ascx.cs" Inherits="UserControl_Search" %>
<table style="border-top-style: groove; border-right-style: groove; border-left-style: groove;
    border-bottom-style: groove" width="200">
    <tr>
        <td colspan="3">
            Search by
        </td>
    </tr>
    <tr>
        <td style="width: 12px; height: 24px;">
            Kind</td>
        <td colspan="2" style="width: 130px; height: 24px;" align="center" valign="middle">
            <asp:DropDownList ID="DropDownList1" runat="server" Width="155px"  OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" DataSourceID="SqlDataSource1" DataTextField="Kindname" DataValueField="KindID" OnDataBound="DropDownList1_DataBound" AutoPostBack="True">
            </asp:DropDownList><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OSCConnection %>"
                SelectCommand="SELECT * FROM [ProKind]"></asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td style="width: 12px; height: 24px;">
            Name</td>
        <td colspan="2" style="width: 130px; height: 24px;">
            <asp:DropDownList ID="DropDownList2" runat="server" 
                OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" Width="154px">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td align="center" colspan="3">
            &nbsp;<asp:Button ID="bSearch" runat="server" Text="Search" CausesValidation="False" OnClick="bSearch_Click" /></td>
    </tr>
</table>
