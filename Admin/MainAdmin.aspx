<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="MainAdmin.aspx.cs" Inherits="Admin_MainAdmin" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 763px">
        <tr>
            <td align="center" colspan="3" style="height: 24px">
                <asp:Label ID="Label1" runat="server" Font-Size="XX-Large" ForeColor="#FF8000" Text="Administrater Management"></asp:Label></td>
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
            <td align="left" style="height: 21px">
                <asp:LinkButton ID="linkRegisterEmployee" runat="server" OnClick="linkRegisterEmployee_Click">Register Employee</asp:LinkButton></td>
            <td align="left" style="height: 21px">
                <asp:LinkButton ID="linkViewEmployee" runat="server" OnClick="linkViewEmployee_Click">View and Delete Employee</asp:LinkButton></td>
            <td align="left" style="height: 21px">
                <asp:LinkButton ID="linkDeleteCustomer" runat="server" OnClick="linkDeleteCustomer_Click">View and Delete Customer</asp:LinkButton></td>
        </tr>
        <tr>
            <td align="left" style="height: 21px">
                <asp:LinkButton ID="linkInsertProduct" runat="server" OnClick="linkInsertProduct_Click">Insert Product</asp:LinkButton></td>
            <td align="left" style="height: 21px">
                <asp:LinkButton ID="linkDeleteProduct" runat="server" OnClick="linkDeleteProduct_Click">Update and Delete Product</asp:LinkButton></td>
            <td align="left" style="height: 21px">
                <asp:LinkButton ID="linkProKind" runat="server" OnClick="linkProKind_Click">Manage Kind</asp:LinkButton></td>
        </tr>
        <tr>
            <td align="left" style="height: 21px">
                <asp:LinkButton ID="linkDealer" runat="server" OnClick="linkDealer_Click">Manage Dealer</asp:LinkButton></td>
            <td align="left" style="height: 21px">
                <asp:LinkButton ID="linkEdit" runat="server" OnClick="linkEdit_Click">Update My Account</asp:LinkButton></td>
            <td align="left" style="height: 21px">
                <asp:LinkButton ID="LinkButtonOrder" runat="server" OnClick="LinkButtonOrder_Click"
                    PostBackUrl="~/Admin/ManageOrder.aspx">Manage Order</asp:LinkButton></td>
        </tr>
        <tr>
            <td align="left" style="height: 21px">
                <asp:LinkButton ID="LinkButtonBill" runat="server" OnClick="LinkButtonBill_Click">Manage Bill</asp:LinkButton>
            </td>
            <td align="left" style="height: 21px">
                <asp:LinkButton ID="LinkButtonReturnBill" runat="server" OnClick="LinkButtonReturnBill_Click">Manage ReturnBill</asp:LinkButton></td>
            <td align="left" style="height: 21px">
                <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Admin/AnswerFeedback.aspx">Manage FAQ</asp:LinkButton></td>
        </tr>
    </table>
</asp:Content>

