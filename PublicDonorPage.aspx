<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="PublicDonorPage.aspx.cs" Inherits="WebFormPractice.PublicDonorPage" %>



<html>


    <head>

        <title>Public Donor Page</title>
        <%-- nav bar style--%>
       <style type="text/css">
        body {
    text-align: center;
             }
        form {
    display: inline-block;
              }
        .topnav{
            overflow:hidden;
            background-color:#333; 

        }
        .topnav a {
            float:left;
            color:#f2f2f2;
            text-align: center; 
            padding: 14px 16px;
             text-decoration: none;
           font-size: 17px;
        }
        .topnav a:hover {
         background-color: #ddd;
         color: black;
                   }

            .topnav a.active {
                background-color: #4CAF50;
                color: white;
            }
        .auto-style1 {
            width: 1111px;
            height: 95px;
               text-align: center;
           }
           .auto-style2 {
               text-align: left;
           }
           .auto-style3 {
               margin-top: 1px;
           }
        </style>

        <script>

        </script>
    </head>


    <body>
        <form id="form1" runat="server">
         <div class="auto-style2">
        
             <asp:LinkButton ID="LinkButtonBack" runat="server" OnClick="LinkButtonLogOff_Click">Back</asp:LinkButton>
        
             </div>
        <h1 id="DonorHeader1" class="auto-style1">

            <asp:Label ID="LabelDonorHeader" runat="server"></asp:Label>

            
         

            
            </h1>
           



       
           
        




        </form>



       
           
        
         <asp:GridView ID="GridViewProducts" runat="server" Width="995px" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" CssClass="auto-style3" Height="148px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
             <Columns>
                 <asp:BoundField HeaderText="Product" ReadOnly="True" />
                 <asp:BoundField HeaderText="Size" ReadOnly="True" />
                 <asp:BoundField HeaderText="amount in stock" ReadOnly="True" />
                 <asp:BoundField HeaderText="Category" />
                 <asp:BoundField HeaderText="Expiration" />
                 <asp:ButtonField ButtonType="Button" CommandName="AddToCart" Text="AddToCart" />
             </Columns>
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



    </body>






</html>
