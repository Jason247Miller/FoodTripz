
<%@ Page Title="" Language="C#"AutoEventWireup="true" CodeBehind="RecipientHomePage.aspx.cs" Inherits="WebFormPractice.RecipientHome" %>

<head runat="server">
    <title>
        Recipient Home page
    </title>
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
            width: 807px;
            height: 500px;
        }
    </style>
    
       <script  src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDYS0GMYNJSbBAwpNI7VK_0vuLZB25Rgkc">
           
          
          
       </script>
    <script>
        

       
       
        

        function initialize()
        {
                
          
           


        }
           
           

    </script>
</head>
<body onload="initialize()">
    <div class="topnav">
  <a class="active" href="Default">Home</a>
  <a href="About">About</a>
  <a href="Contact">Contact</a>
 
</div>
    <h1>Use the map to find Donors near you!</h1>
    <h3>Simply click on a red marker to learn more about each donor.</h3>
    <form id="form1" runat="server">
        <p>
           <button type="button" id="centerMapButton">Center</button>
            <asp:TextBox ID="zipCodeTextBox" runat="server"></asp:TextBox>
        </p>
    <hr />
        <div id="mapArea" runat="server" class="auto-style1">            
        </div>
        
        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
    </form>
</body>
