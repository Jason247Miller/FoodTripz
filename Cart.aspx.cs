using System;
using System.Web.UI.WebControls;
using System.Diagnostics;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WebFormPractice
{
    public partial class Cart : System.Web.UI.Page
    {
        DataTable cart;
        DataTable dt; 
        protected void Page_Load(object sender, EventArgs e)
        {
            dt = (DataTable)Session["DataTable"]; 
           
            if (!IsPostBack)
            {


                Debug.WriteLine("Initial Page Laod");
                //copy over cart instance from publicDonorPage
                cart = (DataTable)Session["CartTable"];


                GridViewCart.DataSource = cart;
                GridViewCart.DataBind();


                //ViewState.Add("cart", cart);
            }
            else if (IsPostBack)
            {
                cart = (DataTable)Session["CartTable"];
               // cart = ViewState["cart"] as DataTable;
            }
        }

        protected void GridViewCart_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "Remove")
            {
                Debug.WriteLine("Remove command called....");
                ViewState.Add("cart", cart);
                int index = Convert.ToInt32(e.CommandArgument);
                Debug.WriteLine("Row qunatity cell value = " + cart.Rows[index][3].ToString());
                int quantity = Convert.ToInt32(cart.Rows[index][3].ToString());
                //get product_id of selected row
                //index 0 is prod_id
                int prod_id = Convert.ToInt32(cart.Rows[index][0].ToString());

                //reference row in dt with product_id obtained 
                string searchExpression = "PROD_ID = " + prod_id.ToString();
                DataRow[] dtrow = dt.Select(searchExpression);
                DataRow matchedDtRow = dtrow[0]; 

                //add 1 to quantity after subtracting 1 from qunaity in cart
                if(quantity > 1)
                {

                    Debug.WriteLine("prod_id of matched row = " + prod_id.ToString());
                    Debug.WriteLine("qunatity of row = " + matchedDtRow[3].ToString()); 
                    cart.Rows[index][3] = (Convert.ToInt32(cart.Rows[index][3]) - 1) ;
                     matchedDtRow[3] = (Convert.ToInt32(matchedDtRow[3]) + 1);

                }
                else
                {
                    cart.Rows[index].Delete();
                    matchedDtRow[3] = (Convert.ToInt32(matchedDtRow[3]) + 1);
                }
                Session["CartTable"] = cart;
                Session["DataTable"] = dt; 
                GridViewCart.DataSource = cart;
                GridViewCart.DataBind();


            }
        }

        protected void ButtonOrder_Click(object sender, EventArgs e)
        {

            
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Database1"].ConnectionString);

            //insert recipient_id to create an order entry in the orders table
            SqlCommand orders_insert = new SqlCommand("insert into orders (REC_ID) values (" + " '" + Session["recipient_id"].ToString() + "'" +")" );
            orders_insert.Connection = conn;
            conn.Open();
            orders_insert.ExecuteScalar();

            //query the recipients order_id
            // SqlCommand query_order_id = new SqlCommand("Select order_id from ORDERS where rec_id = " + Session["recipient_id"].ToString());
            SqlCommand query_order_id = new SqlCommand("Select MAX(ORDER_ID) from orders");
 
             query_order_id.Connection = conn;
            int order_id = Convert.ToInt32(query_order_id.ExecuteScalar().ToString());

            Debug.WriteLine("Order ID = " + order_id.ToString());
            Session["order_id"] = order_id;

       
            //insert cart contents into order_line table 
            foreach (DataRow row in cart.Rows)
            {

                int prod_id = Convert.ToInt32(row[0]);
                int quantity_ordered = Convert.ToInt32(row[3]);
                SqlCommand order_item_line = new SqlCommand("insert into order_item_line (prod_id, order_id,quantity_ordered) values ( '" + prod_id.ToString() +
                    "','" + Session["order_id"].ToString() + "' ,'" + quantity_ordered.ToString() + "')");
                order_item_line.Connection = conn;
                order_item_line.ExecuteScalar();

                
                //query current product quantity and subtract by quantity ordered
                SqlCommand queryQtyInStock = new SqlCommand("Select PROD_STOCKQTY from PRODUCT where PROD_ID = " + prod_id.ToString());
                queryQtyInStock.Connection = conn;
                int quantityInStock = Convert.ToInt32(queryQtyInStock.ExecuteScalar().ToString());
                quantityInStock = quantityInStock - quantity_ordered;     
                SqlCommand quantityStockInsert = new SqlCommand("UPDATE PRODUCT SET PROD_STOCKQTY = " + quantityInStock.ToString() + 
                                                                "WHERE prod_id = " + prod_id.ToString());
                quantityStockInsert.Connection = conn;
                quantityStockInsert.ExecuteScalar();
            }

            conn.Close();
            
            Session["CartTable"] = cart;

            Response.Redirect("OrderDetails.aspx");
 
        }

        protected void ButtonShop_Click(object sender, EventArgs e)
        {   
           
            
            Session["CartTable"] = cart;
            Session["DataTable"] = dt;
            Session["FromCart"] = "true"; 
            Response.Redirect("PublicDonorPage.aspx"); 

        }
    }
}