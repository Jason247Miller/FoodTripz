using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;




namespace WebFormPractice
{
    public partial class RecipientHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            string markers = GetMarkers();
            

            Literal1.Text = @" <script type = 'text/javascript' >
              var lng = 0;
              var lat = 0; 
              if(navigator.geolocation)
              {
               navigator.geolocation.getCurrentPosition(showPosition);
                                        
                function showPosition(position){
                       lng = position.coords.longitude;
                       lat = position.coords.latitude; 
                                               }
                }
              else{ document.write(""geolocation is not working"");}
              
                 function initialize() {
                var mapOptions = {
                center: new google.maps.LatLng(lat, lng ),
                zoom: 8,
                 mapTypeId: google.maps.MapTypeId.ROADMAP
                 };
            var myMap = new google.maps.Map(document.getElementById('mapArea'),
             mapOptions);
            " +
            markers +
             @" " +
          "} </script> ";

        }
        protected string GetMarkers()
        {
            string markers = "";
            //string lat = "";
            //string lng = ""; 
            using (SqlConnection con = new
                SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT Latitude, Longitude, City " +
                    "FROM Locations");
                cmd.Connection = con;
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                int i = 0;
                while (reader.Read())
                {
                    i++;
                    markers += @"var marker" + i.ToString() + @" = new google.maps.Marker({
    position: new google.maps.LatLng(" + reader["Latitude"].ToString() + ", " +
      reader["Longitude"].ToString() + ")," +
      @"map: myMap,
     title: '" + reader["City"].ToString() + "'}); " +
     @"var contentString = ""<div id='content'><h1>Giant Eagle</h1><p>We have"+
       @"plenty of items we need to donate!</p><a href='PublicDonorPage.aspx'>Visit their page</a></div>"";" +

     @"var infowindow = new google.maps.InfoWindow({ content: contentString});" +
     @"marker" + i.ToString() + ".addListener('click', function(){infowindow.open(" +
     @"myMap,marker" + i.ToString() + "); });";
  

                }
            }
            return markers;

        }
   
        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}
