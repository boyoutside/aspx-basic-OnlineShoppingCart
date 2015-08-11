<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Question.ascx.cs" Inherits="UserControl_Question" %>
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="FAQID"
    DataSourceID="SqlDataSource1">
    <Columns>
        <asp:TemplateField>
            <ItemTemplate>
                <table style="width: 239px; height: 71px">
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Question") %>'></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ShoppingOnlineConnectionString %>"
    SelectCommand="SELECT * FROM [FAQ]"></asp:SqlDataSource>
