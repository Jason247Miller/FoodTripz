<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="WebFormPractice.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   





    <table class="nav-justified" style="height: 537px">
        <tr>
            <td style="width: 217px; height: 60px">
                &nbsp;</td>
            <td style="width: 780px; height: 60px">
                <h1 class="text-center">Review Items in Cart</h1>
                <p class="text-center">
                    &nbsp;</p>
            </td>
            <td style="height: 60px"></td>
        </tr>
        <tr>
            <td style="width: 217px; height: 334px" class="text-center"></td>
            <td style="width: 780px; height: 334px" class="text-center">
                        <asp:GridView ID="GridViewCart" OnRowCommand="GridViewCart_RowCommand"
                            runat="server" AutoGenerateColumns="False"  Height="266px" Width="858px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" style="margin-top: 14px">
                            <Columns>
                                <asp:ButtonField ButtonType="Button" CommandName="Remove" Text="Remove" />
                                <asp:BoundField DataField="PROD_ID" HeaderText="PROD_ID"  />
                                <asp:BoundField DataField="PROD_NAME" HeaderText="PROD_NAME" />
                                <asp:BoundField DataField="PROD_SIZE" HeaderText="PROD_SIZE"  />
                                <asp:BoundField DataField="PROD_STOCKQTY" HeaderText="PROD_STOCKQTY"  />
                                <asp:BoundField DataField="PROD_CATEGORY" HeaderText="PROD_CATEGORY"  />
                                <asp:BoundField DataField="EXP_DATE" HeaderText="EXP_DATE"  />
                            </Columns>
                            <FooterStyle BackColor="White" ForeColor="#000066" />
                            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                            <RowStyle ForeColor="#000066" />
                            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#007DBB" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#00547E" />
                        </asp:GridView>
            </td>
            <td style="height: 334px"></td>
        </tr>
        <tr>
            <td style="width: 217px" class="modal-sm">&nbsp;</td>
            <td style="width: 780px">
                <asp:Button ID="ButtonOrder" runat="server" OnClick="ButtonOrder_Click" Text="Complete Order" Width="134px" />
                <asp:Button ID="ButtonShop" runat="server" OnClick="ButtonShop_Click" Text="Return to Product Display" Width="185px" />
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
   





</asp:Content>
