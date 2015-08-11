<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DeleteEmployeeUserControl.ascx.cs" Inherits="DeleteEmployeeUserControl" %>
<table>
    <tr>
        <td align="center" colspan="3">
            <asp:Label ID="Label1" runat="server" Font-Size="XX-Large" ForeColor="#FF8000" Text="Manage Employee"></asp:Label></td>
    </tr>
    <tr>
        <td align="center" colspan="3">
        </td>
    </tr>
    <tr>
        <td align="center" colspan="3" style="height: 21px">
            </td>
    </tr>
    <tr>
        <td colspan="3">
        </td>
    </tr>
    <tr>
        <td align="center" colspan="3">
            &nbsp; &nbsp;&nbsp;
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                CellPadding="4" DataSourceID="ObjectDataSource1" ForeColor="#333333" GridLines="None"
                OnRowCreated="GridView1_RowCreated" OnRowDeleting="GridView1_RowDeleting">
                <RowStyle BackColor="#EFF3FB" />
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete"
                                Text="Delete" OnClientClick = "return confirm('Are you sure you want to delete this Employee Record?');"></asp:LinkButton>
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
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="DeleteEmp"
                SelectMethod="getEmp" TypeName="DelEmp">
                <DeleteParameters>
                    <asp:Parameter Name="EmpID" Type="String" />
                </DeleteParameters>
            </asp:ObjectDataSource>
        </td>
    </tr>
</table>
