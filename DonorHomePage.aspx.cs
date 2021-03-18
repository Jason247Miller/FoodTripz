using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;
using System.Data;

/*KM UPDATE 3/18*/


namespace WebFormPractice
{
    public partial class DonorHomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                LabelWelcome.Text += " " + Session["Username"].ToString();
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }


        SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["Database1"].ConnectionString);
      


        void PopulateGridView()
        {
           System.Data.DataTable dtb1 = new DataTable("ParentTable");
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("Select * from Product", sqlCon);
                sqlDa.Fill(dtb1);
            }
            if (dtb1.Rows.Count > 0)
            {
                gvProductTable.DataSource = dtb1;
                gvProductTable.DataBind();

            }
            else
            {
                dtb1.Rows.Add(dtb1.NewRow());
                gvProductTable.DataSource = dtb1;
                gvProductTable.DataBind();
                gvProductTable.Rows[0].Cells.Clear();
                gvProductTable.Rows[0].Cells.Add(new TableCell());
                gvProductTable.Rows[0].Cells[0].ColumnSpan = dtb1.Columns.Count;
                gvProductTable.Rows[0].Cells[0].Text = "No Data Avaiable";
                gvProductTable.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
        }
        protected void gvPhoneBook_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.Equals("AddNew"))
                {
                    using (SqlConnection sqlCon = new SqlConnection(connectionString))
                    {
                        sqlCon.Open();
                        string query = "INSERT INTO PhoneBook (PROD_NAME,PROD_SIZE,PROD_QTY,PROD_CATEGORY,PROD_STATUS,EXP_DATE) VALUES (@PROD_NAME,@PROD_SIZE,@PROD_QTY,@PROD_CATEGORY,@PROD_STATUS,@EXP_DATE)";
                        SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                        sqlCmd.Parameters.AddWithValue("@PROD_NAME", (gvProductTable.FooterRow.FindControl("txtPROD_NAMEFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@PROD_SIZE", (gvProductTable.FooterRow.FindControl("txtPROD_SIZEFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@PROD_QTY", (gvProductTable.FooterRow.FindControl("txtPROD_QTYFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@PROD_CATEGORY", (gvProductTable.FooterRow.FindControl("txtPROD_CATEGORYFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@PROD_STATUS", (gvProductTable.FooterRow.FindControl("txtPROD_STATUSFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@EXP_DATE", (gvProductTable.FooterRow.FindControl("txtEXP_DATEFooter") as TextBox).Text.Trim());

                        sqlCmd.ExecuteNonQuery();
                       PopulateGridView();
                       /* lblSuccessMessage.Text = "New Record Added";
                        lblErrorMessage.Text = "";
                    }
                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = "";
            }
            protected void gvProductTable_RowEditing(object sender, GridViewEditEventArgs e)
            {
                gvProductTable.EditIndex = e.NewEditIndex;
               PopulateGridView();
            }



            protected void gvProductTable_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
            {
                gvProductTable.EditIndex = -1;
                PopulateGridview();
            } 
                       */
            protected void ButtonLogOut_Click(object sender, EventArgs e)
            {
                Session["Username"] = null;
                Response.Redirect("Login.aspx");

            }
        
    } 