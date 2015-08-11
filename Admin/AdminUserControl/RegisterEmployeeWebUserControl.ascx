<%@ Control Language="C#" AutoEventWireup="true" CodeFile="RegisterEmployeeWebUserControl.ascx.cs" Inherits="UserControl_RegisterEmployeeWebUserControl" %>
<table style="width: 430px">
    <tr>
        <td align="center" colspan="3">
        </td>
    </tr>
    <tr>
        <td align="center" colspan="2">
            <asp:Label ID="Label1" runat="server" Font-Size="XX-Large" ForeColor="#FF8000" Text="Register Employee"></asp:Label></td>
        <td>
        </td>
    </tr>
    <tr>
        <td colspan="2">
        </td>
        <td>
        </td>
    </tr>
    <tr>
        <td colspan="2">
        </td>
        <td>
        </td>
    </tr>
    <tr>
        <td style="width: 131px; height: 21px">
            <asp:Label ID="Label6" runat="server" Font-Bold="True" Text="User Name"></asp:Label></td>
        <td style="width: 194px; height: 21px">
            <asp:TextBox ID="txtUser" runat="server" Width="185px" ValidationGroup="1"></asp:TextBox></td>
        <td style="height: 21px">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUser"
                Display="Dynamic" ErrorMessage="User name can not blank!!" SetFocusOnError="True">(*)</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtUser"
                Display="Dynamic" ErrorMessage="User name must be < 20 characters long!!" ValidationExpression="^[\w\s]{1,20}$" SetFocusOnError="True">(*)</asp:RegularExpressionValidator></td>
    </tr>
    <tr>
        <td style="width: 131px">
            <asp:Label ID="Label7" runat="server" Font-Bold="True" Text="Password"></asp:Label></td>
        <td style="width: 194px">
            <asp:TextBox ID="txtPass" runat="server" Width="186px" ValidationGroup="1" TextMode="Password"></asp:TextBox></td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPass"
                Display="Dynamic" ErrorMessage="Password can not blank!!" SetFocusOnError="True">(*)</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Password must be between 6 and 20 characters long!!"
                ValidationExpression="^[\w\s]{6,20}$" ControlToValidate="txtPass" Display="Dynamic" SetFocusOnError="True">(*)</asp:RegularExpressionValidator></td>
    </tr>
    <tr>
        <td style="width: 131px; height: 20px">
            <asp:Label ID="Label8" runat="server" Font-Bold="True" Text="Confirm Password"></asp:Label></td>
        <td style="width: 194px; height: 20px">
            <asp:TextBox ID="txtConfirm" runat="server" Width="185px" TextMode="Password"></asp:TextBox></td>
        <td style="height: 20px">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtConfirm"
                Display="Dynamic" ErrorMessage="Confirm password can not blank!!" SetFocusOnError="True">(*)</asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPass"
                ControlToValidate="txtConfirm" Display="Dynamic" ErrorMessage="Confirm password must be same Password!!" SetFocusOnError="True">(*)</asp:CompareValidator></td>
    </tr>
    <tr>
        <td style="width: 131px; height: 26px">
            <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Employee Name"></asp:Label></td>
        <td style="width: 194px; height: 26px">
            <asp:TextBox ID="txtName" runat="server" Width="186px"></asp:TextBox></td>
        <td style="height: 26px">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtName"
                Display="Dynamic" ErrorMessage="Employee name can not blank!!" SetFocusOnError="True">(*)</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtName"
                Display="Dynamic" ErrorMessage="Employee name must be < 50 characters long!!"
                SetFocusOnError="True" ValidationExpression="^[\w\s]{1,50}$">(*)</asp:RegularExpressionValidator></td>
    </tr>
    <tr>
        <td style="width: 131px; height: 56px">
            <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="Address"></asp:Label></td>
        <td style="width: 194px; height: 56px">
            <asp:TextBox ID="txtAddress" runat="server" Height="57px" TextMode="MultiLine" Width="186px"></asp:TextBox></td>
        <td style="height: 56px">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtAddress"
                Display="Dynamic" ErrorMessage="Address can not blank!!" SetFocusOnError="True">(*)</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtAddress"
                Display="Dynamic" ErrorMessage="Address must be < 300 characters long!!" SetFocusOnError="True"
                ValidationExpression="^[\w\s]{1,300}$">(*)</asp:RegularExpressionValidator></td>
    </tr>
    <tr>
        <td style="width: 131px">
            <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="Roll"></asp:Label></td>
        <td style="width: 194px">
            <asp:DropDownList ID="DropRoll" runat="server" DataSourceID="SqlDataSource1" DataTextField="RollName"
                DataValueField="RollID" Width="184px">
            </asp:DropDownList><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OSCConnection %>"
                SelectCommand="SELECT * FROM [Roll] WHERE RollID != 'R03'"></asp:SqlDataSource>
        </td>
        <td>
            &nbsp;
        </td>
    </tr>
    <tr>
        <td style="width: 131px">
            <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="Dealer"></asp:Label></td>
        <td style="width: 194px">
            <asp:DropDownList ID="DropDealer" runat="server" DataSourceID="SqlDataSource2" DataTextField="DealName"
                DataValueField="DealerID" Width="184px">
            </asp:DropDownList><asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:OSCConnection %>"
                SelectCommand="SELECT * FROM [Dealer]"></asp:SqlDataSource>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td align="center" colspan="2" style="height: 21px">
            <br />
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                ShowSummary="False" />
        </td>
        <td style="height: 21px">
        </td>
    </tr>
    <tr>
        <td style="width: 131px; height: 26px;">
            <asp:Button ID="btnInsert" runat="server" Font-Bold="True" OnClick="btnInsert_Click"
                Text="Insert" /></td>
        <td style="width: 194px; height: 26px;">
            <asp:Button ID="btnCancel" runat="server" Font-Bold="True" OnClick="btnCancel_Click"
                Text="Cancel" CausesValidation="False" /></td>
        <td style="height: 26px">
        </td>
    </tr>
    <tr>
        <td style="width: 131px">
        </td>
        <td style="width: 194px">
        </td>
        <td>
        </td>
    </tr>
    <tr>
        <td style="width: 131px">
        </td>
        <td style="width: 194px">
        </td>
        <td>
        </td>
    </tr>
</table>
