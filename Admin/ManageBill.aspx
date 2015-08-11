<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ManageBill.aspx.cs" Inherits="Admin_ManageBill" Title="Untitled Page" %>

<%@ Register Src="AdminUserControl/BillControl.ascx" TagName="BillControl" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:BillControl ID="BillControl1" runat="server" />
</asp:Content>

