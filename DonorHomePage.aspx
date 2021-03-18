<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DonorHomePage.aspx.cs" Inherits="WebFormPractice.DonorHomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <table class="nav-justified">
        <tr>
            <td style="height: 20px">
                <asp:Label ID="LabelWelcome" runat="server" Font-Size="XX-Large" Text="Welcome"></asp:Label>
            </td>
            <td style="height: 20px"></td>
            <td style="height: 20px"></td>
            <td style="height: 20px"></td>
        </tr>
        </table>


    
 <asp:GridView ID="gvProductTable" runat="server" AutoGenerateColumns="False" ShowFooter="True" DataKeyNames="PROD_ID"
                ShowHeaderWhenEmpty="True"


                OnRowCommand="gvProductTable_RowCommand" OnRowEditing="gvProductTable_RowEditing" OnRowCancelingEdit="gvProductTable_RowCancelingEdit"
                OnRowUpdating="gvProductTable_RowUpdating" OnRowDeleting="gvProductTable_RowDeleting"
                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1">




       <Columns>
                    <asp:BoundField DataField="PROD_ID" HeaderText="PROD_ID" InsertVisible="False" ReadOnly="True" SortExpression="PROD_ID" />
                    <asp:BoundField DataField="PROD_NAME" HeaderText="PROD_NAME" SortExpression="PROD_NAME" />
                    <asp:BoundField DataField="PROD_SIZE" HeaderText="PROD_SIZE" SortExpression="PROD_SIZE" />
                    <asp:BoundField DataField="PROD_STOCKQTY" HeaderText="PROD_STOCKQTY" SortExpression="PROD_STOCKQTY" />
                    <asp:BoundField DataField="PROD_CATEGORY" HeaderText="PROD_CATEGORY" SortExpression="PROD_CATEGORY" />
                    <asp:BoundField DataField="PROD_STATUS" HeaderText="PROD_STATUS" SortExpression="PROD_STATUS" />
                    <asp:BoundField DataField="EXP_DATE" HeaderText="EXP_DATE" SortExpression="EXP_DATE" />
                    <asp:BoundField DataField="DONOR_ID" HeaderText="DONOR_ID" SortExpression="DONOR_ID" />





           </Columns>
     </asp:GridView>



    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Database1 %>" SelectCommand="SELECT * FROM [PRODUCT]"></asp:SqlDataSource>



    <table>
        <tr>
            <td style="height: 26px">
                <asp:Button ID="ButtonLogOut" runat="server" OnClick="ButtonLogOut_Click" Text="Logout" />
            </td>
            <td style="height: 26px"></td>
            <td style="height: 26px"></td>
            <td style="height: 26px"></td>
        </tr>
      
    </table>





















</asp:Content>
