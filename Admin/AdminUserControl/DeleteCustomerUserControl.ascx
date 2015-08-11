<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DeleteCustomerUserControl.ascx.cs" Inherits="DeleteCustomerUserControl" %>
<table style="width: 657px">
    <tr>
        <td align="center">
            <asp:Label ID="Label1" runat="server" Font-Size="XX-Large" ForeColor="#FF8000" Text="Manage Customer"></asp:Label></td>
    </tr>
    <tr>
        <td>
        </td>
    </tr>
    <tr>
        <td>
        </td>
    </tr>
    <tr>
        <td align="center">
            </td>
    </tr>
    <tr>
        <td>
        </td>
    </tr>
    <tr>
        <td>
        </td>
    </tr>
    <tr>
        <td align="center">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                CellPadding="4" DataSourceID="ObjectDataSource1" ForeColor="#333333" GridLines="None"
                OnRowDeleting="GridView1_RowDeleting" OnRowCreated="GridView1_RowCreated">
                <RowStyle BackColor="#EFF3FB" />
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete"
                                Text="Delete" OnClientClick = "return confirm('Are you sure you want to delete this Customer Record?');"></asp:LinkButton>
                                
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#2461BF" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="DeleteCusID"
                SelectMethod="getCus" TypeName="DelCus">
                <DeleteParameters>
                    <asp:Parameter Name="CusID" Type="String" />
                </DeleteParameters>
            </asp:ObjectDataSource>
        </td>
    </tr>
</table>
