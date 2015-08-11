<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ManageDealer.aspx.cs" Inherits="Admin_ManageDealer" Title="Untitled Page" %>

<%@ Register Src="AdminUserControl/ManageDealerUserControl.ascx" TagName="ManageDealerUserControl"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ManageDealerUserControl ID="ManageDealerUserControl1" runat="server" />
</asp:Content>

