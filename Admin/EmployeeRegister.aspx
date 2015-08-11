<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="EmployeeRegister.aspx.cs" Inherits="Admin_Default" Title="Untitled Page" %>


<%@ Register Src="AdminUserControl/RegisterEmployeeWebUserControl.ascx" TagName="RegisterEmployeeWebUserControl"
    TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc2:RegisterEmployeeWebUserControl ID="RegisterEmployeeWebUserControl1" runat="server" />
</asp:Content>

