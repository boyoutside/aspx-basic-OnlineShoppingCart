<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ViewFeedBack.ascx.cs" Inherits="UserControl_ViewFeedBack" %>
<script language="javascript" type="text/javascript">
<!--

function TABLE1_onclick() {

}

// -->
</script>

<table id="TABLE1" language="javascript" onclick="return TABLE1_onclick()" width="590">
    <tr>
        <td colspan="4" rowspan="3" style="height: 21px">
            <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Medium"
                Text="FAQ-Feedback"></asp:Label></td>
    </tr>
    <tr>
    </tr>
    <tr>
    </tr>
    <tr>
        <td colspan="4" rowspan="1" style="height: 275px">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                AutoGenerateColumns="False" DataSourceID="SqlDataSource1" PageSize="2" DataKeyNames="FAQID">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <table width="590">
                                <tr>
                                    <td colspan="2">
                                        User name :
                                    </td>
                                    <td style="width: 350px" align="left">
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("UserName") %>' Font-Bold="True" ForeColor="Blue"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="width: 35px; height: 21px">
                                    </td>
                                    <td align="left" style="width: 5px; height: 21px">
                                        Question :</td>
                                    <td style="height: 21px; width: 350px;" align="left">
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Question") %>' ForeColor="Blue"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="width: 35px; height: 21px">
                                    </td>
                                    <td align="left" style="width: 5px; height: 21px">
                                        Answer :</td>
                                    <td style="height: 21px; width: 350px;" align="left">
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Answer") %>'></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="width: 35px; height: 21px">
                                    </td>
                                    <td align="right" colspan="2" style="height: 21px">
                                        Answered by
                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("EmpID") %>' Font-Italic="True" ForeColor="Blue"></asp:Label></td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OSCConnection %>"
                SelectCommand="SELECT * FROM [ViewFAQ] WHERE ([IsAnswer] = @IsAnswer)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="True" Name="IsAnswer" Type="Boolean" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td align="left" colspan="3" rowspan="1" style="height: 6px">
        </td>
        <td align="right" colspan="1" rowspan="1" style="width: 6px; height: 6px">
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Home.aspx"><< Home Page</asp:HyperLink>
            &nbsp; &nbsp;
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Send FAQ >></asp:LinkButton>&nbsp;</td>
    </tr>
</table>
