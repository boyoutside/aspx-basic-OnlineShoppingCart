<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ManaProKindUserControl.ascx.cs" Inherits="UserControl_ManaProKindUserControl" %>
    <script type="text/javascript"> 
  
        function clickButton(e, buttonid){   
          var evt = e ? e : window.event;  
          var bt = document.getElementById(buttonid);  
          if (bt)
          {   
              if (evt.keyCode == 13)
              {   
                    bt.click();   
                    return false;
              }    
          }   
        }  
    </script>
<table style="width: 560px">
    <tr>
        <td align="center" colspan="3">
        </td>
    </tr>
    <tr>
        <td align="center" colspan="2">
            <asp:Label ID="Label1" runat="server" Font-Size="X-Large" ForeColor="#FF8000" Text="Manage Product Kind"></asp:Label></td>
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
            <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Kind ID"></asp:Label>&nbsp;</td>
        <td style="width: 204px; height: 21px">
            <asp:TextBox ID="txtKindID" runat="server" Width="178px"></asp:TextBox></td>
        <td style="width: 517px; height: 21px" align="left">
            &nbsp;</td>
    </tr>
    <tr>
        <td align="right" style="width: 245px; height: 21px">
            <asp:Label ID="Label6" runat="server" Font-Bold="True" Text="Kind Name"></asp:Label></td>
        <td style="width: 204px; height: 21px">
            <asp:TextBox ID="txtKindName" runat="server" ValidationGroup="1" Width="179px"></asp:TextBox></td>
        <td style="width: 517px; height: 21px" align="left">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtKindName"
                Display="Dynamic" ErrorMessage="Kind Name can not blank!!" SetFocusOnError="True">(*)</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtKindName"
                Display="Dynamic" ErrorMessage="Kind name must be < 50 characters long!!" SetFocusOnError="True"
                ValidationExpression="^[\w\s]{1,50}$">(*)</asp:RegularExpressionValidator></td>
    </tr>
    <tr>
        <td align="right" style="width: 245px; height: 91px;">
            <asp:Label ID="Label7" runat="server" Font-Bold="True" Text="Description"></asp:Label></td>
        <td style="width: 204px; height: 91px;">
            <asp:TextBox ID="txtDescription" runat="server" Height="85px" TextMode="MultiLine"
                Width="181px"></asp:TextBox></td>
        <td style="width: 517px; height: 91px;" align="left">
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtDescription"
                Display="Dynamic" ErrorMessage="Description can not blank!!" SetFocusOnError="True">(*)</asp:RequiredFieldValidator><asp:RegularExpressionValidator
                    ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtDescription"
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
                Font-Bold="True" Text="Update" OnClick="btnUpdate_Click" /></td>
        <td style="width: 517px; height: 21px" align="left">
            &nbsp;<asp:Button ID="btnCancel" runat="server" Font-Bold="True" Text="Cancel" CausesValidation="False" OnClick="btnCancel_Click" /></td>
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
&nbsp;&nbsp;
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
    AutoGenerateColumns="False" CellPadding="4" DataKeyNames="KindID" DataSourceID="SqlDataSource1"
    ForeColor="#333333" GridLines="None" OnRowCreated="GridView1_RowCreated" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
    <RowStyle BackColor="#EFF3FB" />
    <Columns>
        <asp:CommandField ShowSelectButton="True" />
        <asp:BoundField DataField="KindID" HeaderText="KindID" ReadOnly="True" SortExpression="KindID" />
        <asp:BoundField DataField="Kindname" HeaderText="Kindname" SortExpression="Kindname" />
        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
    </Columns>
    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <EditRowStyle BackColor="#2461BF" />
    <AlternatingRowStyle BackColor="White" />
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues"
    ConnectionString="<%$ ConnectionStrings:OSCConnection %>" DeleteCommand="DELETE FROM [ProKind] WHERE [KindID] = @original_KindID AND (([Kindname] = @original_Kindname) OR ([Kindname] IS NULL AND @original_Kindname IS NULL)) AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL))"
    InsertCommand="INSERT INTO [ProKind] ([KindID], [Kindname], [Description]) VALUES (@KindID, @Kindname, @Description)"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [ProKind]"
    UpdateCommand="UPDATE [ProKind] SET [Kindname] = @Kindname, [Description] = @Description WHERE [KindID] = @original_KindID AND (([Kindname] = @original_Kindname) OR ([Kindname] IS NULL AND @original_Kindname IS NULL)) AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL))">
    <DeleteParameters>
        <asp:Parameter Name="original_KindID" Type="String" />
        <asp:Parameter Name="original_Kindname" Type="String" />
        <asp:Parameter Name="original_Description" Type="String" />
    </DeleteParameters>
    <UpdateParameters>
        <asp:Parameter Name="Kindname" Type="String" />
        <asp:Parameter Name="Description" Type="String" />
        <asp:Parameter Name="original_KindID" Type="String" />
        <asp:Parameter Name="original_Kindname" Type="String" />
        <asp:Parameter Name="original_Description" Type="String" />
    </UpdateParameters>
    <InsertParameters>
        <asp:Parameter Name="KindID" Type="String" />
        <asp:Parameter Name="Kindname" Type="String" />
        <asp:Parameter Name="Description" Type="String" />
    </InsertParameters>
</asp:SqlDataSource>
