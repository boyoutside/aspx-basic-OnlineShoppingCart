<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AnswerFeedback.aspx.cs" Inherits="Admin_AnswerFeedback" Title="Untitled Page" %>

<%@ Register Src="AdminUserControl/AnswerFAQ.ascx" TagName="AnswerFAQ" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:AnswerFAQ id="AnswerFAQ1" runat="server">
    </uc1:AnswerFAQ>
    
</asp:Content>

