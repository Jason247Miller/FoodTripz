using System;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace WebFormPractice
{
    public partial class RecipientRegistration : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {


                if (DropDownListUserType.SelectedValue == "Food Donor")
                {
                    //connect db to manager sql data source
                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
                    conn.Open();

                    string checkuser = "select count(*) from Donor where UserName='" + TextBoxUser.Text + "'";
                    SqlCommand com = new SqlCommand(checkuser, conn);
                    int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
                    if (temp == 1)
                    {
                        Response.Write("Donor already Exists under this username!");
                    }
                    conn.Close();
                }
                else if (DropDownListUserType.SelectedValue == "Food Recipient")
                {
                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
                    conn.Open();

                    string checkuser = "select count(*) from Recipient where UserName='" + TextBoxUser.Text + "'";
                    SqlCommand com = new SqlCommand(checkuser, conn);
                    int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
                    if (temp == 1)
                    {
                        Response.Write("Recipient already Exists under this username!");
                    }
                    conn.Close();
                }
                

            }
        }



        //Button1 is Submit Button
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (DropDownListUserType.SelectedValue == "Food Donor")
            {

                try
                {   //Everytime button is clicked, a new unique id will be generated

                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
                    conn.Open();

                    string insertQuery = "insert into Donor (UserName,Email, Password) values ( @Uname, @email, @password)";
                    SqlCommand com = new SqlCommand(insertQuery, conn);

                    com.Parameters.AddWithValue("@Uname", TextBoxUser.Text);
                    com.Parameters.AddWithValue("@email", TextBoxEmail.Text);
                    com.Parameters.AddWithValue("@password", TextBoxPass.Text);
                    com.ExecuteNonQuery();
                    //redirects the user to a different page
                    Response.Redirect("Manager.aspx");
                    Response.Write("Registration was successful");

                    conn.Close();
                }
                catch (Exception ex)
                {
                    Response.Write("Error:" + ex.ToString());
                }

            }
            
            TextBoxUser.Text = "";
            TextBoxPass.Text = "";
            TextBoxConfirmPass.Text = "";
            TextBoxEmail.Text = "";
            DropDownListUserType.ClearSelection();
           
        }
    }
}