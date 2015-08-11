<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DetailsProduct.ascx.cs" Inherits="UserControl_DetailsProduct" %>
<table style="width: 597px">
    <tr>
        <td align="center" colspan="3" rowspan="3" style="width: 8px">
            &nbsp;<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ProID"
                DataSourceID="SqlDataSource1" PageSize="1">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <table width="598">
                                <tr>
                                    <td align="left" colspan="3" style="height: 22px">
                                        ID : &nbsp;
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("ProID") %>' Font-Bold="True"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td rowspan="6">
                                        <asp:Image ID="Image1" runat="server" Height="138px" ImageUrl='<%# Eval("Images") %>'
                                            Width="170px" /></td>
                                    <td align="left" colspan="2">
                                        Name : &nbsp;
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("ProName") %>' Font-Bold="True"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td align="left" colspan="2">
                                        Price : &nbsp; &nbsp;
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Price") %>' Font-Bold="True"></asp:Label>
                                        $</td>
                                </tr>
                                <tr>
                                    <td align="left" colspan="2" style="height: 20px">
                                        Kind : &nbsp; &nbsp;
                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("KindID") %>' Font-Bold="True"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td align="left" colspan="2">
                                        Producer : &nbsp;&nbsp;
                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("Producer") %>' Font-Bold="True"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td align="left" colspan="2" style="height: 21px">
                                        Warranty : &nbsp;&nbsp;
                                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("Warranty") %>' Font-Bold="True"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td align="left" colspan="2" style="height: 16px">
                                        Description : &nbsp;
                                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("Description") %>' Font-Bold="True"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="height: 21px">
                                    </td>
                                    <td style="width: 166px; height: 21px">
                                    </td>
                                    <td style="width: 247px; height: 21px">
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Home.aspx"><< View Products</asp:HyperLink></td>
                                    <td style="width: 166px">
                                    </td>
                                    <td align="right" style="width: 247px">
                                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("ProID","~/ShoppingCart.aspx?id={0}") %>'>Add to cart >></asp:HyperLink></td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OSCConnection %>"
                SelectCommand="SELECT * FROM [Product] where ProID = @ProID">
                <SelectParameters>
                    <asp:QueryStringParameter Name="ProID" QueryStringField="id" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
    <tr>
    </tr>
    <tr>
    </tr>
    <tr>
        <td colspan="3" rowspan="1" style="width: 8px">
        </td>
    </tr>
</table>
