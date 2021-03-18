using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;
using System.Data;

namespace WebFormPractice
{
    public partial class DonorRegistrationPage : System.Web.UI.Page
    {
        bool validCoordinates = true;
        string lat;
        string longit;
        protected void Page_Load(object sender, EventArgs e)
        {
            Debug.WriteLine("page load");

            if (IsPostBack)
            {
                System.Diagnostics.Debug.WriteLine("pageload postback");

                lat = TextBoxLatitude.Text;
                 longit = TextBoxLongitude.Text;
                double latEntered = 0 ;
                double longEntered = 0;
                if (Double.TryParse(lat, out latEntered) && Double.TryParse(longit, out longEntered) )
                {
                    Debug.WriteLine("inside parse double if");
                    Debug.WriteLine("latEntered= " + latEntered);
                    Debug.WriteLine("longEntered= " + longEntered);
                    validCoordinates = true; 
                }
                else
                {
                    Debug.WriteLine("inside coordinates is false else statement");
                    validCoordinates = false; 
                }

                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Database1"].ConnectionString);
                conn.Open();

                string checkuser = "select count(*) from Donor where Email='" + TextBoxEmail.Text + "'";
                SqlCommand com = new SqlCommand(checkuser, conn);
                int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
                //if the email exists
                if (temp == 1)
                {   
                    LabelEmailError.Visible = true;
                    LabelEmailError.Text = "Email already exists!";
                    

                }

                if (latEntered < -90 || latEntered > 90)
                {
                    LabelLatitude.Text = "Latitude Must be between -90 and 90";

                }
                else if (longEntered < -180 || longEntered > 180)
                {
                    LabelLongitude.Text = "Longitude Must be between -180 and 180";

                }
                else if (TextBoxLatitude.Text == "" || TextBoxLongitude.Text == "")
                {
                    LabelLatitude.Text = "Enter a valid lat or long!";

                }
                else if (validCoordinates == false)
                {
                    LabelLatitude.Text = "You did not enter a valid number!";

                }
                else
                {
                    Response.Redirect("Default.aspx", false);
                }
               

                conn.Close();


            }//end is postback
        }
    

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {

            System.Diagnostics.Debug.WriteLine("inside database try statement");
            string city = TextBoxCity.Text;
            string longitude = TextBoxLongitude.Text;
            string latitude = TextBoxLongitude.Text;
            string _connStr = ConfigurationManager.ConnectionStrings["Database1"].ConnectionString;




            //SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Database1"].ConnectionString);
            //conn.Open();
            //string insertQuery = "insert into donor  (email, password,company_name, pickup_times, street_name,zip,LOC_NAME, LATITUDE, LONGITUDE) values (@email,@password,@company_name,@pickup_times,@street_name,@zip,@locname,@lat,@long)";
            //SqlCommand com = new SqlCommand(insertQuery, conn);





            //com.Parameters.AddWithValue("@email", TextBoxEmail.Text);
            //com.Parameters.AddWithValue("@password", TextBoxPass.Text);
            //com.Parameters.AddWithValue("@company_name", TextBoxCompanyName.Text);
            //com.Parameters.AddWithValue("@pickup_times", TextBoxPickupTimes.Text);
            //com.Parameters.AddWithValue("@street_name", TextBoxStreetName);
            //com.Parameters.AddWithValue("@zip", TextBoxZip.Text);
            //com.Parameters.AddWithValue("@locname", TextBoxCity.Text);
            //com.Parameters.AddWithValue("@lat", TextBoxLatitude.Text);
            //com.Parameters.AddWithValue("@long", TextBoxLongitude.Text);



            SqlConnection conn2 = new SqlConnection(ConfigurationManager.ConnectionStrings["Database1"].ConnectionString);
            conn2.Open();
            string insertDonor = "INSERT INTO DONOR(EMAIL, PASSWORD, COMPANY_NAME, PICKUP_TIMES,street_name, ZIP,LOC_NAME,LATITUDE,LONGITUDE)" +
                "VALUES (@email, @password, @company_name, @pickup_times,@street_name, @zip, @loc_name, @latitude, @longitude)";
            SqlCommand cmd2 = new SqlCommand(insertDonor, conn2);
            cmd2.Parameters.AddWithValue("@email", TextBoxEmail.Text);
            cmd2.Parameters.AddWithValue("@password", TextBoxPass.Text);
            cmd2.Parameters.AddWithValue("@company_name", TextBoxCompanyName.Text);
            cmd2.Parameters.AddWithValue("@pickup_times", TextBoxPickupTimes.Text);
            cmd2.Parameters.AddWithValue("@street_name", TextBoxStreetName.Text);
            cmd2.Parameters.AddWithValue("@zip", TextBoxZip.Text);
            cmd2.Parameters.AddWithValue("@loc_name", TextBoxCompanyName.Text);
            cmd2.Parameters.AddWithValue("@latitude", TextBoxLatitude.Text);
            cmd2.Parameters.AddWithValue("@longitude", TextBoxLongitude.Text);
            cmd2.ExecuteNonQuery();
            conn2.Close();



                       
                      
           







            
            

           

        }
    }
}