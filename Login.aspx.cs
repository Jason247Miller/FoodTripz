using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace WebFormPractice
{
    public partial class Login : System.Web.UI.Page
    {
        public string userType; 
        protected void Page_Load(object sender, EventArgs e)
        {
            
               
            

        }

        protected void Button_Login_Click(object sender, EventArgs e)
        {
            userType = DropDownUserType.SelectedValue;
            string checkuser = "";
            //connection to the recipient table in the Registration DB
            //so i guess it would be if userType = recipient
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            conn.Open();
            if (userType == "Food Donor")
            {
                checkuser = "select count(*) from Donor where UserName='" +
                                                           TextBoxUsername.Text + "'";
                SqlCommand com = new SqlCommand(checkuser, conn);
                int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
                conn.Close();
                if (temp == 1) //user exists
                {
                    conn.Open();
                    string checkPasswordQuery = "select password from Donor where UserName='" +
                                                TextBoxUsername.Text + "'";
                    SqlCommand passComm = new SqlCommand(checkPasswordQuery, conn);
                    string password = passComm.ExecuteScalar().ToString().Replace(" ", "");
                    if (password == TextBoxPassword.Text)
                    {
                        Session["New"] = TextBoxUsername.Text;
                        Response.Write("Password is correct");
                        Response.Redirect("DonorHomePage.aspx");
                        
                    }
                    else
                    {
                        Response.Write("Password is not correct");
                    }
                }
                else
                {
                    Response.Write("Username is not present");
                }
                conn.Close();
            }
            else if(userType == "Food Recipient")
            {
                checkuser = "select count(*) from Recipient where UserName='" +
                                                           TextBoxUsername.Text + "'";
                SqlCommand com = new SqlCommand(checkuser, conn);
                int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
                conn.Close();
                if (temp == 1) //user exists
                {
                    conn.Open();
                    string checkPasswordQuery = "select password from Recipient where UserName='" +
                                                TextBoxUsername.Text + "'";
                    SqlCommand passComm = new SqlCommand(checkPasswordQuery, conn);
                    string password = passComm.ExecuteScalar().ToString().Replace(" ", "");
                    if (password == TextBoxPassword.Text)
                    {
                        Session["New"] = TextBoxUsername.Text;
                        Response.Write("Password is correct");
                        
                    }
                    else
                    {
                        Response.Write("Password is not correct");
                    }
                }
                else
                {
                    Response.Write("Username is not present");
                }
                conn.Close();
            }
        }
    }
}