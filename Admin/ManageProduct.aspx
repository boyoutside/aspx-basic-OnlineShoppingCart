<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ManageProduct.aspx.cs" Inherits="Admin_ManageProduct" Title="Untitled Page" %>

<%@ Register Src="AdminUserControl/ManageProductWebUserControl.ascx" TagName="ManageProductWebUserControl"
    TagPrefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ManageProductWebUserControl ID="ManageProductWebUserControl1" runat="server" />
</asp:Content>

