<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecipientHome.aspx.cs" Inherits="WebFormPractice.RecipientHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script  src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDYS0GMYNJSbBAwpNI7VK_0vuLZB25Rgkc"type="text/javascript"></script>
    <script>  
        var markers = [{
            "title": 'Pittsburgh',
            "lat": '40.44062',
            "lng": '-79.99589',
            "description": 'City of Steel' }];
      
       
            var map;
        function initialize()
        {

        var mapOptions = {
                zoom: 13,
            center: new google.maps.LatLng(40.44062, -79.99589),
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };

            const contentString =
                '<div id="content">' +
                '<div id="siteNotice">' +
                "</div>" +
                '<h1 id="firstHeading" class="firstHeading">Giant Eagle</h1>' +
                '<div id="bodyContent">' +
                "<p><b>Uluru</b>, also referred to as <b>Ayers Rock</b>, is a large " +
                "sandstone rock formation in the southern part of the " +
                "Northern Territory, central Australia. It lies 335&#160;km (208&#160;mi) " +
                "south west of the nearest large town, Alice Springs; 450&#160;km " +
                "(280&#160;mi) by road. Kata Tjuta and Uluru are the two major " +
                "features of the Uluru - Kata Tjuta National Park. Uluru is " +
                "sacred to the Pitjantjatjara and Yankunytjatjara, the " +
                "Aboriginal people of the area. It has many springs, waterholes, " +
                "rock caves and ancient paintings. Uluru is listed as a World " +
                "Heritage Site.</p>" +
                '<p>Attribution: Uluru, <a href="PublicDonorPage.aspx">' +
                "Click Here to view listed items</a> " +
                "(last visited June 22, 2009).</p>" +
                "</div>" +
                "</div>";
            const infowindow = new google.maps.InfoWindow({
                content: contentString,
            });
        var mapcv = document.getElementById('map');            

        map = new google.maps.Map(mapcv,
            mapOptions);
            const myLatLng = { lat: 40.44062, lng: -79.99589 };
            marker =  new google.maps.Marker({
                position: myLatLng,
                map,
                title: "Hello World!",
            });
            marker.addListener("click", () => {
                infowindow.open(map, marker);
            });

        }
        function PageRedirect() {
            window.location = "PublicDonorPage.aspx";
        }

       


    google.maps.event.addDomListener(window, 'load', initialize);

   
    </script> 
</head>
<body>


    <form id="form1" runat="server">
        <div>
            <h1>Enter Your Location Details</h1>

        </div>
        <div>
         <asp:TextBox ID="txt_location" TextMode="MultiLine" Width="400px" Height="70px" runat="server"></asp:TextBox>  
        </div>
        <div>  
            <input type="button" value="Search" onclick="getmap()"/>  
        </div> 
        <div id="map" style="width:100%; height:500px; border: 5px solid #5E5454;"> 
      </div>
    </form>
</body>
</html>
