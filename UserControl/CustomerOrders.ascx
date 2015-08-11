<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CustomerOrders.ascx.cs" Inherits="UserControl_CustomerOrders" %>
<table width="590">
    <tr>
        <td align="center" colspan="3" style="height: 28px">
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Overline="False" Font-Size="Large"
                Text="Your Orders"></asp:Label></td>
    </tr>
    <tr>
        <td colspan="3" rowspan="2">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                DataKeyNames="OrderID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None"
                Width="588px">
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <Columns>
                    <asp:BoundField DataField="OrderID" HeaderText="OrderID" ReadOnly="True" SortExpression="OrderID" />
                    <asp:BoundField DataField="BillID" HeaderText="BillID" SortExpression="BillID" />
                    <asp:BoundField DataField="ProID" HeaderText="ProID" SortExpression="ProID" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity">
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount">
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="PayID" HeaderText="PayID" SortExpression="PayID" />
                    <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" SortExpression="OrderDate">
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:CheckBoxField DataField="IsConfirm" HeaderText="IsConfirm" SortExpression="IsConfirm">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:CheckBoxField>
                </Columns>
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" />
                <EmptyDataTemplate>
                    <asp:Label ID="Label2" runat="server" Font-Italic="True" ForeColor="Red" Text="You have not any orders."></asp:Label>
                </EmptyDataTemplate>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OSCConnection %>"
                SelectCommand="SELECT [OrderID], [BillID], [ProID], [Quantity], [Amount], [PayID], [OrderDate], [IsConfirm] FROM [Orders] where CusID=@CusID ORDER BY [OrderDate] DESC">
                <SelectParameters>
                    <asp:QueryStringParameter Name="CusID" QueryStringField="cusid" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
    <tr>
    </tr>
</table>
