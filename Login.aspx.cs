using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Diagnostics; 

namespace WebFormPractice
{ public partial class Login : System.Web.UI.Page
    {
        public string userType; 
        protected void Page_Load(object sender, EventArgs e)
        {
            //clear cache 
            Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
            Response.Cache.SetNoStore();
        }
        protected void Button_Login_Click(object sender, EventArgs e)
        {
            LabelPasswordInvalid.Text = "";
            LabelEmailInvalid.Text = ""; 
            userType = DropDownUserType.SelectedValue;
            string checkuser = "";
         
            if (userType != "Select User Type")
            {
                //stores number of times email is found in db
                int temp = 0;
                string password = "";

                 
                checkuser = "select count(*) from " + userType + " where Email='" + TextBoxEmail.Text + "'";

                //open connection and command to determine if email exists
                using (SqlConnection conn = new
                SqlConnection(ConfigurationManager.ConnectionStrings["Database1"].ConnectionString))
                {   using (SqlCommand com = new SqlCommand(checkuser, conn))
                    {
                        conn.Open(); 
                     temp = Convert.ToInt32(com.ExecuteScalar().ToString());
                        conn.Close(); 
                    }
                }
                if (temp == 1) //email exists
                {
                    
                    string checkPasswordQuery = "select Password from " + userType + " where Email='" +
                                                TextBoxEmail.Text + "'";
                    //open connection and command to verify password
                    using (SqlConnection conn = new
               SqlConnection(ConfigurationManager.ConnectionStrings["Database1"].ConnectionString))
                    {
                        using (SqlCommand passComm = new SqlCommand(checkPasswordQuery, conn))
                        {
                            conn.Open(); 
                             password = passComm.ExecuteScalar().ToString().Replace(" ", "");
                            conn.Close(); 
                        }
                    }
                    if (password == TextBoxPassword.Text)//passwords match
                    {
                        Session["Email"] = TextBoxEmail.Text;
                        Session["logged"] = "loggedIN";
                        Response.Redirect(userType + "HomePage.aspx");
                     
                    }
                    else //passwords don't match
                    {
                        LabelPasswordInvalid.Visible = true; 
                        LabelPasswordInvalid.Text = "Password Invalid"; 
                    }
                }
                else //email not found 
                {   LabelEmailInvalid.Visible = true;
                    LabelEmailInvalid.Text = "email invalid"; 
                }
            }
            else //user did not select a user type 
            { 
                LabelUserTypeNotSelected.Visible = true;
                   LabelUserTypeNotSelected.Text =  "Select Usertype";
            }
           
         
        }

        protected void LinkButtonForgotPassword_Click(object sender, EventArgs e)
        {
            Response.Redirect("ForgotPassword.aspx?Type=userType"); 

        }
    }
}