<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RecipientRegisteration.aspx.cs" Inherits="WebFormPractice.RecipientRegistration" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    
        <table class="auto-style1" style="width: 1258px">
            <tr>
                <td class="auto-style3" style="height: 97px; width: 100px">
                    <h2><strong></strong></h2>
                </td>
                <td style="height: 97px; width: 572px">
                    <h1><strong>Recipient Registration Page</strong></h1>
                </td>
                <td style="height: 97px"></td>
            </tr>
            <tr>
                <td class="auto-style2" style="height: 22px; width: 100px">
                    <h2 class="text-right" style="font-size: large"><strong>Username:</strong></h2>
                </td>
                <td class="auto-style4" style="height: 22px; width: 572px">
                    <asp:TextBox ID="TextBoxUser" runat="server" Width="200px"></asp:TextBox>
                    <strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxUser" ErrorMessage="User Name is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </strong></td>
                <td style="height: 22px"></td>
            </tr>
            <tr>
                <td class="auto-style2" style="height: 49px; width: 100px">
                    <h2 class="text-right" style="font-size: large"><strong>E-Mail:</strong></h2>
                </td>
                <td class="auto-style4" style="height: 49px; width: 572px">
                    <asp:TextBox ID="TextBoxEmail" runat="server" Width="200px"></asp:TextBox>
                    <strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxEmail" ErrorMessage="E-Mail is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBoxEmail" ErrorMessage="Invalid Email ID" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </strong></td>
                <td style="height: 49px"></td>
            </tr>
            <tr>
                <td class="auto-style2" style="width: 100px">
                    <h2 class="text-right" style="font-size: large"><strong>Password:</strong></h2>
                </td>
                <td class="auto-style4" style="width: 572px">
                    <asp:TextBox ID="TextBoxPass" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
                    <strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBoxPass" ErrorMessage="Password is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </strong></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2" style="width: 100px">
                    <h2 style="font-size: large"><strong>Confirm Password</strong></h2>
                </td>
                <td class="auto-style4" style="width: 572px">
                    <asp:TextBox ID="TextBoxConfirmPass" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
                    <strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBoxConfirmPass" ErrorMessage="Confirm Password is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBoxPass" ControlToValidate="TextBoxConfirmPass" ErrorMessage="password missmatch" ForeColor="Red"></asp:CompareValidator>
                    </strong></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2" style="width: 100px">
                    <h2 class="text-right" style="font-size: large">&nbsp;</h2>
                </td>
                <td class="auto-style4" style="width: 572px">
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3" style="width: 100px">
                    <h2><strong></strong></h2>
                </td>
                <td style="width: 572px">
                    <asp:Button ID="ButtonSubmit" runat="server" OnClick="Button1_Click" Text="Submit" />
                    <input id="ButtonReset" type="reset" value="reset" /></td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </asp:Content>
    
    

