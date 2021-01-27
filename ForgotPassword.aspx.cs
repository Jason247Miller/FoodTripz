using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;
using System.Net;
using System.Net.Mail; 


namespace WebFormPractice
{
    public partial class ForgotPassword : System.Web.UI.Page
    { private string userType; 
        protected void Page_Load(object sender, EventArgs e)
        {
           userType = DropDownUserType.SelectedValue;
        }

        protected void ButtonPassword_Click(object sender, EventArgs e)
        {
            string mainconn = ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(mainconn);
            string sqlquery = "select Email, Password from " +  userType + " where Email=@Email";
            SqlCommand sqlcomm = new SqlCommand(sqlquery, conn);
            
            sqlcomm.Parameters.AddWithValue("@Email", TxtEmail.Text);
            conn.Open();
            SqlDataReader sdr = sqlcomm.ExecuteReader();
            if (sdr.Read())
            {
                string username = sdr["Email"].ToString();
                string password = sdr["Password"].ToString();

                MailMessage mm = new MailMessage("jason.miller.6695@gmail.com", TxtEmail.Text);
                mm.Subject = "Your Password";
                mm.Body = string.Format("Hello: <h1>{0}</h1> is your Email id <br/> your password is <h1>{1}</h1>", username, password);
                mm.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.EnableSsl = true;
                NetworkCredential nc = new NetworkCredential();
                nc.UserName = "jason.miller.6695@gmail.com";
                nc.Password = "";
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = nc;
                smtp.Port = 587;
                smtp.Send(mm);
                LabelMessage.Text = "Your password has been sent to " + TxtEmail.Text;
                LabelMessage.ForeColor = Color.Green; 

            }
            else
            {
                LabelMessage.Text = TxtEmail.Text + " - This email id does not exist in our database!";
            }

        }
    }
}