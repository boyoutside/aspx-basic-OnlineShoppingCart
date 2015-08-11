<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="DeleteEmployee.aspx.cs" Inherits="Admin_DeleteEmployee" Title="Untitled Page" %>

<%@ Register Src="AdminUserControl/DeleteEmployeeUserControl.ascx" TagName="DeleteEmployeeUserControl"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:DeleteEmployeeUserControl ID="DeleteEmployeeUserControl1" runat="server" />
</asp:Content>

