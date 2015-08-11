<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="InsertProduct.aspx.cs" Inherits="Admin_InsertProduct" Title="Untitled Page" %>

<%@ Register Src="AdminUserControl/InsertProductUserControl.ascx" TagName="InsertProductUserControl"
    TagPrefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:InsertProductUserControl ID="InsertProductUserControl1" runat="server" />
</asp:Content>

