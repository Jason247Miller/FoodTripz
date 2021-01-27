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
            height: 721px;
               text-align: center;
           }
           .auto-style2 {
               text-align: left;
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



       
           
        




    </body>






</html>
