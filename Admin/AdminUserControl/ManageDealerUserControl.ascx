<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ManageDealerUserControl.ascx.cs" Inherits="UserControl_ManageDealerUserControl" %>
<table style="width: 560px">
    <tr>
        <td align="center" colspan="3">
        </td>
    </tr>
    <tr>
        <td align="center" colspan="2">
            <asp:Label ID="Label1" runat="server" Font-Size="X-Large" ForeColor="#FF8000" Text="Manage Dealer"></asp:Label></td>
        <td style="width: 517px" align="left">
        </td>
    </tr>
    <tr>
        <td colspan="2">
        </td>
        <td style="width: 517px" align="left">
        </td>
    </tr>
    <tr>
        <td colspan="2" style="height: 21px">
        </td>
        <td style="width: 517px; height: 21px" align="left">
        </td>
    </tr>
    <tr>
        <td align="right" style="width: 245px; height: 21px">
            <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Dealer ID"></asp:Label>&nbsp;</td>
        <td style="width: 204px; height: 21px">
            <asp:TextBox ID="txtDealerID" runat="server" Width="178px"></asp:TextBox></td>
        <td style="width: 517px; height: 21px" align="left">
            &nbsp;</td>
    </tr>
    <tr>
        <td align="right" style="width: 245px; height: 21px">
            <asp:Label ID="Label6" runat="server" Font-Bold="True" Text="Dealer Name"></asp:Label></td>
        <td style="width: 204px; height: 21px">
            <asp:TextBox ID="txtDealerName" runat="server" ValidationGroup="1" Width="179px"></asp:TextBox></td>
        <td style="width: 517px; height: 21px" align="left">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDealerName"
                Display="Dynamic" ErrorMessage="Dealer Name can not blank!!" SetFocusOnError="True">(*)</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtDealerName"
                Display="Dynamic" ErrorMessage="Dealer name must be < 50 characters long!!" SetFocusOnError="True"
                ValidationExpression="^[\w\s]{1,50}$">(*)</asp:RegularExpressionValidator></td>
    </tr>
    <tr>
        <td align="right" style="width: 245px; height: 71px">
            <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="Address"></asp:Label></td>
        <td style="width: 204px; height: 71px">
            <asp:TextBox ID="txtAddress" runat="server" Height="78px" TextMode="MultiLine"></asp:TextBox></td>
        <td style="width: 517px; height: 71px" align="left">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAddress"
                Display="Dynamic" ErrorMessage="Address can not blank!!" SetFocusOnError="True">(*)</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtAddress"
                Display="Dynamic" ErrorMessage="Address must be < 300 characters long!!" ValidationExpression="^[\w\s]{1,300}$">(*)</asp:RegularExpressionValidator></td>
    </tr>
    <tr>
        <td align="right" style="width: 245px">
            <asp:Label ID="Label7" runat="server" Font-Bold="True" Text="Description"></asp:Label></td>
        <td style="width: 204px">
            <asp:TextBox ID="txtDescription" runat="server" Height="85px" TextMode="MultiLine"
                Width="181px"></asp:TextBox></td>
        <td style="width: 517px" align="left">
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtDescription"
                Display="Dynamic" ErrorMessage="Description can not blank!!" SetFocusOnError="True">(*)</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtDescription"
                Display="Dynamic" ErrorMessage="Description must be < 300 characters long!!"
                SetFocusOnError="True" ValidationExpression="^[\w\s]{1,300}$">(*)</asp:RegularExpressionValidator></td>
    </tr>
    <tr>
        <td align="center" colspan="2" style="height: 21px">
            <br />
            &nbsp;<asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                ShowSummary="False" />
        </td>
        <td style="width: 517px; height: 21px" align="left">
        </td>
    </tr>
    <tr>
        <td style="width: 245px; height: 26px">
        </td>
        <td style="width: 204px; height: 26px">
        </td>
        <td style="width: 517px; height: 26px" align="left">
        </td>
    </tr>
    <tr>
        <td style="width: 245px; height: 21px">
            <asp:Button ID="btnSearch" runat="server" Font-Bold="True" OnClick="btnSearch_Click"
                Text="Search" CausesValidation="False" /></td>
        <td style="width: 204px; height: 21px">
            <asp:Button ID="btnInsert" runat="server" Font-Bold="True" OnClick="btnInsert_Click"
                Text="Insert" />
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;<asp:Button ID="btnUpdate" runat="server"
                Font-Bold="True" OnClick="btnUpdate_Click" Text="Update" /></td>
        <td style="width: 517px; height: 21px" align="left">
            &nbsp;<asp:Button ID="btnCancel" runat="server" Font-Bold="True" OnClick="btnCancel_Click"
                Text="Cancel" CausesValidation="False" /></td>
    </tr>
    <tr>
        <td style="width: 245px">
        </td>
        <td style="width: 204px">
        </td>
        <td style="width: 517px">
        </td>
    </tr>
