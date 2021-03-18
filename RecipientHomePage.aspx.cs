using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web;
using System.Diagnostics;

namespace WebFormPractice
{
    public partial class RecipientHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                if (Session["logged"] == null)
                {
                    Response.Redirect("Default.aspx");
                }
            }




            string markers = GetMarkers();

            //  if (postback) { }
            Literal1.Text = @"<script type = 'text/javascript' >
                              
                 function initialize() {
                
             
                var mapOptions = {
                center: new google.maps.LatLng(40.4406, -79.9959 ),
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
                SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Database1"].ConnectionString))
            {





                //SqlCommand cmd = new SqlCommand("SELECT Donor_ID as donor_ID, company_name as company, Latitude as lat, Longitude as lng FROM Donor inner join Locations on Donor.Location_ID = Locations.Location_ID");
                SqlCommand cmd = new SqlCommand("Select Donor_ID, company_name as company, latitude as lat, longitude as lng from donor");
                cmd.Connection = con;

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                int i = 0;





                

                while (reader.Read())
                {

                    

                    i++;
                    markers += @"var marker" + i.ToString() + @" = new google.maps.Marker({
    position: new google.maps.LatLng(" + reader["lat"].ToString() + ", " +
      reader["lng"].ToString() + ")," +
      @"map: myMap,
     title: '" + reader["company"].ToString() + "'}); " +
     @"var contentString = ""<div id='content'><h1>" + reader["company"].ToString() + "</h1><p>We have" +
       @"plenty of items we need to donate!</p>" + @"<a href='PublicDonorPage.aspx?donorID=" + reader["donor_ID"].ToString() + "'" +
       @">Visit their page</a></div>"";" +
       @"var infowindow" + i.ToString() + " = new google.maps.InfoWindow({ content: contentString});" +
     @"marker" + i.ToString() + ".addListener('click', function(){infowindow" + i.ToString() + ".open(" +
     @"myMap,marker" + i.ToString() + "); });";
                    Debug.WriteLine("company name for " + reader["donor_ID"].ToString() + " is " + reader["company"]); 
                    

                }


                
                con.Close();
            }


            return markers;

        }

        protected void LinkButtonLogOff_Click(object sender, EventArgs e)
        {

            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
            Response.Cache.SetNoStore();
            Session.Abandon();
            Request.Cookies.Clear();
            Response.Cache.SetSlidingExpiration(true);
            Response.Redirect("/Default.aspx", true);
        }
    }
}