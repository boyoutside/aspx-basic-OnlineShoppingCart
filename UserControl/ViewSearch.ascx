<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ViewSearch.ascx.cs" Inherits="UserControl_ViewSearch" %>
<table width="597">
    <tr>
        <td colspan="3" rowspan="3" align="center">
            <asp:DataList ID="DataList1" runat="server" RepeatColumns="3">
                <ItemTemplate>
                    <table width="196">
                        <tr>
                            <td colspan="3" style="height: 21px; width: 31px;" align="left">
                                ID : 
                            </td>
                            <td align="right" colspan="1" style="width: 1px; height: 21px">
                                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("ProID","~/DetailProducts.aspx?id={0}") %>'
                                    Text='<%# Eval("ProID") %>'></asp:HyperLink></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="width: 31px" align="left">
                                Name :
                            </td>
                            <td align="right" colspan="1" style="width: 1px">
                                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%# Eval("ProID","~/DetailProducts.aspx?id={0}") %>'
                                    Text='<%# Eval("ProName") %>'></asp:HyperLink></td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <asp:Image ID="Image1" runat="server" Height="187px" ImageUrl='<%# Eval("Images") %>'
                                    Width="191px" /></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="width: 31px" align="left">
                                Price : 
                            </td>
                            <td align="right" colspan="1" style="width: 1px">
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("Price")+"$" %>' ForeColor="Red"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="right" colspan="4">
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("ProID","~/ShoppingCart.aspx?id={0}") %>'>Add to cart >></asp:HyperLink></td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
        </td>
    </tr>
    <tr>
    </tr>
    <tr>
    </tr>
</table>
