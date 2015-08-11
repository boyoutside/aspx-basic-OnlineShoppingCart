<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ManageOrder.aspx.cs" Inherits="Admin_ManageOrder" Title="Untitled Page" %>

<%@ Register Src="AdminUserControl/OrderControl.ascx" TagName="OrderControl" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:OrderControl ID="OrderControl1" runat="server" />
</asp:Content>

