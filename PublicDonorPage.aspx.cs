using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Diagnostics;
using System.Data;


namespace WebFormPractice
{
    public partial class PublicDonorPage : System.Web.UI.Page
    {
        private string donor_id;
        private string company_name;
        private string pickupTimes; 
        
        protected void Page_Load(object sender, EventArgs e)

        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Database1"].ConnectionString);
            if (Request.QueryString["donorID"] != null) //if a param is passed
            {
                donor_id = Request.QueryString["donorID"];
                LabelDonorHeader.Text = company_name;
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




            DataTable dt = new DataTable();
            dt.Columns.Add(new DataColumn("PROD_ID", typeof(int)));
            dt.Columns.Add(new DataColumn("PROD_NAME", typeof(string)));
            dt.Columns.Add(new DataColumn("PROD_SIZE", typeof(string)));
            dt.Columns.Add(new DataColumn("PROD_STOCKQTY", typeof(int)));
            dt.Columns.Add(new DataColumn("PROD_CATEGORY", typeof(string)));
            dt.Columns.Add(new DataColumn("EXP_DATE", typeof(string)));

            using (SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["Database1"].ConnectionString))
            {
                using (SqlCommand myCommand = myConnection.CreateCommand())
                {
                    //query all products that are available
                    myConnection.Open();
                    string show = @"SELECT * FROM PRODUCT where donor_id = " + donor_id;
                    SqlCommand sq = new SqlCommand(show, myConnection);
                  
                    SqlDataReader sr = sq.ExecuteReader();
                    dt.Load(sr);
                    GridViewProducts.DataSource = dt;
                    GridViewProducts.DataBind();
                    myConnection.Close();
                    
                }
            }
           
           
          
            GridViewProducts.DataSource = dt;
            GridViewProducts.DataBind();




            
               

        }

      

      
    }
}