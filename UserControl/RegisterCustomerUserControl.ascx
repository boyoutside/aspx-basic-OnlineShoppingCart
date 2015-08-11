<%@ Control Language="C#" AutoEventWireup="true" CodeFile="RegisterCustomerUserControl.ascx.cs" Inherits="UserControl_RegisterCustomerUserControl" %>
<table width="430">
    <tr>
        <td colspan="3">
        </td>
    </tr>
    <tr>
        <td align="center" colspan="2">
            <asp:Label ID="Label1" runat="server" Font-Size="XX-Large" ForeColor="#FF8000" Text="Register Customer"></asp:Label></td>
        <td>
        </td>
    </tr>
    <tr>
        <td style="width: 130px; height: 21px">
        </td>
        <td style="width: 223px; height: 21px">
        </td>
        <td style="height: 21px">
        </td>
    </tr>
    <tr>
        <td style="width: 130px">
        </td>
        <td style="width: 223px">
        </td>
        <td>
        </td>
    </tr>
    <tr>
        <td style="width: 130px; height: 40px;" align="right">
            <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="User Name"></asp:Label></td>
        <td style="width: 223px; height: 40px;">
            <asp:TextBox ID="txtUser" runat="server" Width="180px"></asp:TextBox></td>
        <td style="height: 40px">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUser"
                Display="Dynamic" ErrorMessage="User name can not blank!!" SetFocusOnError="True">(*)</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtUser"
                Display="Dynamic" ErrorMessage="User name must be < 20 characters long!!" SetFocusOnError="True"
                ValidationExpression="^[\w\s]{1,20}$">(*)</asp:RegularExpressionValidator></td>
    </tr>
    <tr>
        <td style="width: 130px; height: 26px;" align="right">
            <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="Password"></asp:Label></td>
        <td style="width: 223px; height: 26px;">
            <asp:TextBox ID="txtPass" runat="server" Width="180px" TextMode="Password"></asp:TextBox></td>
        <td style="height: 26px">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPass"
                Display="Dynamic" ErrorMessage="Password can not blank!!" SetFocusOnError="True">(*)</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPass"
                Display="Dynamic" ErrorMessage="Password must be between 6 and 20 characters long!!"
                SetFocusOnError="True" ValidationExpression="^[\w\s]{6,20}$">(*)</asp:RegularExpressionValidator></td>
    </tr>
    <tr>
        <td style="width: 130px; height: 21px" align="right">
            <asp:Label ID="Label9" runat="server" Font-Bold="True" Text="Confirm Password"></asp:Label></td>
        <td style="width: 223px; height: 21px">
            <asp:TextBox ID="txtConfirm" runat="server" Width="180px" TextMode="Password"></asp:TextBox></td>
        <td style="height: 21px">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtConfirm"
                Display="Dynamic" ErrorMessage="Confirm password can not blank!!" SetFocusOnError="True">(*)</asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPass"
                ControlToValidate="txtConfirm" Display="Dynamic" ErrorMessage="Confirm password must be same Password!!"
                SetFocusOnError="True">(*)</asp:CompareValidator></td>
    </tr>
    <tr>
        <td style="width: 130px; height: 26px;" align="right">
            <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Full Name"></asp:Label></td>
        <td style="width: 223px; height: 26px;">
            <asp:TextBox ID="txtName" runat="server" Width="180px"></asp:TextBox></td>
        <td style="height: 26px">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtName"
                Display="Dynamic" ErrorMessage="Full name can not bank!!" SetFocusOnError="True">(*)</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtName"
                Display="Dynamic" ErrorMessage="Full name must be < 50 characters long!!" SetFocusOnError="True"
                ValidationExpression="^[\w\s]{1,50}$">(*)</asp:RegularExpressionValidator></td>
    </tr>
    <tr>
        <td style="width: 130px; height: 21px" align="right">
            <asp:Label ID="Label6" runat="server" Font-Bold="True" Text="Personal ID"></asp:Label></td>
        <td style="width: 223px; height: 21px">
            <asp:TextBox ID="txtIC" runat="server" Width="180px"></asp:TextBox></td>
        <td style="height: 21px">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtIC"
                Display="Dynamic" ErrorMessage="Personal ID can not blank!!" SetFocusOnError="True">(*)</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtIC"
                Display="Dynamic" ErrorMessage="Personal ID must be a number digit, length must be between 8 and 20 characters long!!"
                SetFocusOnError="True" ValidationExpression="\d{8,20}">(*)</asp:RegularExpressionValidator></td>
    </tr>
    <tr>
        <td style="width: 130px; height: 21px" align="right">
            <asp:Label ID="Label7" runat="server" Font-Bold="True" Text="Phone"></asp:Label></td>
        <td style="width: 223px; height: 21px">
            <asp:TextBox ID="txtPhone" runat="server" Width="180px"></asp:TextBox></td>
        <td style="height: 21px">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPhone"
                Display="Dynamic" ErrorMessage="Phone can not blank!!" SetFocusOnError="True">(*)</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtPhone"
                Display="Dynamic" ErrorMessage="Phone must be a number digit, length must be between 8 and 20 characters long!!"
                SetFocusOnError="True" ValidationExpression="\d{8,20}">(*)</asp:RegularExpressionValidator></td>
    </tr>
    <tr>
        <td style="width: 130px; height: 21px" align="right">
            <asp:Label ID="Label8" runat="server" Font-Bold="True" Text="Email"></asp:Label></td>
        <td style="width: 223px; height: 21px">
            <asp:TextBox ID="txtEmail" runat="server" Width="180px"></asp:TextBox></td>
        <td style="height: 21px">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtEmail"
                Display="Dynamic" ErrorMessage="Email can not blank!!" SetFocusOnError="True">(*)</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtEmail"
                Display="Dynamic" ErrorMessage="Invalid email !!" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">(*)</asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td style="width: 130px" align="right">
            <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="Address"></asp:Label></td>
        <td style="width: 223px">
            <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine"></asp:TextBox></td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtAddress"
                Display="Dynamic" ErrorMessage="Address can not blank!!" SetFocusOnError="True">(*)</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="txtAddress"
                Display="Dynamic" ErrorMessage="Address must be < 300 character long!!" SetFocusOnError="True"
                ValidationExpression="^[\w\s]{1,300}$">(*)</asp:RegularExpressionValidator></td>
    </tr>
    <tr>
        <td style="height: 21px" colspan="3">
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
        </td>
    </tr>
    <tr>
        <td style="width: 130px; height: 21px" align="right">
            <asp:Button ID="btnInsert" runat="server" Font-Bold="True" OnClick="btnInsert_Click"
                Text="Register" /></td>
        <td style="width: 223px; height: 21px" align="center">
            <asp:Button ID="btnCancel" runat="server" Font-Bold="True" OnClick="btnCancel_Click"
                Text="Cancel" CausesValidation="False" /></td>
        <td style="height: 21px">
        </td>
    </tr>
    <tr>
        <td style="width: 130px; height: 21px">
        </td>
        <td style="width: 223px; height: 21px">
        </td>
        <td style="height: 21px">
        </td>
    </tr>
</table>
