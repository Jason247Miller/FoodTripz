<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DonorRegistration.aspx.cs" Inherits="WebFormPractice.DonorRegistration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table class="nav-justified" style="height: 423px; margin-top: 94px;">
        <tr>
            <td style="width: 97px; height: 84px;"></td>
            <td class="modal-sm" style="height: 84px; width: 568px">
                <h2><strong>Donor Registration Page</strong></h2>
            </td>
            <td style="height: 84px; width: 147px"></td>
            <td style="height: 84px"></td>
            <td style="height: 84px"></td>
            <td style="height: 84px"></td>
        </tr>
        <tr>
            <td style="width: 97px" class="text-right"><strong>Company Name:</strong></td>
            <td class="modal-sm" style="width: 568px">
                <asp:TextBox ID="TextBoxCompanyName" runat="server" Width="213px"></asp:TextBox>
                    <strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorCompanyName" runat="server" ControlToValidate="TextBoxCompanyName" ErrorMessage="Company Name is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </strong></td>
            <td class="text-right" style="width: 147px"><strong>pickup times:</strong></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 97px" class="text-right"><strong>Email:</strong></td>
            <td class="modal-sm" style="width: 568px">
                    <asp:TextBox ID="TextBoxEmail" runat="server" Width="224px"></asp:TextBox>
                    <strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxEmail" ErrorMessage="E-Mail is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBoxEmail" ErrorMessage="Invalid Email ID" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </strong></td>
            <td style="width: 147px">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 97px" class="text-right"><strong>password:</strong></td>
            <td class="modal-sm" style="width: 568px">
                    <asp:TextBox ID="TextBoxPass" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
                    <strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBoxPass" ErrorMessage="Password is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </strong></td>
            <td style="width: 147px">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 97px" class="text-right"><strong>confirm password:</strong></td>
            <td class="modal-sm" style="width: 568px">
                    <asp:TextBox ID="TextBoxConfirmPass" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
                    <strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBoxConfirmPass" ErrorMessage="Confirm Password is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBoxPass" ControlToValidate="TextBoxConfirmPass" ErrorMessage="password missmatch" ForeColor="Red"></asp:CompareValidator>
                    </strong></td>
            <td style="width: 147px">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 97px" class="text-right">z<strong>ip code:</strong></td>
            <td class="modal-sm" style="width: 568px"><strong> <asp:TextBox ID="TextBoxZip" runat="server" Width="200px"></asp:TextBox>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBoxZip" ErrorMessage="invalid zip code" ForeColor="Red" ValidationExpression="[0-9]{5}"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBoxZip" ErrorMessage="zip code is Required" ForeColor="Red"></asp:RequiredFieldValidator>

                    </strong></td>
            <td style="width: 147px">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 97px">&nbsp;</td>
            <td class="modal-sm" style="width: 568px">&nbsp;</td>
            <td style="width: 147px">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
