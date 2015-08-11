<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CartItem.ascx.cs" Inherits="UserControl_CartItem" %>
<script language="javascript" type="text/javascript">
<!--

function TABLE1_onclick() {

}

// -->
</script>


<asp:Panel ID="Panel2" runat="server" Width="599px">

<table width="598">
    <tr>
        <td colspan="6" rowspan="3">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                ForeColor="#333333" GridLines="None" Width="592px" OnRowCommand="GridView1_RowCommand">
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <Columns>
                    <asp:TemplateField HeaderText="Products ID">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("proID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("proName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Quantity">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("quantity") %>' Width="34px" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Price">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("price") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Total">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("total") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument='<%# Eval("proID") %>'
                                CommandName="Sua" ImageUrl="~/Images/Banner/Edit.gif" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButton2" runat="server" CommandArgument='<%# Eval("proID") %>'
                                CommandName="Xoa" ImageUrl="~/Images/Banner/Delete.gif" ToolTip="Delete Products" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
        </td>
    </tr>
    <tr>
    </tr>
    <tr>
    </tr>
    <tr>
        <td align="right" colspan="1" rowspan="1">
            There is &nbsp;<asp:Label ID="lbCount" runat="server" ForeColor="#C00000" Font-Bold="True"></asp:Label>
            item(s)
            in your cart.</td>
        <td align="right" colspan="5" rowspan="1" style="width: 230px">
            Total pay :
            <asp:Label ID="lbTotal" runat="server" ForeColor="#C00000" Font-Bold="True"></asp:Label>
            $</td>
    </tr>
    <tr>
        <td align="right" colspan="6" rowspan="1" style="height: 21px">
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Clear" />
            <asp:Button ID="Button1" runat="server" Text="Order" OnClick="Button1_Click" /></td>
    </tr>
    <tr>
        <td align="left" colspan="6" rowspan="1" style="height: 21px">
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Home.aspx"><< View Products</asp:HyperLink></td>
    </tr>
</table>
    After change the Quantity, you must click on
    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/Banner/Edit.gif" />
    to save the value.</asp:Panel>
<br />
<asp:Panel ID="Panel1" runat="server" Width="598px" HorizontalAlign="Center" Height="224px">
    <table width="598">
        <tr>
            <td colspan="4" style="height: 4px">
                <strong><span style="text-align: center"></span></strong>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <strong><span>
                    <asp:Label ID="Label16" runat="server" Font-Bold="True" Font-Size="Large" Text="Check Your Cart"></asp:Label></span></strong></td>
        </tr>
        <tr>
            <td colspan="4" style="height: 122px" align="center">
                <strong><span style="font-size: 14pt">
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" PageSize="1" Width="591px" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <Columns>
                        <asp:TemplateField HeaderText="Produc ID">
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("proID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Product Name">
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("proName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Quantity">
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("quantity") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Price">
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%# Eval("price") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Amount">
                            <ItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# Eval("total") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                    </Columns>
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                </span></strong>
            </td>
        </tr>
        <tr>
            <td align="right" colspan="4">
                Total pay :
                <asp:Label ID="lbTotalView" runat="server" Font-Bold="True" Text="Label" ForeColor="Red"></asp:Label>
                $</td>
        </tr>
        <tr>
            <td align="center" colspan="4" style="height: 24px">
                <strong><span style="font-size: 14pt">Check Private Information</span></strong></td>
        </tr>
        <tr>
            <td align="center" colspan="4" rowspan="2">
                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <table width="590">
                                    <tr>
                                        <td align="right" style="width: 233px">
                                            Customer ID :</td>
                                        <td colspan="2">
                                            <asp:Label ID="Label17" runat="server" Font-Bold="True" Text='<%# Eval("CusID") %>'></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 233px" align="right">
                                            User Name :
                                        </td>
                                        <td colspan="2">
                                            <asp:Label ID="Label10" runat="server" Font-Bold="True" Text='<%# Eval("UserName") %>'></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 233px; height: 21px" align="right">
                                            Customer Name :</td>
                                        <td colspan="2" style="height: 21px">
                                            <asp:Label ID="Label11" runat="server" Font-Bold="True" Text='<%# Eval("CusName") %>'></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 233px" align="right">
                                            Personal ID :</td>
                                        <td colspan="2">
                                            <asp:Label ID="Label12" runat="server" Font-Bold="True" Text='<%# Eval("IC") %>'></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="width: 233px; height: 21px">
                                            Phone :</td>
                                        <td colspan="2" style="height: 21px">
                                            <asp:Label ID="Label13" runat="server" Font-Bold="True" Text='<%# Eval("Phone") %>'></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="width: 233px">
                                            Email :</td>
                                        <td colspan="2">
                                            <asp:Label ID="Label14" runat="server" Font-Bold="True" Text='<%# Eval("Email") %>'></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="width: 233px">
                                            Address :</td>
                                        <td colspan="2">
                                            <asp:Label ID="Label15" runat="server" Font-Bold="True" Text='<%# Eval("Address") %>'></asp:Label></td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
        </tr>
        <tr>
            <td align="center" colspan="4">
                <strong><span style="font-size: 14pt">Fill Information</span></strong></td>
        </tr>
        <tr>
            <td align="center" colspan="4" style="height: 21px" valign="top">
                Transportation :&nbsp;<asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td align="center" colspan="4" valign="top">
                Payment :&nbsp;<asp:DropDownList ID="DropDownList2" runat="server" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td align="right" colspan="4" rowspan="4">
                <asp:Button ID="bSubmit" runat="server" OnClick="bSubmit_Click" Text="Submit" />
                <asp:Button ID="bCancel" runat="server" OnClick="bCancel_Click" Text="Cancel" /></td>
        </tr>
        <tr>
        </tr>
        <tr>
        </tr>
        <tr>
        </tr>
    </table>
</asp:Panel>