</table>
<br />
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
    AutoGenerateColumns="False" CellPadding="4" DataKeyNames="DealerID" DataSourceID="SqlDataSource1"
    ForeColor="#333333" GridLines="None" OnRowCreated="GridView1_RowCreated" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
    <RowStyle BackColor="#EFF3FB" />
    <Columns>
        <asp:CommandField ShowSelectButton="True" />
        <asp:BoundField DataField="DealerID" HeaderText="DealerID" ReadOnly="True" SortExpression="DealerID" />
        <asp:BoundField DataField="DealName" HeaderText="DealName" SortExpression="DealName" />
        <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
        <asp:BoundField DataField="Desription" HeaderText="Desription" SortExpression="Desription" />
    </Columns>
    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <EditRowStyle BackColor="#2461BF" />
    <AlternatingRowStyle BackColor="White" />
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues"
    ConnectionString="<%$ ConnectionStrings:OSCConnection %>" DeleteCommand="DELETE FROM [Dealer] WHERE [DealerID] = @original_DealerID AND (([DealName] = @original_DealName) OR ([DealName] IS NULL AND @original_DealName IS NULL)) AND (([Address] = @original_Address) OR ([Address] IS NULL AND @original_Address IS NULL)) AND (([Desription] = @original_Desription) OR ([Desription] IS NULL AND @original_Desription IS NULL))"
    InsertCommand="INSERT INTO [Dealer] ([DealerID], [DealName], [Address], [Desription]) VALUES (@DealerID, @DealName, @Address, @Desription)"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Dealer]"
    UpdateCommand="UPDATE [Dealer] SET [DealName] = @DealName, [Address] = @Address, [Desription] = @Desription WHERE [DealerID] = @original_DealerID AND (([DealName] = @original_DealName) OR ([DealName] IS NULL AND @original_DealName IS NULL)) AND (([Address] = @original_Address) OR ([Address] IS NULL AND @original_Address IS NULL)) AND (([Desription] = @original_Desription) OR ([Desription] IS NULL AND @original_Desription IS NULL))">
    <DeleteParameters>
        <asp:Parameter Name="original_DealerID" Type="String" />
        <asp:Parameter Name="original_DealName" Type="String" />
        <asp:Parameter Name="original_Address" Type="String" />
        <asp:Parameter Name="original_Desription" Type="String" />
    </DeleteParameters>
    <UpdateParameters>
        <asp:Parameter Name="DealName" Type="String" />
        <asp:Parameter Name="Address" Type="String" />
        <asp:Parameter Name="Desription" Type="String" />
        <asp:Parameter Name="original_DealerID" Type="String" />
        <asp:Parameter Name="original_DealName" Type="String" />
        <asp:Parameter Name="original_Address" Type="String" />
        <asp:Parameter Name="original_Desription" Type="String" />
    </UpdateParameters>
    <InsertParameters>
        <asp:Parameter Name="DealerID" Type="String" />
        <asp:Parameter Name="DealName" Type="String" />
        <asp:Parameter Name="Address" Type="String" />
        <asp:Parameter Name="Desription" Type="String" />
    </InsertParameters>
</asp:SqlDataSource>
<br />
<br />
