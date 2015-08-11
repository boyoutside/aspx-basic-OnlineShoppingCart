<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="DeleteCustomer.aspx.cs" Inherits="Admin_DeleteCustomer" Title="Untitled Page" %>

<%@ Register Src="AdminUserControl/DeleteCustomerUserControl.ascx" TagName="DeleteCustomerUserControl"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:DeleteCustomerUserControl ID="DeleteCustomerUserControl1" runat="server" />
</asp:Content>

