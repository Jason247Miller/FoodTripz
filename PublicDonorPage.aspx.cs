using System;
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
        public DataTable dt;
        private string company_name;
        public int quantity;
        DataTable cart;


        int recipient_id = 0;


        protected void Page_Load(object sender, EventArgs e)

        {   //create an empty cart instance to take values added from products table and placed on gridview on order page. 


            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Database1"].ConnectionString);
            if (Request.QueryString["donorID"] != null) //if a param is passed
            {
                donor_id = Request.QueryString["donorID"];
                LabelDonorHeader.Text = company_name;
            }


            if (Session["Email"] != null)
            {
                SqlCommand recipient_id_query = new SqlCommand("select recipient_id from recipient where email='" + Session["Email"] + "'");
                recipient_id_query.Connection = conn;
                conn.Open();
                recipient_id = Convert.ToInt32(recipient_id_query.ExecuteScalar().ToString());



                Session["recipient_id"] = recipient_id;
                Debug.WriteLine("Recipient_id = " + recipient_id.ToString());
                conn.Close();

            }
            SqlCommand cmd = new SqlCommand("select * from Donor where Donor_ID ='" + donor_id + "'");

            cmd.Connection = conn;
            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                company_name = reader["company_name"].ToString();
            }
            conn.Close();
            LabelDonorHeader.Text = company_name;


            if (!IsPostBack)//if page is not post back load gridview from db
            {

                Debug.WriteLine("Initial Load...not postback");


                //Data Table to act as the data source for the gridview. 
                dt = new DataTable();
                dt.Columns.Add(new DataColumn("PROD_ID", typeof(int)));
                dt.Columns.Add(new DataColumn("PROD_NAME", typeof(string)));
                dt.Columns.Add(new DataColumn("PROD_SIZE", typeof(string)));
                dt.Columns.Add(new DataColumn("PROD_STOCKQTY", typeof(int)));
                dt.Columns.Add(new DataColumn("PROD_CATEGORY", typeof(string)));
                dt.Columns.Add(new DataColumn("EXP_DATE", typeof(string)));
                //set primary key 
                dt.PrimaryKey = new DataColumn[] { dt.Columns["PROD_ID"] };


                //Data Table to copy over added products from Public DOnor Gridview, to the Gridview reperesenting the cart on the Orders page
                cart = new DataTable();
                cart.Columns.Add(new DataColumn("PROD_ID", typeof(int)));
                cart.Columns.Add(new DataColumn("PROD_NAME", typeof(string)));
                cart.Columns.Add(new DataColumn("PROD_SIZE", typeof(string)));
                cart.Columns.Add(new DataColumn("PROD_STOCKQTY", typeof(int)));
                cart.Columns.Add(new DataColumn("PROD_CATEGORY", typeof(string)));
                cart.Columns.Add(new DataColumn("EXP_DATE", typeof(string)));
                cart.PrimaryKey = new DataColumn[] { cart.Columns["PROD_ID"] };

                //Session["dataTable"] = dt; 

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

                ViewState.Add("DataTable", dt);
                ViewState.Add("CartTable", cart);

            }
            else if (IsPostBack) //if page is post back then load gridview from existing Data Table
            {
                Debug.WriteLine("In Postback code...");

                dt = ViewState["DataTable"] as DataTable; //reload table from view state to avoid table being null
                cart = ViewState["CartTable"] as DataTable;
            }







        } //end page load
        protected void GridViewProducts_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (dt == null)
            {
                Debug.WriteLine("data table is null in button click");
            }

            if (e.CommandName == "AddToCart")
            {
                Debug.WriteLine("Button click");
                LabelNoProduct.Text = ""; //clear error label after each click
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridViewProducts.Rows[index];



                // row.Cells[1].Text.ToString();
                Debug.WriteLine("Row qunatity cell value = " + dt.Rows[index][3].ToString());
                int quantity = Convert.ToInt32(dt.Rows[index][3].ToString());



                if (quantity != 0)
                {   //deduct quanttiy from Gridview Data source
                    quantity = quantity - 1;
                    dt.Rows[index][3] = quantity;
                    ViewState.Add("DataTable", dt);





                    //if row exist on cart table. find out which row has that product and increment the quantity; 
                    //search for prod_id in cart data table prod_id column, if found get index of row.

                    DataRow searchedRow = cart.Rows.Find(dt.Rows[index][0]);
                    int rowFoundIndex = cart.Rows.IndexOf(searchedRow);
                    Debug.WriteLine("index of selected row = " + rowFoundIndex);

                    if (searchedRow != null) //row exists, update qunatity on existing
                    {
                        cart.Rows[rowFoundIndex][3] = (Convert.ToInt32(cart.Rows[rowFoundIndex][3].ToString()) + 1);
                        Debug.WriteLine("Row was found in cart table");


                    }
                    else //new row needs added
                    {
                        DataRow dr = cart.NewRow();


                        dr["PROD_ID"] = Convert.ToInt32(dt.Rows[index][0].ToString());
                        dr["PROD_NAME"] = dt.Rows[index][1].ToString();
                        dr["PROD_SIZE"] = dt.Rows[index][2].ToString();
                        dr["PROD_STOCKQTY"] = 1;
                        dr["PROD_CATEGORY"] = dt.Rows[index][4].ToString();
                        //  dr["PROD_STATUS"] = 'P'; 
                        dr["EXP_DATE"] = dt.Rows[index][5].ToString();
                        cart.Rows.Add(dr);

                        Debug.WriteLine(" new row value = dr[PROD_STOCKQTY] = " + dr["PROD_STOCKQTY"].ToString());

                    }


                    ViewState.Add("cartTable", cart);





                }
                else if (quantity == 0)
                {
                    LabelNoProduct.Visible = true;
                    LabelNoProduct.Text = "Product " + row.Cells[2].Text.ToString() + " is out of stock!";
                }
                //update the gridview
                GridViewProducts.DataSource = dt;
                GridViewProducts.DataBind();
            }



        }

        protected void ButtonGoToCart_Click(object sender, EventArgs e)
        {
            //saves cart into session var and redirects to cart page
            Session.Add("cartSession", cart);
            Response.Redirect("Cart.aspx");
        }
    }
}