<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ManageKind.aspx.cs" Inherits="Admin_ManageKind" Title="Untitled Page" %>

<%@ Register Src="AdminUserControl/ManaProKindUserControl.ascx" TagName="ManaProKindUserControl"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ManaProKindUserControl ID="ManaProKindUserControl1" runat="server" />
</asp:Content>

