<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdministratorHomePage.aspx.cs" Inherits="WebFormPractice.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            height: 919px;
            width: 1176px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Admin Home Page"></asp:Label>
        <br />
        <br />
        <br />

        Select which table to view and it will be generated. for editing and deleting.<br />
        <asp:DropDownList ID="DropDownList1" runat="server" Height="27px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="179px" AutoPostBack="True">
            <asp:ListItem>--Make Selection--</asp:ListItem>
            <asp:ListItem Value="rt">Recipient Table</asp:ListItem>
            <asp:ListItem Value="dt">Donor Table</asp:ListItem>
            <asp:ListItem Value="ot">Orders Table</asp:ListItem>
            <asp:ListItem Value="pt">Products Table</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        <br />
        <div id="recDiv" runat="server" visible="false">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Database1 %>" DeleteCommand="DELETE FROM [RECIPIENT] WHERE [RECIPIENT_ID] = @original_RECIPIENT_ID AND (([FIRST_NAME] = @original_FIRST_NAME) OR ([FIRST_NAME] IS NULL AND @original_FIRST_NAME IS NULL)) AND (([LAST_NAME] = @original_LAST_NAME) OR ([LAST_NAME] IS NULL AND @original_LAST_NAME IS NULL)) AND (([EMAIL] = @original_EMAIL) OR ([EMAIL] IS NULL AND @original_EMAIL IS NULL)) AND (([PHONE_NUM] = @original_PHONE_NUM) OR ([PHONE_NUM] IS NULL AND @original_PHONE_NUM IS NULL)) AND (([PASSWORD] = @original_PASSWORD) OR ([PASSWORD] IS NULL AND @original_PASSWORD IS NULL)) AND (([ZIP] = @original_ZIP) OR ([ZIP] IS NULL AND @original_ZIP IS NULL))" InsertCommand="INSERT INTO [RECIPIENT] ([FIRST_NAME], [LAST_NAME], [EMAIL], [PHONE_NUM], [PASSWORD], [ZIP]) VALUES (@FIRST_NAME, @LAST_NAME, @EMAIL, @PHONE_NUM, @PASSWORD, @ZIP)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [RECIPIENT]" UpdateCommand="UPDATE [RECIPIENT] SET [FIRST_NAME] = @FIRST_NAME, [LAST_NAME] = @LAST_NAME, [EMAIL] = @EMAIL, [PHONE_NUM] = @PHONE_NUM, [PASSWORD] = @PASSWORD, [ZIP] = @ZIP WHERE [RECIPIENT_ID] = @original_RECIPIENT_ID AND (([FIRST_NAME] = @original_FIRST_NAME) OR ([FIRST_NAME] IS NULL AND @original_FIRST_NAME IS NULL)) AND (([LAST_NAME] = @original_LAST_NAME) OR ([LAST_NAME] IS NULL AND @original_LAST_NAME IS NULL)) AND (([EMAIL] = @original_EMAIL) OR ([EMAIL] IS NULL AND @original_EMAIL IS NULL)) AND (([PHONE_NUM] = @original_PHONE_NUM) OR ([PHONE_NUM] IS NULL AND @original_PHONE_NUM IS NULL)) AND (([PASSWORD] = @original_PASSWORD) OR ([PASSWORD] IS NULL AND @original_PASSWORD IS NULL)) AND (([ZIP] = @original_ZIP) OR ([ZIP] IS NULL AND @original_ZIP IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_RECIPIENT_ID" Type="Int32" />
                    <asp:Parameter Name="original_FIRST_NAME" Type="String" />
                    <asp:Parameter Name="original_LAST_NAME" Type="String" />
                    <asp:Parameter Name="original_EMAIL" Type="String" />
                    <asp:Parameter Name="original_PHONE_NUM" Type="String" />
                    <asp:Parameter Name="original_PASSWORD" Type="String" />
                    <asp:Parameter Name="original_ZIP" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="FIRST_NAME" Type="String" />
                    <asp:Parameter Name="LAST_NAME" Type="String" />
                    <asp:Parameter Name="EMAIL" Type="String" />
                    <asp:Parameter Name="PHONE_NUM" Type="String" />
                    <asp:Parameter Name="PASSWORD" Type="String" />
                    <asp:Parameter Name="ZIP" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="FIRST_NAME" Type="String" />
                    <asp:Parameter Name="LAST_NAME" Type="String" />
                    <asp:Parameter Name="EMAIL" Type="String" />
                    <asp:Parameter Name="PHONE_NUM" Type="String" />
                    <asp:Parameter Name="PASSWORD" Type="String" />
                    <asp:Parameter Name="ZIP" Type="String" />
                    <asp:Parameter Name="original_RECIPIENT_ID" Type="Int32" />
                    <asp:Parameter Name="original_FIRST_NAME" Type="String" />
                    <asp:Parameter Name="original_LAST_NAME" Type="String" />
                    <asp:Parameter Name="original_EMAIL" Type="String" />
                    <asp:Parameter Name="original_PHONE_NUM" Type="String" />
                    <asp:Parameter Name="original_PASSWORD" Type="String" />
                    <asp:Parameter Name="original_ZIP" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" Width="890px" AutoGenerateColumns="False" DataKeyNames="RECIPIENT_ID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="RECIPIENT_ID" HeaderText="RECIPIENT_ID" InsertVisible="False" ReadOnly="True" SortExpression="RECIPIENT_ID" />
                <asp:BoundField DataField="FIRST_NAME" HeaderText="FIRST_NAME" SortExpression="FIRST_NAME" />
                <asp:BoundField DataField="LAST_NAME" HeaderText="LAST_NAME" SortExpression="LAST_NAME" />
                <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
                <asp:BoundField DataField="PHONE_NUM" HeaderText="PHONE_NUM" SortExpression="PHONE_NUM" />
                <asp:BoundField DataField="PASSWORD" HeaderText="PASSWORD" SortExpression="PASSWORD" />
                <asp:BoundField DataField="ZIP" HeaderText="ZIP" SortExpression="ZIP" />
            </Columns>
        </asp:GridView>
        </div>
        <br />
        <div id="donorDiv" runat="server" visible="false">
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Database1 %>" DeleteCommand="DELETE FROM [DONOR] WHERE [DONOR_ID] = @original_DONOR_ID AND [EMAIL] = @original_EMAIL AND [PASSWORD] = @original_PASSWORD AND (([COMPANY_NAME] = @original_COMPANY_NAME) OR ([COMPANY_NAME] IS NULL AND @original_COMPANY_NAME IS NULL)) AND (([LOCATION_ID] = @original_LOCATION_ID) OR ([LOCATION_ID] IS NULL AND @original_LOCATION_ID IS NULL)) AND (([PICKUP_TIMES] = @original_PICKUP_TIMES) OR ([PICKUP_TIMES] IS NULL AND @original_PICKUP_TIMES IS NULL)) AND (([STREET_NAME] = @original_STREET_NAME) OR ([STREET_NAME] IS NULL AND @original_STREET_NAME IS NULL)) AND (([ZIP] = @original_ZIP) OR ([ZIP] IS NULL AND @original_ZIP IS NULL)) AND (([STATE_NAME] = @original_STATE_NAME) OR ([STATE_NAME] IS NULL AND @original_STATE_NAME IS NULL)) AND [REG_STATUS] = @original_REG_STATUS AND (([ADMIN_ID] = @original_ADMIN_ID) OR ([ADMIN_ID] IS NULL AND @original_ADMIN_ID IS NULL)) AND (([LOC_NAME] = @original_LOC_NAME) OR ([LOC_NAME] IS NULL AND @original_LOC_NAME IS NULL)) AND (([LATITUDE] = @original_LATITUDE) OR ([LATITUDE] IS NULL AND @original_LATITUDE IS NULL)) AND (([LONGITUDE] = @original_LONGITUDE) OR ([LONGITUDE] IS NULL AND @original_LONGITUDE IS NULL))" InsertCommand="INSERT INTO [DONOR] ([EMAIL], [PASSWORD], [COMPANY_NAME], [LOCATION_ID], [PICKUP_TIMES], [STREET_NAME], [ZIP], [STATE_NAME], [REG_STATUS], [ADMIN_ID], [LOC_NAME], [LATITUDE], [LONGITUDE]) VALUES (@EMAIL, @PASSWORD, @COMPANY_NAME, @LOCATION_ID, @PICKUP_TIMES, @STREET_NAME, @ZIP, @STATE_NAME, @REG_STATUS, @ADMIN_ID, @LOC_NAME, @LATITUDE, @LONGITUDE)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [DONOR]" UpdateCommand="UPDATE [DONOR] SET [EMAIL] = @EMAIL, [PASSWORD] = @PASSWORD, [COMPANY_NAME] = @COMPANY_NAME, [LOCATION_ID] = @LOCATION_ID, [PICKUP_TIMES] = @PICKUP_TIMES, [STREET_NAME] = @STREET_NAME, [ZIP] = @ZIP, [STATE_NAME] = @STATE_NAME, [REG_STATUS] = @REG_STATUS, [ADMIN_ID] = @ADMIN_ID, [LOC_NAME] = @LOC_NAME, [LATITUDE] = @LATITUDE, [LONGITUDE] = @LONGITUDE WHERE [DONOR_ID] = @original_DONOR_ID AND [EMAIL] = @original_EMAIL AND [PASSWORD] = @original_PASSWORD AND (([COMPANY_NAME] = @original_COMPANY_NAME) OR ([COMPANY_NAME] IS NULL AND @original_COMPANY_NAME IS NULL)) AND (([LOCATION_ID] = @original_LOCATION_ID) OR ([LOCATION_ID] IS NULL AND @original_LOCATION_ID IS NULL)) AND (([PICKUP_TIMES] = @original_PICKUP_TIMES) OR ([PICKUP_TIMES] IS NULL AND @original_PICKUP_TIMES IS NULL)) AND (([STREET_NAME] = @original_STREET_NAME) OR ([STREET_NAME] IS NULL AND @original_STREET_NAME IS NULL)) AND (([ZIP] = @original_ZIP) OR ([ZIP] IS NULL AND @original_ZIP IS NULL)) AND (([STATE_NAME] = @original_STATE_NAME) OR ([STATE_NAME] IS NULL AND @original_STATE_NAME IS NULL)) AND [REG_STATUS] = @original_REG_STATUS AND (([ADMIN_ID] = @original_ADMIN_ID) OR ([ADMIN_ID] IS NULL AND @original_ADMIN_ID IS NULL)) AND (([LOC_NAME] = @original_LOC_NAME) OR ([LOC_NAME] IS NULL AND @original_LOC_NAME IS NULL)) AND (([LATITUDE] = @original_LATITUDE) OR ([LATITUDE] IS NULL AND @original_LATITUDE IS NULL)) AND (([LONGITUDE] = @original_LONGITUDE) OR ([LONGITUDE] IS NULL AND @original_LONGITUDE IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_DONOR_ID" Type="Int32" />
                    <asp:Parameter Name="original_EMAIL" Type="String" />
                    <asp:Parameter Name="original_PASSWORD" Type="String" />
                    <asp:Parameter Name="original_COMPANY_NAME" Type="String" />
                    <asp:Parameter Name="original_LOCATION_ID" Type="Int32" />
                    <asp:Parameter Name="original_PICKUP_TIMES" Type="String" />
                    <asp:Parameter Name="original_STREET_NAME" Type="String" />
                    <asp:Parameter Name="original_ZIP" Type="String" />
                    <asp:Parameter Name="original_STATE_NAME" Type="String" />
                    <asp:Parameter Name="original_REG_STATUS" Type="String" />
                    <asp:Parameter Name="original_ADMIN_ID" Type="Int32" />
                    <asp:Parameter Name="original_LOC_NAME" Type="String" />
                    <asp:Parameter Name="original_LATITUDE" Type="Single" />
                    <asp:Parameter Name="original_LONGITUDE" Type="Single" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="EMAIL" Type="String" />
                    <asp:Parameter Name="PASSWORD" Type="String" />
                    <asp:Parameter Name="COMPANY_NAME" Type="String" />
                    <asp:Parameter Name="LOCATION_ID" Type="Int32" />
                    <asp:Parameter Name="PICKUP_TIMES" Type="String" />
                    <asp:Parameter Name="STREET_NAME" Type="String" />
                    <asp:Parameter Name="ZIP" Type="String" />
                    <asp:Parameter Name="STATE_NAME" Type="String" />
                    <asp:Parameter Name="REG_STATUS" Type="String" />
                    <asp:Parameter Name="ADMIN_ID" Type="Int32" />
                    <asp:Parameter Name="LOC_NAME" Type="String" />
                    <asp:Parameter Name="LATITUDE" Type="Single" />
                    <asp:Parameter Name="LONGITUDE" Type="Single" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="EMAIL" Type="String" />
                    <asp:Parameter Name="PASSWORD" Type="String" />
                    <asp:Parameter Name="COMPANY_NAME" Type="String" />
                    <asp:Parameter Name="LOCATION_ID" Type="Int32" />
                    <asp:Parameter Name="PICKUP_TIMES" Type="String" />
                    <asp:Parameter Name="STREET_NAME" Type="String" />
                    <asp:Parameter Name="ZIP" Type="String" />
                    <asp:Parameter Name="STATE_NAME" Type="String" />
                    <asp:Parameter Name="REG_STATUS" Type="String" />
                    <asp:Parameter Name="ADMIN_ID" Type="Int32" />
                    <asp:Parameter Name="LOC_NAME" Type="String" />
                    <asp:Parameter Name="LATITUDE" Type="Single" />
                    <asp:Parameter Name="LONGITUDE" Type="Single" />
                    <asp:Parameter Name="original_DONOR_ID" Type="Int32" />
                    <asp:Parameter Name="original_EMAIL" Type="String" />
                    <asp:Parameter Name="original_PASSWORD" Type="String" />
                    <asp:Parameter Name="original_COMPANY_NAME" Type="String" />
                    <asp:Parameter Name="original_LOCATION_ID" Type="Int32" />
                    <asp:Parameter Name="original_PICKUP_TIMES" Type="String" />
                    <asp:Parameter Name="original_STREET_NAME" Type="String" />
                    <asp:Parameter Name="original_ZIP" Type="String" />
                    <asp:Parameter Name="original_STATE_NAME" Type="String" />
                    <asp:Parameter Name="original_REG_STATUS" Type="String" />
                    <asp:Parameter Name="original_ADMIN_ID" Type="Int32" />
                    <asp:Parameter Name="original_LOC_NAME" Type="String" />
                    <asp:Parameter Name="original_LATITUDE" Type="Single" />
                    <asp:Parameter Name="original_LONGITUDE" Type="Single" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView2" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="DONOR_ID" DataSourceID="SqlDataSource2">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="DONOR_ID" HeaderText="DONOR_ID" InsertVisible="False" ReadOnly="True" SortExpression="DONOR_ID" />
                    <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
                    <asp:BoundField DataField="PASSWORD" HeaderText="PASSWORD" SortExpression="PASSWORD" />
                    <asp:BoundField DataField="COMPANY_NAME" HeaderText="COMPANY_NAME" SortExpression="COMPANY_NAME" />
                    <asp:BoundField DataField="LOCATION_ID" HeaderText="LOCATION_ID" SortExpression="LOCATION_ID" />
                    <asp:BoundField DataField="PICKUP_TIMES" HeaderText="PICKUP_TIMES" SortExpression="PICKUP_TIMES" />
                    <asp:BoundField DataField="STREET_NAME" HeaderText="STREET_NAME" SortExpression="STREET_NAME" />
                    <asp:BoundField DataField="ZIP" HeaderText="ZIP" SortExpression="ZIP" />
                    <asp:BoundField DataField="STATE_NAME" HeaderText="STATE_NAME" SortExpression="STATE_NAME" />
                    <asp:BoundField DataField="REG_STATUS" HeaderText="REG_STATUS" SortExpression="REG_STATUS" />
                    <asp:BoundField DataField="ADMIN_ID" HeaderText="ADMIN_ID" SortExpression="ADMIN_ID" />
                    <asp:BoundField DataField="LOC_NAME" HeaderText="LOC_NAME" SortExpression="LOC_NAME" />
                    <asp:BoundField DataField="LATITUDE" HeaderText="LATITUDE" SortExpression="LATITUDE" />
                    <asp:BoundField DataField="LONGITUDE" HeaderText="LONGITUDE" SortExpression="LONGITUDE" />
                </Columns>
            </asp:GridView>
        </div>
        <br />
        <div id="orderDiv" runat="server" visible="false">
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Database1 %>" DeleteCommand="DELETE FROM [ORDERS] WHERE [ORDER_ID] = @original_ORDER_ID AND (([REC_ID] = @original_REC_ID) OR ([REC_ID] IS NULL AND @original_REC_ID IS NULL))" InsertCommand="INSERT INTO [ORDERS] ([REC_ID]) VALUES (@REC_ID)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [ORDERS]" UpdateCommand="UPDATE [ORDERS] SET [REC_ID] = @REC_ID WHERE [ORDER_ID] = @original_ORDER_ID AND (([REC_ID] = @original_REC_ID) OR ([REC_ID] IS NULL AND @original_REC_ID IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_ORDER_ID" Type="Int32" />
                    <asp:Parameter Name="original_REC_ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="REC_ID" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="REC_ID" Type="Int32" />
                    <asp:Parameter Name="original_ORDER_ID" Type="Int32" />
                    <asp:Parameter Name="original_REC_ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView3" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ORDER_ID" DataSourceID="SqlDataSource3" OnSelectedIndexChanged="GridView3_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="ORDER_ID" HeaderText="ORDER_ID" InsertVisible="False" ReadOnly="True" SortExpression="ORDER_ID" />
                    <asp:BoundField DataField="REC_ID" HeaderText="REC_ID" SortExpression="REC_ID" />
                </Columns>
            </asp:GridView>
        </div>
        <br />
        <div runat="server" id="prodDiv" visible="false">
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Database1 %>" DeleteCommand="DELETE FROM [PRODUCT] WHERE [PROD_ID] = @original_PROD_ID AND (([PROD_NAME] = @original_PROD_NAME) OR ([PROD_NAME] IS NULL AND @original_PROD_NAME IS NULL)) AND (([PROD_SIZE] = @original_PROD_SIZE) OR ([PROD_SIZE] IS NULL AND @original_PROD_SIZE IS NULL)) AND (([PROD_STOCKQTY] = @original_PROD_STOCKQTY) OR ([PROD_STOCKQTY] IS NULL AND @original_PROD_STOCKQTY IS NULL)) AND (([PROD_CATEGORY] = @original_PROD_CATEGORY) OR ([PROD_CATEGORY] IS NULL AND @original_PROD_CATEGORY IS NULL)) AND [PROD_STATUS] = @original_PROD_STATUS AND (([EXP_DATE] = @original_EXP_DATE) OR ([EXP_DATE] IS NULL AND @original_EXP_DATE IS NULL)) AND (([DONOR_ID] = @original_DONOR_ID) OR ([DONOR_ID] IS NULL AND @original_DONOR_ID IS NULL))" InsertCommand="INSERT INTO [PRODUCT] ([PROD_NAME], [PROD_SIZE], [PROD_STOCKQTY], [PROD_CATEGORY], [PROD_STATUS], [EXP_DATE], [DONOR_ID]) VALUES (@PROD_NAME, @PROD_SIZE, @PROD_STOCKQTY, @PROD_CATEGORY, @PROD_STATUS, @EXP_DATE, @DONOR_ID)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [PRODUCT]" UpdateCommand="UPDATE [PRODUCT] SET [PROD_NAME] = @PROD_NAME, [PROD_SIZE] = @PROD_SIZE, [PROD_STOCKQTY] = @PROD_STOCKQTY, [PROD_CATEGORY] = @PROD_CATEGORY, [PROD_STATUS] = @PROD_STATUS, [EXP_DATE] = @EXP_DATE, [DONOR_ID] = @DONOR_ID WHERE [PROD_ID] = @original_PROD_ID AND (([PROD_NAME] = @original_PROD_NAME) OR ([PROD_NAME] IS NULL AND @original_PROD_NAME IS NULL)) AND (([PROD_SIZE] = @original_PROD_SIZE) OR ([PROD_SIZE] IS NULL AND @original_PROD_SIZE IS NULL)) AND (([PROD_STOCKQTY] = @original_PROD_STOCKQTY) OR ([PROD_STOCKQTY] IS NULL AND @original_PROD_STOCKQTY IS NULL)) AND (([PROD_CATEGORY] = @original_PROD_CATEGORY) OR ([PROD_CATEGORY] IS NULL AND @original_PROD_CATEGORY IS NULL)) AND [PROD_STATUS] = @original_PROD_STATUS AND (([EXP_DATE] = @original_EXP_DATE) OR ([EXP_DATE] IS NULL AND @original_EXP_DATE IS NULL)) AND (([DONOR_ID] = @original_DONOR_ID) OR ([DONOR_ID] IS NULL AND @original_DONOR_ID IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_PROD_ID" Type="Int32" />
                    <asp:Parameter Name="original_PROD_NAME" Type="String" />
                    <asp:Parameter Name="original_PROD_SIZE" Type="String" />
                    <asp:Parameter Name="original_PROD_STOCKQTY" Type="Int32" />
                    <asp:Parameter Name="original_PROD_CATEGORY" Type="String" />
                    <asp:Parameter Name="original_PROD_STATUS" Type="String" />
                    <asp:Parameter DbType="DateTime2" Name="original_EXP_DATE" />
                    <asp:Parameter Name="original_DONOR_ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="PROD_NAME" Type="String" />
                    <asp:Parameter Name="PROD_SIZE" Type="String" />
                    <asp:Parameter Name="PROD_STOCKQTY" Type="Int32" />
                    <asp:Parameter Name="PROD_CATEGORY" Type="String" />
                    <asp:Parameter Name="PROD_STATUS" Type="String" />
                    <asp:Parameter DbType="DateTime2" Name="EXP_DATE" />
                    <asp:Parameter Name="DONOR_ID" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="PROD_NAME" Type="String" />
                    <asp:Parameter Name="PROD_SIZE" Type="String" />
                    <asp:Parameter Name="PROD_STOCKQTY" Type="Int32" />
                    <asp:Parameter Name="PROD_CATEGORY" Type="String" />
                    <asp:Parameter Name="PROD_STATUS" Type="String" />
                    <asp:Parameter DbType="DateTime2" Name="EXP_DATE" />
                    <asp:Parameter Name="DONOR_ID" Type="Int32" />
                    <asp:Parameter Name="original_PROD_ID" Type="Int32" />
                    <asp:Parameter Name="original_PROD_NAME" Type="String" />
                    <asp:Parameter Name="original_PROD_SIZE" Type="String" />
                    <asp:Parameter Name="original_PROD_STOCKQTY" Type="Int32" />
                    <asp:Parameter Name="original_PROD_CATEGORY" Type="String" />
                    <asp:Parameter Name="original_PROD_STATUS" Type="String" />
                    <asp:Parameter DbType="DateTime2" Name="original_EXP_DATE" />
                    <asp:Parameter Name="original_DONOR_ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView4" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="PROD_ID" DataSourceID="SqlDataSource4">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
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
        </div>
        <br />
    </form>
</body>
</html>
