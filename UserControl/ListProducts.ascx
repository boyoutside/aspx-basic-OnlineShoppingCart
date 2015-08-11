<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ListProducts.ascx.cs" Inherits="UserControl_ListProducts" %>

<script language="javascript" type="text/javascript">
// <!CDATA[

function TABLE1_onclick() {

}

// ]]>
</script>

<table width="597">
    <tr>
        <td colspan="8" rowspan="3" align="center">
            <asp:DataList ID="DataList1" runat="server" RepeatColumns="3">
                <ItemTemplate>
                    <table style="table-layout: fixed; border-top-style: groove; border-right-style: groove; border-left-style: groove; border-collapse: collapse; border-bottom-style: groove" width="198" id="TABLE1" onclick="return TABLE1_onclick()">
                        <tr>
                            <td colspan="4" style="height: 21px" align="left">
                                ID :
                            </td>
                            <td colspan="1" style="width: 91px; height: 21px" align="right">
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("ProID","~/DetailProducts.aspx?id={0}") %>'
                                    Text='<%# Eval("ProID") %>'></asp:HyperLink></td>
                        </tr>
                        <tr>
                            <td colspan="4" align="left">
                                Name :
                            </td>
                            <td align="right" colspan="1" style="width: 91px">
                                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("ProID","~/DetailProducts.aspx?id={0}") %>'
                                    Text='<%# Eval("ProName") %>'></asp:HyperLink></td>
                        </tr>
                        <tr>
                            <td colspan="5" rowspan="2">
                                <asp:Image ID="Image1" runat="server" Height="179px" ImageUrl='<%# Eval("Images") %>'
                                    Width="191px" /></td>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                            <td align="left" colspan="1" style="width: 43px; height: 21px">
                                Price :</td>
                            <td align="right" colspan="4" style="height: 21px">
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("Price") %>' ForeColor="Red"></asp:Label>
                                $</td>
                        </tr>
                        <tr>
                            <td align="right" colspan="5" style="height: 21px">
                                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%# Eval("ProID","~/ShoppingCart.aspx?id={0}") %>'>Add to cart >></asp:HyperLink></td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
            <asp:Label ID="lbInvisible" runat="server" Text="Label" Visible="False"></asp:Label></td>
    </tr>
    <tr>
    </tr>
    <tr>
    </tr>
    <tr>
        <td colspan="8" rowspan="1" style="height: 21px" align="center">
            <asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click" ><<</asp:LinkButton>&nbsp;
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" ><</asp:LinkButton>
            &nbsp;<asp:Label ID="lbCurrent" runat="server" Text="Label" ForeColor="Blue"></asp:Label>/<asp:Label ID="lbTotal"
                runat="server" Text="Label" ForeColor="Blue"></asp:Label>&nbsp;
            <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click" >></asp:LinkButton>&nbsp;
            <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click" >>></asp:LinkButton></td>
        
    </tr>
</table>
