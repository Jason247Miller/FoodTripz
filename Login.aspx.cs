using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace WebFormPractice
{ public partial class Login : System.Web.UI.Page
    {
        public string userType; 
        protected void Page_Load(object sender, EventArgs e)
        {
                                    
        }
        protected void Button_Login_Click(object sender, EventArgs e)
        {
            userType = DropDownUserType.SelectedValue;
            string checkuser = "";
         
            SqlConnection conn = new 
            SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            conn.Open();
            if (userType != "Select User Type")
            {
                
                checkuser = "select count(*) from " + userType + " where UserName='" +
                                                           TextBoxUsername.Text + "'";
                SqlCommand com = new SqlCommand(checkuser, conn);
                int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
                conn.Close();
                if (temp == 1) //user exists
                {
                    conn.Open();
                    string checkPasswordQuery = "select Password from " + userType + " where UserName='" +
                                                TextBoxUsername.Text + "'";
                    SqlCommand passComm = new SqlCommand(checkPasswordQuery, conn);
                    string password = passComm.ExecuteScalar().ToString().Replace(" ", "");
                    if (password == TextBoxPassword.Text)
                    {
                        Session["Username"] = TextBoxUsername.Text;
                        Response.Write("Password is correct");
                        Response.Redirect(userType + "HomePage.aspx");
                    }
                    else {Response.Write("Password is not correct");}
                }
                else{Response.Write("Username is not present");}
                conn.Close();
            }
            else{Response.Write("Username is not present");}
            conn.Close();
         
        }
        
    }
}