<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminHomePage.aspx.cs" Inherits="WebFormPractice.Manager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 146px;
        }
        .auto-style3 {
            width: 146px;
            text-align: right;
        }
        .auto-style4 {
            width: 146px;
            height: 23px;
        }
        .auto-style5 {
            height: 23px;
        }
        .auto-style6 {
            text-align: center;
        }
        .auto-style7 {
            width: 100%;
            height: 148px;
        }
        .auto-style8 {
            width: 1177px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:SqlDataSource ID="SqlDataSourceRegistration" runat="server" ConnectionString="<%$ ConnectionStrings:RegistrationConnectionString %>" SelectCommand="SELECT * FROM [Recipient]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceDonors" runat="server" ConnectionString="<%$ ConnectionStrings:RegistrationConnectionString %>" SelectCommand="SELECT [Donor_ID], [Email] FROM [Donor]"></asp:SqlDataSource>
        </div>
        <h2 class="auto-style6">
            <asp:Label ID="LabelTable" runat="server" Text="Recipient"></asp:Label>
        </h2>
        <div class="auto-style6">
            <div></div>
            <table class="auto-style7">
                <tr>
                    <td class="auto-style8">
        <asp:GridView ID="GridView1" runat="server" Height="183px" Width="932px" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSourceRegistration" AutoGenerateColumns="False">
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <RowStyle BackColor="White" ForeColor="#003399" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SortedAscendingCellStyle BackColor="#EDF6F6" />
            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
            <SortedDescendingCellStyle BackColor="#D6DFDF" />
            <SortedDescendingHeaderStyle BackColor="#002876" />
        </asp:GridView>
                
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <table class="auto-style1">
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
                
        </div>
        <br />
        <table class="auto-style1">
            <tr>
                <td class="auto-style3"><strong>Table to View</strong></td>
                <td>
                    <asp:DropDownList ID="DropDownListTables" runat="server">
                        <asp:ListItem>Recipient Table</asp:ListItem>
                        <asp:ListItem>Donor Table</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Button ID="ButtonRefresh" runat="server" OnClick="ButtonRefresh_Click" Text="Refresh" />
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4"></td>
                <td class="auto-style5"></td>
                <td class="auto-style5"></td>
                <td class="auto-style5"></td>
                <td class="auto-style5"></td>
                <td class="auto-style5"></td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>