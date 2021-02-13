<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebFormPractice.Login" %>


   <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


        <div>
            <h1 class="auto-style1"><strong>Login Page</strong></h1>
        </div>
        <table class="auto-style2">
            <tr>
                <td class="text-right"><strong>Email </strong>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxEmail" runat="server" Width="180px" style="margin-left: 0px; margin-right: 66px"></asp:TextBox>
                    <strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxEmail" ErrorMessage="Please enter Email" ForeColor="Red"></asp:RequiredFieldValidator>
                    </strong>

                </td>
                <td style="width: 145px">
                    <asp:Label ID="LabelEmailInvalid" runat="server" Font-Size="Small" ForeColor="#CC0000" Text="Label" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3"><strong>Password</strong></td>
                <td>
                    <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password" Width="180px"></asp:TextBox>
                    <strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxPassword" ErrorMessage="Please Enter Password" ForeColor="Red"></asp:RequiredFieldValidator>
                    </strong></td>
                <td style="width: 145px">
                    <asp:Label ID="LabelPasswordInvalid" runat="server" Font-Size="Small" ForeColor="#CC0000" Text="Label" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3"><strong>User Type</strong></td>
                <td>
                    <asp:DropDownList ID="DropDownUserType" runat="server" Width="206px">
                        <asp:ListItem>Select User Type</asp:ListItem>
                        <asp:ListItem Value="Donor">Food Donor</asp:ListItem>
                        <asp:ListItem Value="Recipient">Food Recipient</asp:ListItem>
                        <asp:ListItem Value="ADMIN_ACCOUNT">Administrator</asp:ListItem>
                    </asp:DropDownList>
                    <strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DropDownUserType" ErrorMessage="RequiredFieldValidator" ForeColor="Red" InitialValue="Select User Type">Select a user type</asp:RequiredFieldValidator>
                    </strong>
                </td>
                <td style="width: 145px">
                    <asp:Label ID="LabelUserTypeNotSelected" runat="server" Font-Size="Small" ForeColor="#CC0000" Text="Label" Visible="False"></asp:Label>
                </td>
                <td>&nbsp;</td>
             <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td>
                    <asp:Button ID="Button_Login" runat="server" OnClick="Button_Login_Click" Text="Login" Width="82px" />
                </td>
                <td style="width: 145px">&nbsp;</td>
            </tr>
            <tr><td></td><td>
                <a href="#" onclick="window.open('ForgotPassword.aspx', 'FP', 'width=700, height=200,top=400,left=500,fullscreen=no,resizeable=0');">Forgot Password?</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>&nbsp;</td></tr>
            </table>
</asp:Content>
