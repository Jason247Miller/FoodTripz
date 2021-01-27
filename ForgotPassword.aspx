<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="WebFormPractice.ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

button,
select {
  text-transform: none;
}
* {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}
  *,
  *:before,
  *:after {
    color: #000 !important;
    text-shadow: none !important;
    background: transparent !important;
    -webkit-box-shadow: none !important;
    box-shadow: none !important;
  }
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 382px;
        }
        .auto-style3 {
            width: 127px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            
          
                <h2>Password Recovery<br />
                 &nbsp;<br />
                </h2>
              <div>
                    
                    </div>
       
        </div>
        <div></div>
        <table class="auto-style1">
           
           
           
           
            <tr>
                <td class="auto-style3">Enter Email</td>
                <td class="auto-style2"><asp:TextBox ID="TxtEmail" runat="server"></asp:TextBox> 
                    <strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtEmail" ErrorMessage="Enter Email" ForeColor="Red"></asp:RequiredFieldValidator>
                    </strong></td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">Select User Type</td>
                <td class="auto-style2">
                 <asp:DropDownList ID="DropDownUserType" runat="server" Width="206px">
                        <asp:ListItem>Select User Type</asp:ListItem>
                        <asp:ListItem Value="Donor">Food Donor</asp:ListItem>
                        <asp:ListItem Value="Recipient">Food Recipient</asp:ListItem>
                        <asp:ListItem>Administrator</asp:ListItem>
                    </asp:DropDownList> 
                    <strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DropDownUserType" ErrorMessage="RequiredFieldValidator" ForeColor="Red" InitialValue="Select User Type">Select a user type</asp:RequiredFieldValidator>
                    </strong>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style2">
                  <asp:Button ID="ButtonPassword" runat="server" Text="Get Your Password" OnClick="ButtonPassword_Click" Height="27px"></asp:Button>
                    
                    </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style2">
              <asp:Label ID="LabelMessage" runat="server"></asp:Label>
       
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
