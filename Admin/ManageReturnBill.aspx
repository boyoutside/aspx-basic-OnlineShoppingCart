<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ManageReturnBill.aspx.cs" Inherits="Admin_ReturnBill" Title="Untitled Page" %>

<%@ Register Src="AdminUserControl/ReturnBillControl.ascx" TagName="ReturnBillControl"
    TagPrefix="uc1" %>


   
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ReturnBillControl ID="ReturnBillControl1" runat="server" />
    
</asp:Content>

