<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RecipientRegisteration.aspx.cs" Inherits="WebFormPractice.RecipientRegistration" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    
        <table class="auto-style1" style="width: 1316px">
            <tr>
                <td class="auto-style3" style="height: 104px; width: 100px">
                    <h2><strong></strong></h2>
                </td>
                <td style="height: 104px; width: 574px">
                    <h1><strong>Recipient Registration Page</strong></h1>
                </td>
                <td style="height: 104px"></td>
            </tr>
            <tr>
                <td class="auto-style2" style="height: 22px; width: 100px">
                    &nbsp;</td>
                <td class="auto-style4" style="height: 22px; width: 574px">
                    <strong>
                    <asp:Label ID="LabelEmailError" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                    </strong></td>
                <td style="height: 22px"><strong>First Name:<asp:TextBox ID="TextBoxFname" runat="server" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBoxFname" ErrorMessage="First name is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </strong></td>
            </tr>
            <tr>
                <td class="auto-style2" style="height: 49px; width: 100px">
                    <h2 class="text-right" style="font-size: large"><strong>E-Mail:</strong></h2>
                </td>
                <td class="auto-style4" style="height: 49px; width: 574px">
                    <asp:TextBox ID="TextBoxEmail" runat="server" Width="200px"></asp:TextBox>
                    <strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxEmail" ErrorMessage="E-Mail is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBoxEmail" ErrorMessage="Invalid Email ID" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </strong></td>
                <td style="height: 49px"><strong>Last Name:<asp:TextBox ID="TextBoxLname" runat="server" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBoxLname" ErrorMessage="Last name is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </strong></td>
            </tr>
            <tr>
                <td class="auto-style2" style="width: 100px">
                    <h2 class="text-right" style="font-size: large"><strong>Password:</strong></h2>
                </td>
                <td class="auto-style4" style="width: 574px">
                    <asp:TextBox ID="TextBoxPass" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
                    <strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBoxPass" ErrorMessage="Password is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </strong></td>
                <td><strong>phone</strong>:<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="TextBoxPhone" runat="server" Width="200px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBoxPhone" ErrorMessage="phone number is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator" runat="server" ControlToValidate="TextBoxPhone" ErrorMessage="invalid phone number" ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                    </strong></td>
    <%// <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBoxPhone" ErrorMessage="phone is Required" ForeColor="Red"></asp:RequiredFieldValidator>
 %>
            </tr>
            <tr>
                <td class="auto-style2" style="width: 100px">
                    <h2 style="font-size: large"><strong>Confirm Password</strong></h2>
                </td>
                <td class="auto-style4" style="width: 574px">
                    <asp:TextBox ID="TextBoxConfirmPass" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
                    <strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBoxConfirmPass" ErrorMessage="Confirm Password is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBoxPass" ControlToValidate="TextBoxConfirmPass" ErrorMessage="password missmatch" ForeColor="Red"></asp:CompareValidator>
                    </strong></td>
                <td><strong>zip</strong>:<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBoxZip" runat="server" Width="200px"></asp:TextBox>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBoxZip" ErrorMessage="invalid zip code" ForeColor="Red" ValidationExpression="[0-9]{5}"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBoxZip" ErrorMessage="zip code is Required" ForeColor="Red"></asp:RequiredFieldValidator>

                    </strong></td>
            </tr>
            <tr>
                <td class="auto-style2" style="width: 100px">
                    <h2 class="text-right" style="font-size: large">&nbsp;</h2>
                </td>
                <td class="auto-style4" style="width: 574px">
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3" style="width: 100px">
                    <h2><strong></strong></h2>
                </td>
                <td style="width: 574px">
                    <asp:Button ID="ButtonSubmit" runat="server" OnClick="Button1_Click" Text="Submit" />
                    <input id="ButtonReset" type="reset" value="reset" /></td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </asp:Content>
    
    

