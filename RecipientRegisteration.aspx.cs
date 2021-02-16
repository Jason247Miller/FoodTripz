using System;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Diagnostics;

namespace WebFormPractice
{
    public partial class RecipientRegistration : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {


              
                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
                    conn.Open();

                    string checkuser = "select count(*) from Recipient where Email='" + TextBoxEmail.Text + "'";
                    SqlCommand com = new SqlCommand(checkuser, conn);
                    int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
                //if the email exists
                if (temp >=1)
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



        //Button1 is Submit Button
        protected void Button1_Click(object sender, EventArgs e)
        {
            Debug.WriteLine("inside button click");

                try
                {   //Everytime button is clicked, a new unique id will be generated

                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
                    conn.Open();
                    //need to adjust for recipient and not donor
                    string insertQuery = "insert into Recipient (FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUM,PASSWORD,ZIP) values (@fname,@lname, @email,@phone, @password,@zip)";
                    SqlCommand com = new SqlCommand(insertQuery, conn);

                   
                    com.Parameters.AddWithValue("@email", TextBoxEmail.Text);
                    com.Parameters.AddWithValue("@password", TextBoxPass.Text);
                    com.Parameters.AddWithValue("@lname", TextBoxLname.Text);
                    com.Parameters.AddWithValue("@fname", TextBoxFname.Text);
                    com.Parameters.AddWithValue("@zip", TextBoxZip.Text);
                    com.Parameters.AddWithValue("@phone", TextBoxPhone.Text);


                com.ExecuteNonQuery();
                   
                   
                    //Response.Write("Registration was successful");

                    conn.Close();
                }
                catch (Exception ex)
                {
                    Response.Write("Error:" + ex.ToString());
                }

            
            
            
           
           
        }
    }
}