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
    public partial class PublicDonorPage : System.Web.UI.Page
    {
        private string donor_id;
        private string company_name;
        private string pickupTimes; 
        
        protected void Page_Load(object sender, EventArgs e)

        {
           
           
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
           

          
            if (Request.QueryString["donorID"] != null) //if a param is passed
            {
                donor_id = Request.QueryString["donorID"];                          
            }
            SqlCommand cmd = new SqlCommand("select * from Donor where Donor_ID ='" + donor_id + "'");
           
            cmd.Connection = conn;
            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                company_name = reader["company_name"].ToString();
                pickupTimes = reader["Pickup_Times"].ToString(); 
            }
               LabelDonorHeader.Text = company_name;
               

        }

      

        protected void LinkButtonLogOff_Click(object sender, EventArgs e)
        {
            Response.Redirect("RecipientHomePage.aspx"); 
        }
    }
}