using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Windows;
using System.Diagnostics; 

namespace WebFormPractice
{
    public partial class Login : System.Web.UI.Page
    {
        public string userType;
        protected void Page_Load(object sender, EventArgs e)
        {
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

            SqlConnection conn = new
            SqlConnection(ConfigurationManager.ConnectionStrings["Database1"].ConnectionString);
            conn.Open();
            if (userType != "Select User Type")
            {

                checkuser = "select count(*) from " + userType + " where Email='" +
                                                           TextBoxEmail.Text + "'";
                SqlCommand com = new SqlCommand(checkuser, conn);
                int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
                conn.Close();
                if (temp == 1) //email exists
                {
                    conn.Open();
                    string checkPasswordQuery = "select Password from " + userType + " where Email='" +
                                                TextBoxEmail.Text + "'";
                    SqlCommand passComm = new SqlCommand(checkPasswordQuery, conn);
                    string password = passComm.ExecuteScalar().ToString().Replace(" ", "");
                    if (password == TextBoxPassword.Text && verifyDonor())
                    {   
                        Session["Username"] = userType;
                        Session["Email"] = TextBoxEmail.Text;
                        Session["logged"] = "loggedIN";
                        Response.Write("Password is correct");
                        Response.Redirect(userType + "HomePage.aspx");
                    }
                    else
                    {
                        LabelPasswordInvalid.Visible = true;
                        LabelPasswordInvalid.Text = "Password Invalid";
                    }
                }
                else
                {
                    LabelEmailInvalid.Visible = true;
                    LabelEmailInvalid.Text = "email invalid";
                }
                conn.Close();
            }
            else
            {
                LabelUserTypeNotSelected.Visible = true;
                LabelUserTypeNotSelected.Text = "Select Usertype";
            }
            conn.Close();

        }
        private bool verifyDonor()
        {
            bool permitted = false;
            SqlConnection conn3 = new
         SqlConnection(ConfigurationManager.ConnectionStrings["Database1"].ConnectionString);
            conn3.Open();
            string queryRegStatus = "Select reg_status from donor where email = '" + TextBoxEmail.Text + "'";
            SqlCommand RegStatComm = new SqlCommand(queryRegStatus, conn3);

            if (userType == "Donor")
            {

                string reg_status = RegStatComm.ExecuteScalar().ToString();
                if (reg_status == "D") { permitted = false; LabelPermission.Text = "User is awaiting Admin approval"; }
                else { permitted = true; }

                Debug.WriteLine("reg_status = " + reg_status);


            }
            else { permitted = true; }

            conn3.Close();
            Debug.WriteLine("returning= " + permitted.ToString());
            return permitted;
        }
        protected void LinkButtonForgotPassword_Click(object sender, EventArgs e)
        {
            Response.Redirect("ForgotPassword.aspx?Type=userType");

        }
    }
}
