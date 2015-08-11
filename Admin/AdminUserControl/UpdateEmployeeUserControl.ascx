<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UpdateEmployeeUserControl.ascx.cs" Inherits="UserControl_UpdateEmployeeUserControl" %>
<table style="width: 430px">
    <tr>
        <td colspan="3">
        </td>
    </tr>
    <tr>
        <td align="center" colspan="2">
            <asp:Label ID="Label1" runat="server" Font-Size="XX-Large" ForeColor="#FF8000" Text="Update Employee"></asp:Label></td>
        <td align="left">
        </td>
    </tr>
    <tr>
        <td style="width: 129px">
        </td>
        <td style="width: 197px">
        </td>
        <td align="left">
        </td>
    </tr>
    <tr>
        <td style="width: 129px">
        </td>
        <td style="width: 197px">
        </td>
        <td align="left">
        </td>
    </tr>
    <tr>
        <td style="width: 129px" align="right">
            <asp:Label ID="Label6" runat="server" Font-Bold="True" Text="User Name"></asp:Label></td>
        <td style="width: 197px">
            <asp:TextBox ID="txtUser" runat="server" Enabled="False" Width="179px"></asp:TextBox></td>
        <td align="left">
        </td>
    </tr>
    <tr>
        <td style="width: 129px" align="right">
            <asp:Label ID="Label7" runat="server" Font-Bold="True" Text="Password"></asp:Label></td>
        <td style="width: 197px">
            <asp:TextBox ID="txtPass" runat="server" Width="179px" TextMode="Password"></asp:TextBox></td>
        <td align="left">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPass"
                Display="Dynamic" ErrorMessage="Password can not blank!!" SetFocusOnError="True">(*)</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPass"
                Display="Dynamic" ErrorMessage="Password must be between 6 and 20 characters long!!"
                SetFocusOnError="True" ValidationExpression="^[\w\s]{6,20}$">(*)</asp:RegularExpressionValidator></td>
    </tr>
    <tr>
        <td style="width: 129px; height: 21px" align="right">
            <asp:Label ID="Label8" runat="server" Font-Bold="True" Text="Confirm Password"></asp:Label></td>
        <td style="width: 197px; height: 21px">
            <asp:TextBox ID="txtConfirm" runat="server" Width="180px" TextMode="Password"></asp:TextBox></td>
        <td style="height: 21px" align="left">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtConfirm"
                Display="Dynamic" ErrorMessage="Confirm password can not blank!!" SetFocusOnError="True">(*)</asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPass"
                ControlToValidate="txtConfirm" Display="Dynamic" ErrorMessage="Confirm password must be same Password!!"
                SetFocusOnError="True">(*)</asp:CompareValidator></td>
    </tr>
    <tr>
        <td style="height: 59px;" align="center" colspan="2">
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                ShowSummary="False" />
        </td>
        <td style="height: 59px" align="left">
        </td>
    </tr>
    <tr>
        <td style="width: 129px; height: 26px;" align="right">
            <asp:Button ID="btnUpdate" runat="server" Font-Bold="True" OnClick="btnUpdate_Click"
                Text="Update" />&nbsp;</td>
        <td style="width: 197px; height: 26px;" align="center">
            <asp:Button ID="btnCancel" runat="server" Font-Bold="True" Text="Cancel" OnClick="btnCancel_Click" CausesValidation="False" /></td>
        <td style="height: 26px" align="left">
        </td>
    </tr>
    <tr>
        <td style="width: 129px">
        </td>
        <td style="width: 197px">
        </td>
        <td align="left">
        </td>
    </tr>
</table>
