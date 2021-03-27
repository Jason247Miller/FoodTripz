<%@ Page Title="" Language="C#"MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PublicDonorPage.aspx.cs" Inherits="WebFormPractice.PublicDonorPage" %>



<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


  
        <div>
            <div class="text-left">
                <strong>
                <asp:Label ID="LabelDonorHeader" runat="server" style="font-size: xx-large" Text="Label"></asp:Label>
                </strong>
      </div>
          
            
             
             <div style="height: 447px">
                        <asp:GridView ID="GridViewProducts" OnRowCommand="GridViewProducts_RowCommand"
                            runat="server" AutoGenerateColumns="False"  Height="266px" Width="858px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" style="margin-top: 14px">
                            <Columns>
                                <asp:ButtonField ButtonType="Button" CommandName="AddToCart" Text="AddToCart" />
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
                <strong>
                    <div>
                        <div>

                         <asp:Label ID="LabelNoProduct" runat="server" Text="Label" Visible="False"></asp:Label>
                        </div>
                       <div style="height: 79px">

                <strong>

                           <asp:Button ID="ButtonGoToCart" runat="server" Text="Go To Cart" OnClick="ButtonGoToCart_Click" />

                </strong>

                       </div>
                        

                        </div>
                </strong>
    </div>
            </div>
            

    





    </asp:Content>

