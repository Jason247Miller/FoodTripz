using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Diagnostics;
using System.Data;
//using System.Windows.Forms;

namespace WebFormPractice
{
    public partial class DonorHomePage : System.Web.UI.Page
    {
        public string Donor_ID;
        protected void Page_Load(object sender, EventArgs e)
        {   //page is not finished
            if (Session["Username"] != null)
            {
                if (GridViewProducts.Rows.Count < 1)
                {
                    DataTable dt = getDetails();
                    GridViewProducts.DataSourceID = null;
                    GridViewProducts.DataSource = this.getDetails();
                    GridViewProducts.DataBind();

                    LabelProductsEmpty.Visible = true;
                }
                else
                {
                    LabelProductsEmpty.Visible = false;
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }

            SqlConnection conn = new
            SqlConnection(ConfigurationManager.ConnectionStrings["Database1"].ConnectionString);
            conn.Open();
            //obtain donor_id 
         
            
            string donorIDQuery = "select DONOR_ID from DONOR where Email = " + "'" + Session["Email"].ToString() + "'";
            SqlCommand donorIDCommand = new SqlCommand(donorIDQuery, conn);
            Donor_ID = donorIDCommand.ExecuteScalar().ToString();
            Session["Donor_ID"] = Donor_ID;
            Debug.WriteLine("Donor_ID = " + Session["Donor_ID"].ToString());

           
            conn.Close();
        }
        protected void GridViewProducts_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            
            Debug.Write("Insert Block ");
            if (e.CommandName == "Insert")
            {
                Debug.Write("Data Source Inserting");
                TextBox prodName = (TextBox)GridViewProducts.FooterRow.FindControl("TextBoxProdName");
                TextBox prodSize = (TextBox)GridViewProducts.FooterRow.FindControl("TextBoxProdSize");
                TextBox stockQty = (TextBox)GridViewProducts.FooterRow.FindControl("TextBoxProdStockQty");
                TextBox category = (TextBox)GridViewProducts.FooterRow.FindControl("TextBoxCategory");
                DropDownList prodStatus = (DropDownList)GridViewProducts.FooterRow.FindControl("DropDownListProdStatus");
                TextBox date = (TextBox)GridViewProducts.FooterRow.FindControl("TextBoxDate");

                //Create seperate ValidationGroups for both the EditItemTemplate validators and the Footer validators.
                //This will prevent one from firing another.

                Debug.Write("Insert Block ");

                Database1.InsertParameters["PROD_NAME"].DefaultValue = prodName.Text.ToString();
                Database1.InsertParameters["PROD_SIZE"].DefaultValue = prodSize.Text.ToString();
                Database1.InsertParameters["PROD_STOCKQTY"].DefaultValue = stockQty.Text.ToString();
                Database1.InsertParameters["PROD_CATEGORY"].DefaultValue = category.Text.ToString();
                Database1.InsertParameters["PROD_STATUS"].DefaultValue = prodStatus.SelectedValue.ToString();
                Database1.InsertParameters["EXP_DATE"].DefaultValue = date.Text.ToString();
                Database1.InsertParameters["DONOR_ID"].DefaultValue = Donor_ID;
                Database1.Insert();
                Response.Redirect("DonorHomePage.aspx", false); 
            }
           

            else if (e.CommandName == "Update")
            {
                int index = Convert.ToInt32(e.CommandArgument);

                
                Debug.WriteLine("index = " + index.ToString());
                GridViewRow row = GridViewProducts.Rows[index];
                DropDownList prodStatus = (DropDownList)row.FindControl("DropDownStatus");

              
                GridViewProducts.UpdateRow(index, false);


               

            }
            
        }
     

        protected DataTable getDetails()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add(new DataColumn("PROD_ID", typeof(int)));
            dt.Columns.Add(new DataColumn("PROD_NAME", typeof(string)));
            dt.Columns.Add(new DataColumn("PROD_SIZE", typeof(string)));
            dt.Columns.Add(new DataColumn("PROD_STOCKQTY", typeof(int)));
            dt.Columns.Add(new DataColumn("PROD_CATEGORY", typeof(string)));
            dt.Columns.Add(new DataColumn("PROD_STATUS", typeof(string)));
            dt.Columns.Add(new DataColumn("EXP_DATE", typeof(string)));
            dt.Columns.Add(new DataColumn("DONOR_ID", typeof(int)));
            dt.PrimaryKey = new DataColumn[] { dt.Columns["PROD_ID"] };

            DataRow r;
            r = dt.NewRow();
            r["PROD_ID"] = 1;
            r["PROD_NAME"] = "name";
            r["PROD_SIZE"] = "12oz";
            r["PROD_STOCKQTY"] = 1;
            r["PROD_CATEGORY"] = "nuts";
            r["PROD_STATUS"] = "A";
            r["EXP_DATE"] = "04/06/2021";
            r["Donor_ID"] = "1";
            dt.Rows.Add(r);

            return dt; 


        }
        protected void ButtonLogOff_Click(object sender, EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
            Response.Cache.SetNoStore();
            Session.Abandon();
            Request.Cookies.Clear();
            Response.Cache.SetSlidingExpiration(true);
            Response.Redirect("/Default.aspx", true);
        }
    }
}