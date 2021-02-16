using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormPractice
{
    public partial class DonorRegistrationPage : System.Web.UI.Page
    {
        bool validCoordinates = true;
        protected void Page_Load(object sender, EventArgs e)
        {
              
            if (IsPostBack)
            {
               
                string lat = TextBoxLatitude.Text;
                string lon = TextBoxLongitude.Text;
                double latEntered = 0 ;
                double longEntered = 0;
                if (Double.TryParse(lat, out latEntered) && Double.TryParse(lon, out longEntered) )
                {
                    validCoordinates = true; 
                }
                else { validCoordinates = false; }

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
                else if (latEntered < -90 || latEntered > 90)
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
                    conn.Close();
                }
                else
                {
                    conn.Close();
                    Response.Redirect("Default.aspx");
                }

               




            }
        }
    

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {


            try
            {   
                SqlConnection conn2 = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
                conn2.Open();
                //need to adjust for recipient and not donor
                string insertQuery = "insert into Donor (Email,Password,phone, zip) values ( @email, @password,@phone, @zip)";
                SqlCommand com = new SqlCommand(insertQuery, conn2);


                com.Parameters.AddWithValue("@email", TextBoxEmail.Text);
                com.Parameters.AddWithValue("@password", TextBoxPass.Text);
                com.Parameters.AddWithValue("@zip", TextBoxZip.Text);
                com.Parameters.AddWithValue("@phone", TextBoxPhone.Text);


                com.ExecuteNonQuery();


                SqlCommand com2;
                string locationQuery = "insert into LOCATIONS (LOC_NAME, LATITUDE, LONGITUDE)" +
                    "values (@loc_name, @latitude, longitude)";
                com2 = new SqlCommand(locationQuery, conn2);
                com2.Parameters.AddWithValue("@loc_name", TextBoxCity.Text);
                com2.Parameters.AddWithValue("@latitude", TextBoxLatitude.Text);
                com2.Parameters.AddWithValue("@longitude", TextBoxLongitude);

                com.ExecuteNonQuery();



               
            }
            catch (Exception ex)
            {
                Response.Write("Error from catch:" + ex.ToString());
            }




        }
    }
}