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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {



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
                    conn.Close();
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }




            }
        }
    

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {


            try
            {   

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
                conn.Open();
                //need to adjust for recipient and not donor
                string insertQuery = "insert into Donor (Email,Password,zip,phone) values ( @email, @password,@zip,@phone)";
                SqlCommand com = new SqlCommand(insertQuery, conn);


                com.Parameters.AddWithValue("@email", TextBoxEmail.Text);
                com.Parameters.AddWithValue("@password", TextBoxPass.Text);
                com.Parameters.AddWithValue("@zip", TextBoxZip.Text);
                com.Parameters.AddWithValue("@phone", TextBoxPhone.Text);


                com.ExecuteNonQuery();

                
                

                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write("Error:" + ex.ToString());
            }




        }
    }
}