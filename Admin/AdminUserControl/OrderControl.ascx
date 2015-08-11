<%@ Control Language="C#" AutoEventWireup="true" CodeFile="OrderControl.ascx.cs" Inherits="UserControl_OrderControl" %>
&nbsp;
<html>
<body>
<table style="width: 1000px ; margin : auto" border="1">
    <tr>
        <td style="width: 250px; height: 24px">
            <asp:Label ID="Label1" runat="server" Text="Search by" Width="80px"></asp:Label><asp:DropDownList ID="DropDownList1" runat="server" Width="131px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
                <asp:ListItem>All</asp:ListItem>
            </asp:DropDownList>
        </td>
        <td style="height: 24px; width: 713px;" colspan="1">
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; <asp:Label ID="Label2" runat="server" Text="Sort by" Width="51px"></asp:Label>
            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged"
                Width="89px">
                <asp:ListItem>-Select -</asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged"
                Width="74px">
                <asp:ListItem>Asc</asp:ListItem>
                <asp:ListItem>Desc</asp:ListItem>
            </asp:DropDownList></td>   
    </tr>
    <tr>
        <td style="width: 250px; height: 47px;">
            <asp:Label ID="Label3" runat="server" Text="Search key" Width="81px"></asp:Label><asp:TextBox ID="txtSearch" runat="server" Width="130px" OnTextChanged="txtSearch_TextChanged"></asp:TextBox><br />
            <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" Width="74px" />
            <br />
            <asp:Label ID="lbWarning" runat="server" ForeColor="Red"></asp:Label></td>
        <td style="vertical-align: top; width: 713px;" colspan="1" rowspan="2">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True"
                AutoGenerateColumns="False" CellPadding="4" DataKeyNames="OrderID" DataSourceID="SqlDataSource2"
                ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" Width="603px" OnRowDeleting="GridView1_RowDeleting1" OnRowDeleted="GridView1_RowDeleted1" OnRowCreated="GridView1_RowCreated">
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"  Wrap ="True"/>
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
                                Text="Select"></asp:LinkButton><asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False"
                                    CommandName="Delete" Enabled="False" Text="Delete" OnClientClick = "return confirm('Delete this data?');"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="OrderID" SortExpression="OrderID">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("OrderID") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LabelOrderID" runat="server" Text='<%# Bind("OrderID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="BillID" SortExpression="BillID">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("BillID") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LabelBillID" runat="server" Text='<%# Bind("BillID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="CusID" SortExpression="CusID">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("CusID") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LabelCusID" runat="server" Text='<%# Bind("CusID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ProID" SortExpression="ProID">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ProID") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LabelProID" runat="server" Text='<%# Bind("ProID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Quantity" SortExpression="Quantity">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Quantity") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("Quantity") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Amount" SortExpression="Amount">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Amount") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LabelAmount" runat="server" Text='<%# Bind("Amount") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="PayID" SortExpression="PayID">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("PayID") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LabelPayID" runat="server" Text='<%# Bind("PayID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="TransID" SortExpression="TransID">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("TransID") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LabelTraID" runat="server" Text='<%# Bind("TransID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="OrderDate" SortExpression="OrderDate">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("OrderDate") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("OrderDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="IsConfirm" SortExpression="IsConfirm">
                        <EditItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("IsConfirm") %>' />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("IsConfirm") %>' Enabled="false" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:Button ID="btnConfirm" runat="server" OnClick = "btnConfirm" CausesValidation="false" CommandName="" Text="Confirm" OnClientClick = "return confirm ('Confirm this data ?');"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" />
                <EmptyDataTemplate>
                    <asp:Label ID="LbEmpty" runat="server" Text="There is no data "></asp:Label>
                </EmptyDataTemplate>
                <EditRowStyle BackColor="#2461BF" />
            </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:OSCConnection %>"
                    SelectCommand="SELECT * FROM [Orders]" DeleteCommand="DELETE FROM [Orders] WHERE [OrderID] = @original_OrderID" InsertCommand="INSERT INTO [Orders] ([OrderID], [BillID], [CusID], [ProID], [Quantity], [Amount], [PayID], [TransID], [OrderDate], [IsConfirm]) VALUES (@OrderID, @BillID, @CusID, @ProID, @Quantity, @Amount, @PayID, @TransID, @OrderDate, @IsConfirm)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Orders] SET [BillID] = @BillID, [CusID] = @CusID, [ProID] = @ProID, [Quantity] = @Quantity, [Amount] = @Amount, [PayID] = @PayID, [TransID] = @TransID, [OrderDate] = @OrderDate, [IsConfirm] = @IsConfirm WHERE [OrderID] = @original_OrderID">
                    <DeleteParameters>
                        <asp:Parameter Name="original_OrderID" Type="String" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="BillID" Type="String" />
                        <asp:Parameter Name="CusID" Type="String" />
                        <asp:Parameter Name="ProID" Type="String" />
                        <asp:Parameter Name="Quantity" Type="Int32" />
                        <asp:Parameter Name="Amount" Type="Double" />
                        <asp:Parameter Name="PayID" Type="Int32" />
                        <asp:Parameter Name="TransID" Type="Int32" />
                        <asp:Parameter DbType="Date" Name="OrderDate" />
                        <asp:Parameter Name="IsConfirm" Type="Boolean" />
                        <asp:Parameter Name="original_OrderID" Type="String" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="OrderID" Type="String" />
                        <asp:Parameter Name="BillID" Type="String" />
                        <asp:Parameter Name="CusID" Type="String" />
                        <asp:Parameter Name="ProID" Type="String" />
                        <asp:Parameter Name="Quantity" Type="Int32" />
                        <asp:Parameter Name="Amount" Type="Double" />
                        <asp:Parameter Name="PayID" Type="Int32" />
                        <asp:Parameter Name="TransID" Type="Int32" />
                        <asp:Parameter DbType="Date" Name="OrderDate" />
                        <asp:Parameter Name="IsConfirm" Type="Boolean" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
    </tr>
    <tr>
        <td style="width: 250px; height: 340px; vertical-align: top;">
            &nbsp;<asp:Calendar ID="Calendar1" runat="server" BackColor="CornflowerBlue" BorderColor="#80FFFF" BorderWidth="1px" DayNameFormat="Shortest" FirstDayOfWeek="Monday" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="200px" ShowGridLines="True" Width="220px" OnSelectionChanged="Calendar1_SelectionChanged">
                <SelectedDayStyle BackColor="DeepSkyBlue" Font-Bold="True" />
                <TodayDayStyle BackColor="LightSkyBlue" ForeColor="White" />
                <SelectorStyle BackColor="#00C0C0" />
                <DayStyle BorderColor="Cyan" BorderStyle="Dotted" HorizontalAlign="Center"
                    Wrap="True" />
                <OtherMonthDayStyle ForeColor="#CC9966" />
                <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                <DayHeaderStyle BackColor="Azure" Font-Bold="True" Height="1px" />
                <TitleStyle BackColor="#507CD1" Font-Bold="True" Font-Size="9pt" ForeColor="Cyan" />
            </asp:Calendar>
            &nbsp;
            &nbsp;
            <asp:Label ID="lbDetail" runat="server" Text="View Detail " Width="92px"></asp:Label><asp:DropDownList ID="DDLDetail" runat="server" OnSelectedIndexChanged="DDLDetail_SelectedIndexChanged" AutoPostBack="True" Width="79px">
                <asp:ListItem>-Select-</asp:ListItem>
                <asp:ListItem>Bill</asp:ListItem>
                <asp:ListItem>Customer</asp:ListItem>
                <asp:ListItem>Product</asp:ListItem>
                <asp:ListItem>Transportation</asp:ListItem>
                <asp:ListItem>Payment</asp:ListItem>
            </asp:DropDownList><br />
            &nbsp;
            <asp:Label ID="lbDetail1" runat="server" ForeColor="Red" Text="Label"></asp:Label>
            <asp:DetailsView ID="DetailsViewBill" runat="server" Height="50px" Width="200px" AutoGenerateRows="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="BillID" DataSourceID="SqlDataSourceBill" ForeColor="Black">
                <FooterStyle BackColor="#CCCCCC" />
                <RowStyle BackColor="White" />
                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                <Fields>
                    <asp:BoundField DataField="BillID" HeaderText="BillID" ReadOnly="True" SortExpression="BillID" />
                    <asp:BoundField DataField="CusID" HeaderText="CusID" SortExpression="CusID" />
                    <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" />
                    <asp:BoundField DataField="BillDate" HeaderText="BillDate" SortExpression="BillDate" />
                    <asp:CheckBoxField DataField="IsPaid" HeaderText="IsPaid" SortExpression="IsPaid" />
                    <asp:CheckBoxField DataField="IsDelivered" HeaderText="IsDelivered" SortExpression="IsDelivered" />
                </Fields>
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            </asp:DetailsView>
            <asp:DetailsView ID="DetailsViewCustomer" runat="server" AutoGenerateRows="False"
                DataKeyNames="CusID" DataSourceID="SqlDataSourceCustomer" Height="50px" Width="200px" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                <Fields>
                    <asp:BoundField DataField="CusID" HeaderText="CusID" ReadOnly="True" SortExpression="CusID" />
                    <asp:BoundField DataField="CusName" HeaderText="CusName" SortExpression="CusName" />
                    <asp:BoundField DataField="RollID" HeaderText="RollID" SortExpression="RollID" />
                    <asp:BoundField DataField="IC" HeaderText="IC" SortExpression="IC" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                </Fields>
                <FooterStyle BackColor="#CCCCCC" />
                <RowStyle BackColor="White" />
                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            </asp:DetailsView>
            <asp:DetailsView ID="DetailsViewProduct" runat="server" AutoGenerateRows="False"
                DataKeyNames="ProID" DataSourceID="SqlDataSourceProduct" Height="50px" Width="200px" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                <Fields>
                    <asp:BoundField DataField="ProID" HeaderText="ProID" ReadOnly="True" SortExpression="ProID" />
                    <asp:BoundField DataField="ProName" HeaderText="ProName" SortExpression="ProName" />
                    <asp:BoundField DataField="KindID" HeaderText="KindID" SortExpression="KindID" />
                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                    <asp:TemplateField HeaderText="Images" SortExpression="Images">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Images") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Images") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Images") %>' Height="142px" Width="151px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Producer" HeaderText="Producer" SortExpression="Producer" />
                    <asp:BoundField DataField="Warranty" HeaderText="Warranty" SortExpression="Warranty" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                </Fields>
                <FooterStyle BackColor="#CCCCCC" />
                <RowStyle BackColor="White" />
                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            </asp:DetailsView>
            <asp:DetailsView ID="DetailsViewTrans" runat="server" AutoGenerateRows="False" BackColor="#CCCCCC"
                BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2"
                DataKeyNames="TransID" DataSourceID="SqlDataSourceTrans" ForeColor="Black" Height="50px"
                Width="125px">
                <FooterStyle BackColor="#CCCCCC" />
                <RowStyle BackColor="White" />
                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                <Fields>
                    <asp:BoundField DataField="TransID" HeaderText="TransID" ReadOnly="True" SortExpression="TransID" />
                    <asp:BoundField DataField="TransName" HeaderText="TransName" SortExpression="TransName" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                </Fields>
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            </asp:DetailsView>
            <asp:DetailsView ID="DetailsViewPay" runat="server" AutoGenerateRows="False" BackColor="#CCCCCC"
                BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2"
                DataKeyNames="PayID" DataSourceID="SqlDataSourcePay" ForeColor="Black" Height="50px"
                Width="125px">
                <FooterStyle BackColor="#CCCCCC" />
                <RowStyle BackColor="White" />
                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                <Fields>
                    <asp:BoundField DataField="PayID" HeaderText="PayID" InsertVisible="False" ReadOnly="True"
                        SortExpression="PayID" />
                    <asp:BoundField DataField="Payment" HeaderText="Payment" SortExpression="Payment" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                </Fields>
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSourcePay" runat="server" ConnectionString="<%$ ConnectionStrings:OSCConnection %>"
                SelectCommand="SELECT * FROM [Payment]"></asp:SqlDataSource>
            <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSourceTrans" runat="server" ConnectionString="<%$ ConnectionStrings:OSCConnection %>"
                SelectCommand="SELECT * FROM [Transportation]"></asp:SqlDataSource>
            <br />
            <asp:SqlDataSource ID="SqlDataSourceBill" runat="server" ConnectionString="<%$ ConnectionStrings:OSCConnection %>"
                SelectCommand="SELECT * FROM [Bill]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceProduct" runat="server" ConnectionString="<%$ ConnectionStrings:OSCConnection %>"
                SelectCommand="SELECT * FROM [Product]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceCustomer" runat="server" ConnectionString="<%$ ConnectionStrings:OSCConnection %>"
                SelectCommand="SELECT * FROM [Customer]"></asp:SqlDataSource>
        </td>
    </tr>
</table>
    &nbsp;&nbsp;
</body>
</html>