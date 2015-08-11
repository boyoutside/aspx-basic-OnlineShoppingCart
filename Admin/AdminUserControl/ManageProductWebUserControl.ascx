<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ManageProductWebUserControl.ascx.cs" Inherits="UserControl_ManageProductWebUserControl" %>
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
<table width="600">
    <tr>
        <td style="width: 106px">
        </td>
        <td style="width: 207px">
        </td>
        <td style="width: 362px; height: 21px;" align="left">
        </td>
    </tr>
    <tr>
        <td align="center" colspan="2">
            <asp:Label ID="Label1" runat="server" Font-Bold="False" Font-Size="X-Large" ForeColor="#FF8000"
                Text="Update  Product"></asp:Label></td>
        <td style="width: 362px" align="left">
        </td>
    </tr>
    <tr>
        <td style="width: 106px">
        </td>
        <td style="width: 207px">
        </td>
        <td style="width: 362px" align="left">
        </td>
    </tr>
    <tr>
        <td style="width: 106px" align="right">
            <asp:Label ID="Label10" runat="server" Font-Bold="True" Text="Product ID"></asp:Label></td>
        <td style="width: 207px">
            <asp:TextBox ID="txtProID" runat="server" Width="179px"></asp:TextBox></td>
        <td style="width: 100px" align="left">
        </td>
    </tr>
    <tr>
        <td style="width: 106px; height: 26px" align="right">
            <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Product Name"></asp:Label></td>
        <td style="width: 207px; height: 26px">
            <asp:TextBox ID="txtProName" runat="server" Width="179px"></asp:TextBox></td>
        <td style="width: 362px; height: 26px" align="left">
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
                DataValueField="KindID" Width="180px">
            </asp:DropDownList><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OSCConnection %>"
                SelectCommand="SELECT * FROM [ProKind]"></asp:SqlDataSource>
        </td>
        <td style="width: 100px; height: 24px" align="left">
        </td>
    </tr>
    <tr>
        <td style="width: 106px; height: 21px" align="right">
            <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="Price"></asp:Label></td>
        <td style="width: 207px; height: 21px">
            <asp:TextBox ID="txtPrice" runat="server" Width="179px"></asp:TextBox></td>
        <td style="width: 362px; height: 21px" align="left">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPrice"
                Display="Dynamic" ErrorMessage="Price can not blank!!" SetFocusOnError="True">(*)</asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPrice"
                Display="Dynamic" ErrorMessage="Price must between 0 and 1.000.000.000" MaximumValue="1000000000"
                MinimumValue="0" SetFocusOnError="True" Type="Double">(*)</asp:RangeValidator></td>
    </tr>
    <tr>
        <td style="width: 106px; height: 40px" align="right">
            <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="Quantity"></asp:Label></td>
        <td style="width: 207px; height: 40px">
            <asp:TextBox ID="txtQuantity" runat="server" Width="180px"></asp:TextBox></td>
        <td style="width: 362px; height: 40px" align="left">
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
        <td style="width: 362px" align="left">
        </td>
    </tr>
    <tr>
        <td style="width: 106px; height: 40px" align="right">
            <asp:Label ID="Label7" runat="server" Font-Bold="True" Text="Producer"></asp:Label></td>
        <td style="width: 207px; height: 40px">
            <asp:TextBox ID="txtProducer" runat="server" Width="180px"></asp:TextBox></td>
        <td style="width: 362px; height: 40px" align="left">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtProducer"
                Display="Dynamic" ErrorMessage="Producer can not blank!!" SetFocusOnError="True">(*)</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtProducer"
                Display="Dynamic" ErrorMessage="Producer must be <20 characters long!!" SetFocusOnError="True"
                ValidationExpression="^[\w\s]{1,20}$">(*)</asp:RegularExpressionValidator></td>
    </tr>
    <tr>
        <td style="width: 106px" align="right">
            <asp:Label ID="Label8" runat="server" Font-Bold="True" Text="Warranty"></asp:Label></td>
        <td style="width: 207px">
            <asp:TextBox ID="txtWarranty" runat="server" Width="180px"></asp:TextBox></td>
        <td style="width: 362px" align="left">
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
        <td style="width: 362px" align="left">
        </td>
    </tr>
    <tr>
        <td align="center" colspan="2" style="height: 21px">
            <br />
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                ShowSummary="False" />
        </td>
        <td style="width: 362px; height: 21px" align="left">
        </td>
    </tr>
    <tr>
        <td style="width: 106px" align="right">
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CausesValidation="False" Font-Bold="True" /><td style="width: 207px" align="center">
                &nbsp;<asp:Button ID="btnUpdate" runat="server" Text="Update" Font-Bold="True" OnClick="btnUpdate_Click" /></td>
        <td style="width: 362px" align="left">
            <asp:Button ID="btnCancel" runat="server" Font-Bold="True" Text="Cancel" OnClick="btnCancel_Click" CausesValidation="False" /></td>
    </tr>
</table>
<br />
<br />
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
    CellPadding="4" DataSourceID="ObjectDataSource1" ForeColor="#333333" GridLines="None" OnRowDeleting="GridView1_RowDeleting" OnRowCreated="GridView1_RowCreated" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
    <RowStyle BackColor="#EFF3FB" />
    <Columns>
        <asp:TemplateField ShowHeader="False">
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
                    Text="Select"></asp:LinkButton><asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False"
                        CommandName="Delete" Text="Delete" OnClientClick = "return confirm('Are you sure?');"></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <EditRowStyle BackColor="#2461BF" />
    <AlternatingRowStyle BackColor="White" />
</asp:GridView>
<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="DeletePro"
    SelectMethod="getPro" TypeName="ManaPro">
    <DeleteParameters>
        <asp:Parameter Name="ProID" Type="String" />
    </DeleteParameters>
</asp:ObjectDataSource>
<br />
