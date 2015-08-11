<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="MainEmployee.aspx.cs" Inherits="Admin_MainEmployee" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 715px">
        <tr>
            <td align="center" colspan="3">
                <asp:Label ID="Label1" runat="server" Font-Size="XX-Large" ForeColor="#FF8000" Text="Employee Management "></asp:Label></td>
        </tr>
        <tr>
            <td align="left">
                </td>
            <td align="left">
            </td>
            <td align="left">
            </td>
        </tr>
        <tr>
            <td align="left">
            </td>
            <td align="left">
            </td>
            <td align="left">
            </td>
        </tr>
        <tr>
            <td align="left">
            </td>
            <td align="left">
            </td>
            <td align="left">
            </td>
        </tr>
        <tr>
            <td align="left">
                <asp:LinkButton ID="linkEdit" runat="server" OnClick="linkEdit_Click">Update My Account</asp:LinkButton></td>
            <td align="left">
                <asp:LinkButton ID="linkInsertProduct" runat="server" OnClick="linkInsertProduct_Click">Insert Product</asp:LinkButton></td>
            <td align="left">
                <asp:LinkButton ID="linkDeleteProduct" runat="server" OnClick="linkDeleteProduct_Click">Update and Delete Product</asp:LinkButton></td>
        </tr>
        <tr>
            <td align="left">
                <asp:LinkButton ID="linkProKind" runat="server" OnClick="linkProKind_Click">Manage Kind</asp:LinkButton></td>
            <td align="left">
            </td>
            <td align="left">
            </td>
        </tr>
    </table>
</asp:Content>

