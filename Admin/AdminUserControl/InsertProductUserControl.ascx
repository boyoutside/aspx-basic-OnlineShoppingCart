<%@ Control Language="C#" AutoEventWireup="true" CodeFile="InsertProductUserControl.ascx.cs" Inherits="UserControl_InsertProductUserControl" %>
<table>
    <tr>
        <td style="width: 106px; height: 21px;">
        </td>
        <td style="width: 207px; height: 21px;">
        </td>
        <td style="width: 53px; height: 21px;" align="left">
        </td>
    </tr>
    <tr>
        <td align="center" colspan="2">
            <asp:Label ID="Label1" runat="server" Font-Bold="False" Font-Size="X-Large" ForeColor="#FF8000"
                Text="Register  Product"></asp:Label></td>
        <td style="width: 53px" align="left">
        </td>
    </tr>
    <tr>
        <td style="width: 106px" align="right">
        </td>
        <td style="width: 207px">
        </td>
        <td style="width: 53px" align="left">
        </td>
    </tr>
    <tr>
        <td style="width: 106px" align="right">
        </td>
        <td style="width: 207px">
        </td>
        <td style="width: 53px" align="left">
        </td>
    </tr>
    <tr>
        <td style="width: 106px; height: 26px" align="right">
            <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Product Name"></asp:Label></td>
        <td style="width: 207px; height: 26px">
            <asp:TextBox ID="txtProName" runat="server" Width="179px"></asp:TextBox></td>
        <td style="width: 53px; height: 26px" align="left">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtProName"
                Display="Dynamic" ErrorMessage="Product name can not blank!!" SetFocusOnError="True">(*)</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtProName"
                Display="Dynamic" ErrorMessage="Product name must be <50 characters long!!" SetFocusOnError="True"
                ValidationExpression="^[\w\s]{1,50}$">(*)</asp:RegularExpressionValidator></td>
    </tr>
    <tr>
        <td style="width: 106px; height: 24px" align="right">
            <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="Kind"></asp:Label></td>
        <td style="width: 207px; height: 24px">
            <asp:DropDownList ID="DropKind" runat="server" DataSourceID="SqlDataSource1" DataTextField="Kindname"
                DataValueField="KindID" Width="180px" OnSelectedIndexChanged="DropKind_SelectedIndexChanged">
            </asp:DropDownList><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OSCConnection %>"
                SelectCommand="SELECT * FROM [ProKind]"></asp:SqlDataSource>
        </td>
        <td style="width: 53px; height: 24px" align="left">
        </td>
    </tr>
    <tr>
        <td style="width: 106px; height: 21px" align="right">
            <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="Price"></asp:Label></td>
        <td style="width: 207px; height: 21px">
            <asp:TextBox ID="txtPrice" runat="server" Width="179px"></asp:TextBox></td>
        <td style="width: 53px; height: 21px" align="left">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPrice"
                Display="Dynamic" ErrorMessage="Price can not blank!!" SetFocusOnError="True">(*)</asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPrice"
                Display="Dynamic" ErrorMessage="Price must between 0 and 1.000.000.000" MaximumValue="1000000000"
                MinimumValue="0" SetFocusOnError="True" Type="Double">(*)</asp:RangeValidator></td>
    </tr>
    <tr>
        <td style="width: 106px; height: 40px;" align="right">
            <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="Quantity"></asp:Label></td>
        <td style="width: 207px; height: 40px;">
            <asp:TextBox ID="txtQuantity" runat="server" Width="180px"></asp:TextBox></td>
        <td style="width: 53px; height: 40px;" align="left">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtQuantity"
                Display="Dynamic" ErrorMessage="Quantity can not blank!!" SetFocusOnError="True">(*)</asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txtQuantity"
                Display="Dynamic" ErrorMessage="Quantity must between 0 and 1.000.000" MaximumValue="1000000"
                MinimumValue="0" SetFocusOnError="True" Type="Integer">(*)</asp:RangeValidator></td>
    </tr>
    <tr>
        <td style="width: 106px" align="right">
            <asp:Label ID="Label6" runat="server" Font-Bold="True" Text="Images"></asp:Label></td>
        <td style="width: 207px">
            <asp:FileUpload ID="FileUpload1" runat="server" /></td>
        <td style="width: 53px" align="left">
        </td>
    </tr>
    <tr>
        <td style="width: 106px; height: 40px;" align="right">
            <asp:Label ID="Label7" runat="server" Font-Bold="True" Text="Producer"></asp:Label></td>
        <td style="width: 207px; height: 40px;">
            <asp:TextBox ID="txtProducer" runat="server" Width="180px"></asp:TextBox></td>
        <td style="width: 53px; height: 40px;" align="left">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtProducer"
                Display="Dynamic" ErrorMessage="Producer can not blank!!" SetFocusOnError="True">(*)</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtProducer"
                Display="Dynamic" ErrorMessage="Producer must be <20 characters long!!" SetFocusOnError="True"
                ValidationExpression="^[\w\s]{1,20}$">(*)</asp:RegularExpressionValidator></td>
    </tr>
    <tr>
        <td style="width: 106px; height: 26px;" align="right">
            <asp:Label ID="Label8" runat="server" Font-Bold="True" Text="Warranty"></asp:Label></td>
        <td style="width: 207px; height: 26px;">
            <asp:TextBox ID="txtWarranty" runat="server" Width="180px"></asp:TextBox></td>
        <td style="width: 53px; height: 26px;" align="left">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtWarranty"
                Display="Dynamic" ErrorMessage="Warrranty can not blank!!" SetFocusOnError="True">(*)</asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator3" runat="server" ControlToValidate="txtWarranty"
                Display="Dynamic" ErrorMessage="Warranty must between 0 and 1.000" MaximumValue="1000"
                MinimumValue="0" SetFocusOnError="True" Type="Integer">(*)</asp:RangeValidator></td>
    </tr>
    <tr>
        <td style="width: 106px" align="right">
            <asp:Label ID="Label9" runat="server" Font-Bold="True" Text="Description"></asp:Label></td>
        <td style="width: 207px">
            <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine"></asp:TextBox></td>
        <td style="width: 53px" align="left">
        </td>
    </tr>
    <tr>
        <td align="center" colspan="2" style="height: 21px">
            <br />
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                ShowSummary="False" />
        </td>
        <td style="width: 53px; height: 21px" align="left">
        </td>
    </tr>
    <tr>
        <td style="width: 106px" align="right">
            <asp:Button ID="btnInsert" runat="server" Font-Bold="True" OnClick="btnInsert_Click"
                Text="Insert" /></td>
        <td style="width: 207px" align="center">
            <asp:Button ID="btnCancel" runat="server" Font-Bold="True" Text="Cancel" CausesValidation="False" OnClick="btnCancel_Click" /></td>
        <td style="width: 53px" align="left">
            &nbsp;</td>
    </tr>
</table>
