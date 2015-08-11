<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="UpdateEmployee.aspx.cs" Inherits="Admin_UpdateEmployee" Title="Untitled Page" %>

<%@ Register Src="AdminUserControl/UpdateEmployeeUserControl.ascx" TagName="UpdateEmployeeUserControl"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:UpdateEmployeeUserControl ID="UpdateEmployeeUserControl1" runat="server" />
</asp:Content>

