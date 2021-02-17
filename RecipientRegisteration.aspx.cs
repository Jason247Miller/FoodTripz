using System;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Diagnostics;
using System.Data;

namespace WebFormPractice
{
    public partial class RecipientRegistration : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {



                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Database1"].ConnectionString);
                conn.Open();

                string checkuser = "select count(*) from Recipient where Email='" + TextBoxEmail.Text + "'";
                SqlCommand com = new SqlCommand(checkuser, conn);
                int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
                //if the email exists
                if (temp >= 1)
                {
                    LabelEmailError.Visible = true;
                    LabelEmailError.Text = "Email already exists!";
                    conn.Close();
                }
                else
                {
                    Response.Redirect("Login.aspx", false);
                }




            }
        }

        //Button1 is Submit Button
        //code below adds to db
        protected void Button1_Click(object sender, EventArgs e)
        {
            Debug.WriteLine("inside button click");


            string _connStr = ConfigurationManager.ConnectionStrings["Database1"].ConnectionString;
            string _query = "INSERT INTO RECIPIENT(FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUM,PASSWORD,ZIP) values(@fname,@lname, @email,@phone,@password,@zip)";
            using (SqlConnection conn = new SqlConnection(_connStr))
            {
                using (SqlCommand comm = new SqlCommand())
                {
                    comm.Connection = conn;
                    comm.CommandType = CommandType.Text;
                    comm.CommandText = _query;
                    comm.Parameters.AddWithValue("@fname", TextBoxFname.Text);
                    comm.Parameters.AddWithValue("@lname", TextBoxLname.Text);
                    comm.Parameters.AddWithValue("@email", TextBoxEmail.Text);
                    comm.Parameters.AddWithValue("@phone", TextBoxPhone.Text);
                    comm.Parameters.AddWithValue("@password", TextBoxPass.Text);
                    comm.Parameters.AddWithValue("@zip", TextBoxZip.Text);
                    try
                    {
                        conn.Open();
                        comm.ExecuteNonQuery();
                    }

                    catch (Exception ex)
                    {
                        Response.Write("Error:" + ex.ToString());
                    }
                }
            }

        }
    }
}




