<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebFormPractice.Login" %>


   <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


        <div>
            <h1 class="auto-style1"><strong>Login Page</strong></h1>
        </div>
        <table class="auto-style2">
            <tr>
                <td class="auto-style3"><strong>Username</strong>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxUsername" runat="server" Width="180px"></asp:TextBox>
                    <strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxUsername" ErrorMessage="Please enter Username" ForeColor="Red"></asp:RequiredFieldValidator>
                    </strong>

                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3"><strong>Password</strong></td>
                <td>
                    <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password" Width="180px"></asp:TextBox>
                    <strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxPassword" ErrorMessage="Please Enter Password" ForeColor="Red"></asp:RequiredFieldValidator>
                    </strong></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3"><strong>User Type</strong></td>
                <td>
                    <asp:DropDownList ID="DropDownUserType" runat="server" Width="206px">
                        <asp:ListItem>Select User Type</asp:ListItem>
                        <asp:ListItem>Food Donor</asp:ListItem>
                        <asp:ListItem>Food Recipient</asp:ListItem>
                        <asp:ListItem>Administrator</asp:ListItem>
                    </asp:DropDownList>
                    <strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DropDownUserType" ErrorMessage="RequiredFieldValidator" ForeColor="Red" InitialValue="Select User Type">Select a user type</asp:RequiredFieldValidator>
                    </strong>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td>
                    <asp:Button ID="Button_Login" runat="server" OnClick="Button_Login_Click" Text="Login" Width="82px" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
</asp:Content>
