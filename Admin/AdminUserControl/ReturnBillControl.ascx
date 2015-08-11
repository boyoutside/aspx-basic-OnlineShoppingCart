<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ReturnBillControl.ascx.cs" Inherits="UserControl_ReturnBillControl" %>
&nbsp;

<table style="width: 800px ; margin : auto" border="1">
    <tr>
        <td style="width: 250px; height: 24px">
            <asp:Label ID="Label1" runat="server" Text="Search by" Width="81px" Height="20px"></asp:Label><asp:DropDownList ID="DropDownList1" runat="server" Width="111px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
                <asp:ListItem>All</asp:ListItem>
            </asp:DropDownList></td>
        <td style="height: 24px; width: 650px;" colspan="1">
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:Label ID="lbSort" runat="server" Text="Sort by" Width="51px"></asp:Label>
            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged"
                Width="89px">
                <asp:ListItem>-Select-</asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged"
                Width="74px">
                <asp:ListItem>Asc</asp:ListItem>
                <asp:ListItem>Desc</asp:ListItem>
            </asp:DropDownList></td>   
    </tr>
    <tr>
        <td style="width: 250px; height: 47px;">
            <asp:Label ID="Label3" runat="server" Text="Search key" Width="81px"></asp:Label>
            <asp:TextBox ID="txtSearch" runat="server" Width="110px" OnTextChanged="txtSearch_TextChanged"></asp:TextBox>&nbsp;&nbsp;<br />
            <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" Width="74px" /><br />
            <asp:Label ID="lbWarning" runat="server" ForeColor="Red"></asp:Label></td>
        <td style="vertical-align: top; width: 650px;" colspan="1" rowspan="2">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True"
                AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ReturnID" DataSourceID="SqlDataSource2"
                ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" Width="602px" OnRowUpdated="GridView1_RowUpdated">
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update"
                                Text="Update"></asp:LinkButton>
                            <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                                Text="Cancel"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Select"
                                Text="Select"></asp:LinkButton>
                            <asp:LinkButton ID="LinkButtonEdit" runat="server" CausesValidation="False" CommandName="Edit"
                                Text="Edit" Enabled="False"></asp:LinkButton>
                            
                            <asp:LinkButton ID="LinkButtonDelete" runat="server" CausesValidation="False" CommandName="Delete"
                                Text="Delete" Enabled="False" OnClientClick = "return confirm ('Are you sure to delete this data ?')"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ReturnID" SortExpression="ReturnID">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("ReturnID") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LabelReturnID" runat="server" Text='<%# Bind("ReturnID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ProID" SortExpression="ProID">
                        <EditItemTemplate>
                            &nbsp;<asp:DropDownList ID="DropDownListProID" runat="server" SelectedValue='<%# Bind("ProID") %>' DataSourceID="SqlDataSourceOrders" DataTextField="ProID" DataValueField="ProID">
                            </asp:DropDownList><asp:SqlDataSource ID="SqlDataSourceOrders" runat="server" ConnectionString="<%$ ConnectionStrings:OSCConnection %>"
                                SelectCommand="SELECT [ProID] FROM [Orders] WHERE ([BillID] = @BillID)">
                                <SelectParameters>
                                    <asp:SessionParameter Name="BillID" SessionField="BillID" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LabelProID" runat="server" Text='<%# Bind("ProID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Quantity" SortExpression="Quantity">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBoxQuatity" runat="server" Text='<%# Bind("Quantity") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LabelQuantity" runat="server" Text='<%# Bind("Quantity") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="BillID" SortExpression="BillID">
                        <EditItemTemplate>
                            &nbsp;
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("BillID") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LabelBillID" runat="server" Text='<%# Bind("BillID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ReturnDate" SortExpression="ReturnDate">
                        <EditItemTemplate>
                            &nbsp;<asp:Label ID="Label4" runat="server" Text='<%# Bind("ReturnDate") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("ReturnDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Description" SortExpression="Description">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" />
                <EmptyDataTemplate>
                    <asp:Label ID="LbEmpty" runat="server" Text="There is no data "></asp:Label>
                </EmptyDataTemplate>
            </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:OSCConnection %>"
                    SelectCommand="SELECT * FROM [ReturnBill]" DeleteCommand="DELETE FROM [ReturnBill] WHERE [ReturnID] = @original_ReturnID AND (([ProID] = @original_ProID) OR ([ProID] IS NULL AND @original_ProID IS NULL)) AND (([Quantity] = @original_Quantity) OR ([Quantity] IS NULL AND @original_Quantity IS NULL)) AND (([BillID] = @original_BillID) OR ([BillID] IS NULL AND @original_BillID IS NULL)) AND (([ReturnDate] = @original_ReturnDate) OR ([ReturnDate] IS NULL AND @original_ReturnDate IS NULL)) AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL))" InsertCommand="INSERT INTO [ReturnBill] ([ReturnID], [ProID], [Quantity], [BillID], [ReturnDate], [Description]) VALUES (@ReturnID, @ProID, @Quantity, @BillID, @ReturnDate, @Description)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [ReturnBill] SET [ProID] = @ProID, [Quantity] = @Quantity, [BillID] = @BillID, [ReturnDate] = @ReturnDate, [Description] = @Description WHERE [ReturnID] = @original_ReturnID AND (([ProID] = @original_ProID) OR ([ProID] IS NULL AND @original_ProID IS NULL)) AND (([Quantity] = @original_Quantity) OR ([Quantity] IS NULL AND @original_Quantity IS NULL)) AND (([BillID] = @original_BillID) OR ([BillID] IS NULL AND @original_BillID IS NULL)) AND (([ReturnDate] = @original_ReturnDate) OR ([ReturnDate] IS NULL AND @original_ReturnDate IS NULL)) AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL))" ConflictDetection="CompareAllValues">
                    <DeleteParameters>
                        <asp:Parameter Name="original_ReturnID" Type="String" />
                        <asp:Parameter Name="original_ProID" Type="String" />
                        <asp:Parameter Name="original_Quantity" Type="Int32" />
                        <asp:Parameter Name="original_BillID" Type="String" />
                        <asp:Parameter DbType="DateTime" Name="original_ReturnDate" />
                        <asp:Parameter Name="original_Description" Type="String" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="ProID" PropertyName="SelectedValue"
                            Type="String" />
                        <asp:Parameter Name="Quantity" Type="Int32" />
                        <asp:Parameter Name="BillID" Type="String" />
                        <asp:Parameter DbType="DateTime" Name="ReturnDate" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="original_ReturnID" Type="String" />
                        <asp:Parameter Name="original_ProID" Type="String" />
                        <asp:Parameter Name="original_Quantity" Type="Int32" />
                        <asp:Parameter Name="original_BillID" Type="String" />
                        <asp:Parameter DbType="DateTime" Name="original_ReturnDate" />
                        <asp:Parameter Name="original_Description" Type="String" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ReturnID" Type="String" />
                        <asp:Parameter Name="ProID" Type="String" />
                        <asp:Parameter Name="Quantity" Type="Int32" />
                        <asp:Parameter Name="BillID" Type="String" />
                        <asp:Parameter DbType="Date" Name="ReturnDate" />
                        <asp:Parameter Name="Description" Type="String" />
                    </InsertParameters>
                </asp:SqlDataSource>
            <br />
            <br />
            <br />
            <asp:Label ID="Label8" runat="server" ForeColor="Red" Text="Note:" Visible="False"></asp:Label><br />
            <asp:Label ID="Label2" runat="server" Text="New ReturnBill : The value of product,quantity are not true. You must click edit the new record to choose the product , quantity and description"
                Width="602px"></asp:Label>
            </td>
    </tr>
    <tr>
        <td style="width: 250px; height: 340px; vertical-align: top;">
            &nbsp;<asp:Calendar ID="Calendar1" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" FirstDayOfWeek="Monday" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px" ShowGridLines="True" Width="217px" OnSelectionChanged="Calendar1_SelectionChanged">
                <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                <SelectorStyle BackColor="#FFCC66" />
                <DayStyle BorderColor="#FFC0C0" BorderStyle="Dotted" HorizontalAlign="Center"
                    Wrap="True" />
                <OtherMonthDayStyle ForeColor="#CC9966" />
                <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
            </asp:Calendar>
            <asp:Label ID="lbDetail" runat="server" Text="View Detail " Width="92px"></asp:Label><asp:DropDownList ID="DDLDetail" runat="server" OnSelectedIndexChanged="DDLDetail_SelectedIndexChanged" AutoPostBack="True" Width="112px">
                <asp:ListItem>-Select-</asp:ListItem>
                <asp:ListItem>BillID</asp:ListItem>
                <asp:ListItem>ProID</asp:ListItem>
            </asp:DropDownList><br />
            <asp:Label ID="lbDetail1" runat="server" ForeColor="Red" Text="Label" Visible="False"></asp:Label><br />
            <asp:DetailsView ID="DetailsViewBill" runat="server" AutoGenerateRows="False" BackColor="#CCCCCC"
                BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2"
                DataKeyNames="BillID" DataSourceID="SqlDataSourceBill" ForeColor="Black" Height="50px"
                Width="200px">
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
            <asp:DetailsView ID="DetailsViewProduct" runat="server" AutoGenerateRows="False"
                BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px"
                CellPadding="4" CellSpacing="2" DataKeyNames="ProID" DataSourceID="SqlDataSourceProduct"
                ForeColor="Black" Height="50px" Width="200px">
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
                            <asp:Image ID="Image1" runat="server" Height="123px" ImageUrl='<%# Eval("Images") %>'
                                Width="171px" />
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
            <asp:SqlDataSource ID="SqlDataSourceBill" runat="server" ConnectionString="<%$ ConnectionStrings:OSCConnection %>"
                SelectCommand="SELECT * FROM [Bill]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceProduct" runat="server" ConnectionString="<%$ ConnectionStrings:OSCConnection %>"
                SelectCommand="SELECT * FROM [Product]"></asp:SqlDataSource>
        </td>
    </tr>
</table>
    