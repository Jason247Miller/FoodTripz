using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;

namespace WebFormPractice
{
    public partial class DonorRegistrationPage : System.Web.UI.Page
    {
        bool validCoordinates = true;
        string lat;
        string longit;
        protected void Page_Load(object sender, EventArgs e)
        {
            Debug.WriteLine("page load donor registration");

            if (IsPostBack)
            {
                System.Diagnostics.Debug.WriteLine("postback code");

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

                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
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
                    Response.Redirect("Default.aspx");
                }
                Response.Redirect("Default.aspx");










                conn.Close();


            }//end is postback
        }
    

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {

            System.Diagnostics.Debug.WriteLine("submit button code");


            try
            {
                System.Diagnostics.Debug.WriteLine("inside database try statement");
                string city = TextBoxCity.Text;
                string longitude = TextBoxLongitude.Text;
                string latitude = TextBoxLongitude.Text;


                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
                conn.Open();
                string insertQuery = "insert into LOCATIONS(LOC_NAME, LATITUDE, LONGITUDE) values(@loc_name, @latitude, @longitude)";

                    SqlCommand cmd = new SqlCommand( insertQuery, conn);
                    cmd.Parameters.AddWithValue("@loc_name", city);
                    cmd.Parameters.AddWithValue("@latitude", lat);
                    cmd.Parameters.AddWithValue("@longitude", longit);
                  
                    cmd.ExecuteNonQuery();
                    conn.Close(); 

                

             







            }
            catch (Exception ex)
            {
                Response.Write("Error from catch:" + ex.ToString());
            }
           






        }
    }
}