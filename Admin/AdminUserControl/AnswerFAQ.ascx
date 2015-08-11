<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AnswerFAQ.ascx.cs" Inherits="Admin_AdminUserControl_AnswerFAQ" %>
<table width="598">
    <tr>
        <td colspan="3" style="width: 583px">
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="List Question"></asp:Label></td>
    </tr>
    <tr>
        <td colspan="3" rowspan="2" style="width: 583px; height: 106px" align="center">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                DataKeyNames="FAQID" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <table style="width: 564px">
                                <tr>
                                    <td align="left" colspan="3" style="height: 26px">
                                        &nbsp;<asp:Image ID="Image1" runat="server" ImageUrl="~/Admin/Images/menua.jpg" />
                                        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Italic="True" ForeColor="Blue"
                                            Text='<%# Eval("Question") %>'></asp:Label></td>
                                </tr>
                                <tr>
                                    <td align="right" colspan="3" rowspan="2" style="height: 21px">
                                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("FAQID","~/Admin/AnswerFeedback.aspx?id={0}") %>'>Answer >></asp:HyperLink></td>
                                </tr>
                                <tr>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red"
                        Text="There is no question requested ." Width="567px"></asp:Label>
                </EmptyDataTemplate>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OSCConnection %>"
                SelectCommand="SELECT * FROM [ViewFAQ] WHERE ([IsAnswer] = @IsAnswer)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="False" Name="IsAnswer" Type="Boolean" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
    <tr>
    </tr>
</table>
<table width="598" id="tb2">
    <tr>
        <td style="width: 73px; height: 21px;">
            Question :</td>
        <td style="height: 21px">
            <asp:Label ID="lbCauHoi" runat="server" Text="Label"></asp:Label></td>
        <td style="height: 21px">
        </td>
    </tr>
    <tr>
        <td style="width: 73px; height: 40px">
            Answer :</td>
        <td style="height: 40px">
            <asp:TextBox ID="tTraLoi" runat="server" Height="111px" TextMode="MultiLine" Width="507px"></asp:TextBox></td>
        <td style="height: 40px">
        </td>
    </tr>
    <tr>
        <td style="width: 73px">
        </td>
        <td align="center">
            <asp:Button ID="bSend" runat="server" Text="Send" OnClick="bSend_Click" />
            <asp:Button ID="bCancel" runat="server" Text="Cancel" /></td>
        <td>
        </td>
    </tr>
</table>
