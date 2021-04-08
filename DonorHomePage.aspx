<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DonorHomePage.aspx.cs" Inherits="WebFormPractice.DonorHomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="text-left">
    <asp:Button ID="ButtonLogOff" runat="server" Text="Log Off" Font-Bold="True" OnClick="ButtonLogOff_Click" />
        </div>
    <div class="text-center">
         
         <asp:Label ID="LabelWelcome" runat="server" Text="PRODUCT MANAGEMENT" Font-Bold="True" Font-Size="X-Large"></asp:Label>
        <div>
    <table class="nav-justified" style="height: 432px">
        <tr>
            <td style="width: 934px">
                <asp:GridView ID="GridViewProducts" runat="server" AutoGenerateEditButton="True" AutoGenerateColumns="False" DataKeyNames="PROD_ID" DataSourceID="Database1" Height="319px" Width="956px" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" ShowFooter="True" onrowcommand="GridViewProducts_RowCommand"  style="margin-right: 0px" >
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <Columns>
                        <asp:TemplateField HeaderText="PROD_ID" InsertVisible="False" SortExpression="PROD_ID">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("PROD_ID") %>'></asp:Label>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:Button ID="ButtonAdd" runat="server" ValidationGroup="addGroup" CommandName="Insert"  Text="Add"  />
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("PROD_ID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="PROD_NAME" SortExpression="PROD_NAME">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("PROD_NAME") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="TextBoxProdName" runat="server"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" validationgroup="addGroup" ControlToValidate="TextBoxProdName" ErrorMessage="name required" ForeColor="#CC0000"></asp:RequiredFieldValidator> 
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("PROD_NAME") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="PROD_SIZE" SortExpression="PROD_SIZE">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("PROD_SIZE") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="TextBoxProdSize" runat="server"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidatorSize" runat="server" validationgroup="addGroup" ControlToValidate="TextBoxProdSize" ErrorMessage="size required" ForeColor="#CC0000"></asp:RequiredFieldValidator> 
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("PROD_SIZE") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="PROD_STOCKQTY" SortExpression="PROD_STOCKQTY">

                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("PROD_STOCKQTY") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="TextBoxProdStockQty" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorQuantity" runat="server" validationgroup="addGroup" ControlToValidate="TextBoxProdStockQty" ErrorMessage="qty required" ForeColor="#CC0000"></asp:RequiredFieldValidator> 
                                
                                <asp:RegularExpressionValidator ID="vldNumber" ControlToValidate="TextBoxProdStockQty"  
                                    Display="Dynamic" ErrorMessage="Not a number" ValidationExpression="(^([0-9]*\d*\d{1}?\d*)$)" Runat="server" ForeColor="#CC0000"/> 
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("PROD_STOCKQTY") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="PROD_CATEGORY" SortExpression="PROD_CATEGORY">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("PROD_CATEGORY") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="TextBoxCategory" runat="server"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidatorCategory" runat="server" ValidationGroup="addGroup" ControlToValidate="TextBoxCategory" ErrorMessage="Category Required" ForeColor="#CC0000"></asp:RequiredFieldValidator> 
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("PROD_CATEGORY") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="PROD_STATUS" SortExpression="PROD_STATUS">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("PROD_STATUS") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="DropDownListProdStatus" runat="server">
                                    <asp:ListItem>A</asp:ListItem>
                                    <asp:ListItem>D</asp:ListItem>
                                    <asp:ListItem></asp:ListItem>
                                </asp:DropDownList>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidatorStatus" runat="server"   ControlToValidate="DropDownListProdStatus" ValidationGroup="addGroup" ErrorMessage="status required" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("PROD_STATUS") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="EXP_DATE" SortExpression="EXP_DATE">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("EXP_DATE") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="TextBoxDate" runat="server"></asp:TextBox>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorDate" runat="server" ValidationGroup="addGroup" ControlToValidate="TextBoxDate" ErrorMessage="Exp Date Required" ForeColor="#CC0000"></asp:RequiredFieldValidator> 
                                <asp:RegularExpressionValidator runat="server" ControlToValidate="TextBoxDate" ValidationExpression="(((0|1)[0-9]|2[0-9]|3[0-1])\/(0[1-9]|1[0-2])\/((19|20)\d\d))$" ErrorMessage="Invalid date format." ForeColor="#CC0000"  />
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("EXP_DATE") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="DONOR_ID"  InsertVisible="False" SortExpression="DONOR_ID">
                            <EditItemTemplate>
                                <asp:Label ID="TextBox7" readonly="true" runat="server" Text='<%# Bind("DONOR_ID") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" readonly="true" Text='<%# Bind("DONOR_ID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#000065" />
                </asp:GridView>
                <asp:SqlDataSource ID="Database1" runat="server" ConnectionString="<%$ ConnectionStrings:Database1 %>" SelectCommand="SELECT * FROM [PRODUCT] WHERE ([DONOR_ID] = @DONOR_ID)" InsertCommand="INSERT INTO [PRODUCT] ([PROD_NAME], [PROD_SIZE], [PROD_STOCKQTY], [PROD_CATEGORY], [PROD_STATUS], [EXP_DATE], [DONOR_ID] ) VALUES (@PROD_NAME, @PROD_SIZE, @PROD_STOCKQTY, @PROD_CATEGORY, @PROD_STATUS, @EXP_DATE, @DONOR_ID)" UpdateCommand="UPDATE [PRODUCT] SET [PROD_NAME] = @PROD_NAME, [PROD_SIZE] = @PROD_SIZE, [PROD_STOCKQTY] = @PROD_STOCKQTY,
 [PROD_CATEGORY] = @PROD_CATEGORY, [PROD_STATUS] = @PROD_STATUS, [EXP_DATE] = @EXP_DATE WHERE [PROD_ID] = @PROD_ID">
                    <InsertParameters>
                        <asp:Parameter Name="PROD_NAME" />
                        <asp:Parameter Name="PROD_SIZE" />
                        <asp:Parameter Name="PROD_STOCKQTY" />
                        <asp:Parameter Name="PROD_CATEGORY" />
                        <asp:Parameter Name="PROD_STATUS" />
                        <asp:Parameter Name="EXP_DATE" />
                        <asp:Parameter Name="DONOR_ID" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="1" Name="DONOR_ID" SessionField="Donor_ID" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="PROD_NAME" />
                        <asp:Parameter Name="PROD_SIZE" />
                        <asp:Parameter Name="PROD_STOCKQTY" />
                        <asp:Parameter Name="PROD_CATEGORY" />
                        <asp:Parameter Name="PROD_STATUS" />
                        <asp:Parameter Name="EXP_DATE" />
                        <asp:Parameter Name="PROD_ID" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:Label ID="LabelProductsEmpty" runat="server" Text="Product Inventory is Currently Empty, Enter in Product Details and click 'Add' to add a product to the Database" Visible="False"></asp:Label>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
            </div>

        </div>





















</asp:Content>
