<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DonorRegistrationPage.aspx.cs" Inherits="WebFormPractice.DonorRegistrationPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table class="nav-justified" style="height: 381px; width: 74%;">
        <tr>
            <td style="height: 57px; width: 79px"></td>
            <td class="modal-sm" style="width: 50px; height: 57px">
                <h3><strong>Donor Registration</strong></h3>
                <p>
                    <strong>
                    <asp:Label ID="LabelEmailError" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                    </strong></p>
            </td>
            <td style="height: 57px; width: 190px"></td>
            <td style="height: 57px; width: 12px;"></td>
            <td style="height: 57px; width: 109px;">&nbsp;</td>
             <td class="modal-sm" style="width: 232px; height: 57px;" ></td>
            
        </tr>
        <tr>
            <td class="text-right" style="width: 79px"><strong>Email:</strong></td>
            <td class="modal-sm" style="width: 50px">
                    <asp:TextBox ID="TextBoxEmail" runat="server" Width="200px"></asp:TextBox>
                    </td>
            <td style="width: 190px" class="modal-sm">
                    <strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxEmail" ErrorMessage="E-Mail is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBoxEmail" ErrorMessage="Invalid Email ID" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </strong></td>
            <td style="width: 12px" class="text-right"><strong>phone:</strong></td>
            <td style="width: 109px" class="text-left"><strong>
                    <asp:TextBox ID="TextBoxPhone" runat="server" Width="200px"></asp:TextBox>
                    </strong></td>
             <td class="modal-sm" style="width: 232px" ><strong>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBoxPhone" ErrorMessage="phone number is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </strong></td>
            
        </tr>
        <tr>
            <td class="text-right" style="width: 79px; height: 66px;"><strong>Password:</strong></td>
            <td class="modal-sm" style="width: 50px; height: 66px;">
                    <asp:TextBox ID="TextBoxPass" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
                    </td>
            <td style="width: 190px; height: 66px;" class="modal-sm">
                    <strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBoxPass" ErrorMessage="Password is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </strong></td>
            <td style="width: 12px; height: 66px;" class="modal-sm"></td>
             
            
            <td style="width: 109px; height: 66px;" class="modal-sm">&nbsp;</td>
             
            
        </tr>
        <tr>
            <td class="text-right" style="width: 79px"><strong>confirm 
                <br />
                password:</strong></td>
            <td class="modal-sm" style="width: 50px">
                    <asp:TextBox ID="TextBoxConfirmPass" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
                    </td>
            <td style="width: 190px" class="modal-sm">
                    <strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBoxConfirmPass" ErrorMessage="Confirm Password is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBoxPass" ControlToValidate="TextBoxConfirmPass" ErrorMessage="password missmatch" ForeColor="Red"></asp:CompareValidator>
                    </strong></td>
            <td style="width: 12px">&nbsp;</td>
            <td style="width: 109px" class="modal-sm">&nbsp;</td>
             <td class="modal-sm" style="width: 232px" ></td>
             
        </tr>
        <tr>
            <td style="width: 79px; height: 47px;" class="text-right"><strong>company name:</strong></td>
            <td class="modal-sm" style="width: 50px; height: 47px;"><strong><asp:TextBox ID="TextBoxCompanyName" runat="server" Width="200px"></asp:TextBox>
                    </strong></td>
            <td style="width: 190px; height: 47px;" class="modal-sm"><strong>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBoxCompanyName" ErrorMessage="Company name required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </strong></td>
            <td style="width: 12px; height: 47px;" class="modal-sm"></td>
            <td style="width: 109px; height: 47px;" class="modal-sm">&nbsp;</td>
             <td class="modal-sm" style="height: 47px; width: 232px" ></td>
            
        </tr>
        <tr>
            <td style="width: 79px; height: 68px;" class="text-right"><strong>zip:</strong></td>
            <td class="modal-sm" style="width: 50px; height: 68px;"><strong> <asp:TextBox ID="TextBoxZip" runat="server" Width="200px"></asp:TextBox>

                    </strong></td>
            <td style="width: 190px; height: 68px;" class="modal-sm"><strong>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBoxZip" ErrorMessage="invalid zip code" ForeColor="Red" ValidationExpression="[0-9]{5}"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBoxZip" ErrorMessage="zip code is Required" ForeColor="Red"></asp:RequiredFieldValidator>

                    </strong></td>
            <td style="width: 12px; height: 68px;" class="modal-sm"></td>
            <td style="width: 109px; height: 68px;" class="modal-sm">&nbsp;</td>
             <td class="modal-sm" style="height: 68px; width: 232px" ></td>
            
        </tr>
        <tr>
            <td style="width: 79px; height: 68px;" class="text-right">&nbsp;</td>
            <td class="modal-sm" style="width: 50px; height: 68px;">
                <asp:Button ID="ButtonSubmit" runat="server" OnClick="ButtonSubmit_Click" Text="Submit" />
                    <input id="ButtonReset" type="reset" value="reset" /></td>
            <td style="width: 190px; height: 68px;" class="modal-sm">&nbsp;</td>
            <td style="width: 12px; height: 68px;" class="modal-sm">&nbsp;</td>
            <td style="width: 109px; height: 68px;" class="modal-sm">&nbsp;</td>
             <td class="modal-sm" style="height: 68px; width: 232px" >&nbsp;</td>
            
        </tr>
    </table>
</asp:Content>
