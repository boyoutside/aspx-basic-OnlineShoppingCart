<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BillControl.ascx.cs" Inherits="UserControl_BillControl" %>
&nbsp;

<table style="width: 1000px ; margin : auto" border="1">
    <tr>
        <td style="width: 225px; height: 24px">
            <asp:Label ID="Label1" runat="server" Text="Search by" Width="80px"></asp:Label><asp:DropDownList ID="DropDownList1" runat="server" Width="131px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
                <asp:ListItem>All</asp:ListItem>
            </asp:DropDownList>
        </td>
        <td style="height: 24px; width: 650px;" colspan="1">
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
            <asp:Label ID="lbSort" runat="server" Text="Sort by" Width="51px"></asp:Label>
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
        <td style="width: 225px; height: 47px;">
            <asp:Label ID="Label3" runat="server" Text="Search key" Width="81px"></asp:Label><asp:TextBox ID="txtSearch" runat="server" Width="130px" OnTextChanged="txtSearch_TextChanged"></asp:TextBox><br />
            <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" Width="74px" />
            <br />
            <asp:Label ID="lbWarning" runat="server" ForeColor="Red"></asp:Label></td>
        <td style="vertical-align: top; width: 650px;" colspan="1" rowspan="2">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True"
                AutoGenerateColumns="False" CellPadding="4" DataKeyNames="BillID" DataSourceID="SqlDataSource2"
                ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" Width="731px" OnRowUpdated="GridView1_RowUpdated" OnRowCreated="GridView1_RowCreated1">
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
                                Text="Edit"  Enabled = "false"></asp:LinkButton>
                            
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="BillID" SortExpression="BillID">
                        <EditItemTemplate>
                            <asp:Label ID="LabelBillID" runat="server" Text='<%# Eval("BillID") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LabelBillID" runat="server" Text='<%# Bind("BillID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="CusID" SortExpression="CusID">
                        <EditItemTemplate>
                            &nbsp;<asp:Label ID="LabelCusID" runat="server" Text='<%# Eval("CusID") %>'></asp:Label>
                            <asp:SqlDataSource ID="SqlDataSourceCus" runat="server" ConnectionString="<%$ ConnectionStrings:OSCConnection %>"
                                SelectCommand="SELECT [CusID], [CusName] FROM [Customer]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LabelCusID" runat="server" Text='<%# Bind("CusID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Total" SortExpression="Total">
                        <EditItemTemplate>
                            &nbsp;<asp:Label ID="Label6" runat="server" Text='<%# Eval("Total") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Total") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="BillDate" SortExpression="BillDate">
                        <EditItemTemplate>
                            &nbsp;<asp:Label ID="LabelBillDate" runat="server" Text='<%# Eval("BillDate") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LabelBillDate" runat="server" Text='<%# Bind("BillDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="IsPaid" SortExpression="IsPaid">
                        <EditItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("IsPaid") %>' />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("IsPaid") %>' Enabled="false" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="IsDelivered" SortExpression="IsDelivered">
                        <EditItemTemplate>
                            <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("IsDelivered") %>' />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("IsDelivered") %>'
                                Enabled="false" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButtonReturn" runat="server" CausesValidation="false" CommandName=""
                                Text="ReturnBill" OnClick ="ConfirmReturn" Enabled="False"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButtonReturn" runat="server" CausesValidation="false" CommandName=""
                                Text="ReturnBill" OnClick ="ConfirmReturn" ></asp:LinkButton>
                        </ItemTemplate>
                         
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButtonCreateReturn" runat="server" CausesValidation="false" CommandName=""
                                Text="Create ReturnBill" Visible="False" OnClick="CreateReturn" OnClientClick="return confirm('Are you sure ?');"></asp:LinkButton>
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
                    SelectCommand="SELECT * FROM [Bill]" DeleteCommand="DELETE FROM [Bill] WHERE [BillID] = @original_BillID" InsertCommand="INSERT INTO [Bill] ([BillID], [CusID], [Total], [BillDate], [IsPaid], [IsDelivered]) VALUES (@BillID, @CusID, @Total, @BillDate, @IsPaid, @IsDelivered)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Bill] SET  [IsPaid] = @IsPaid, [IsDelivered] = @IsDelivered WHERE [BillID] = @original_BillID"  OnUpdating="SqlDataSource2_Updating">
                    
                    <UpdateParameters>
                        <asp:Parameter Name="IsPaid" Type="Boolean" />
                        <asp:Parameter Name="IsDelivered" Type="Boolean" />
                        <asp:Parameter Name="original_BillID" Type="String" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="BillID" Type="String" />
                        <asp:Parameter Name="CusID" Type="String" />
                        <asp:Parameter Name="Total" Type="Double" />
                        <asp:Parameter DbType="DateTime" Name="BillDate" />
                        <asp:Parameter Name="IsPaid" Type="Boolean" />
                        <asp:Parameter Name="IsDelivered" Type="Boolean" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
    </tr>
    <tr>
        <td style="width: 225px; height: 340px; vertical-align: top;">
            &nbsp;<asp:Calendar ID="Calendar1" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" FirstDayOfWeek="Monday" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px" ShowGridLines="True" Width="220px" OnSelectionChanged="Calendar1_SelectionChanged">
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
            &nbsp;
            &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
            <table style="width: 216px">
                <tr>
                    <td colspan="3" style="width: 199px">
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:Label ID="lbCusDetail" runat="server" ForeColor="Red"
                            Text="Customer 's details " Width="125px"></asp:Label></td>
                </tr>
                <tr>
                    <td colspan="3" rowspan="2" style="width: 199px">
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
                    </td>
                </tr>
                <tr>
                </tr>
            </table>
            &nbsp;
            <asp:SqlDataSource ID="SqlDataSourceCustomer" runat="server" ConnectionString="<%$ ConnectionStrings:OSCConnection %>"
                SelectCommand="SELECT * FROM [Customer]"></asp:SqlDataSource>
        </td>
    </tr>
</table>
    &nbsp;&nbsp;
