using System;
using System.Web.UI.WebControls;
using System.Diagnostics;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;

namespace WebFormPractice
{
    public partial class Cart : System.Web.UI.Page
    {
        DataTable cart; 
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {


                Debug.WriteLine("Initial Page Laod");
                //copy over cart instance from publicDonorPage
                cart = (DataTable)Session["cartSession"];


                GridViewCart.DataSource = cart;
                GridViewCart.DataBind();


                ViewState.Add("cart", cart);
            }
            else if (IsPostBack)
            {

                cart = ViewState["cart"] as DataTable;
                //GridViewCart.DataSource = cart;
               // GridViewCart.DataBind();
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
                if(quantity > 1)
                {
                    cart.Rows[index][3] = (Convert.ToInt32(cart.Rows[index][3]) - 1) ;
                }
                else
                {
                    cart.Rows[index].Delete();
                }
                ViewState.Add("cart", cart);
                //update gridview with any changes
                GridViewCart.DataSource = cart;
                GridViewCart.DataBind();


            }
        }

        protected void ButtonOrder_Click(object sender, EventArgs e)
        {

            Debug.WriteLine("Recipient_id = " + Session["recipient_id"].ToString());
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Database1"].ConnectionString);

            SqlCommand orders_insert = new SqlCommand("insert into orders (REC_ID) values (" + " '" + Session["recipient_id"].ToString() + "'" +")" );
            orders_insert.Connection = conn;
            conn.Open();
            orders_insert.ExecuteScalar();

            SqlCommand query_order_id = new SqlCommand("Select order_id from ORDERS where rec_id = " + Session["recipient_id"].ToString());
            query_order_id.Connection = conn;
            int order_id = Convert.ToInt32(query_order_id.ExecuteScalar().ToString()); 
           
            Session["order_id"] = order_id;

            Debug.WriteLine("Session order ID = " + Session["order_id"].ToString());

            //array to store the product ID so they can later be deleted from teh table 
           

           
            //foreach row in the cart table, copy its details into the order_line table 
            foreach (DataRow row in cart.Rows)
            {

                int prod_id = Convert.ToInt32(row[0]);
                int quantity_ordered = Convert.ToInt32(row[3]);
                //get quantity ordered from cart and store it into a variable 
              
                Debug.WriteLine("quantity ordered of product_id " + prod_id.ToString() + "is " + quantity_ordered.ToString());

                Debug.WriteLine("prod_id = " + prod_id.ToString());
              

                SqlCommand order_item_line = new SqlCommand("insert into order_item_line (prod_id, order_id,quantity_ordered) values ( '" + prod_id.ToString() + "','" + Session["order_id"].ToString() + "' ,'" + quantity_ordered.ToString() + "')");
                order_item_line.Connection = conn;
                order_item_line.ExecuteScalar();

                
                //query Products Product_id and subtract quantity ordered
                SqlCommand queryQtyInStock = new SqlCommand("Select PROD_STOCKQTY from PRODUCT where PROD_ID = " + prod_id.ToString());
                queryQtyInStock.Connection = conn;
                int quantityInStock = Convert.ToInt32(queryQtyInStock.ExecuteScalar().ToString());
                quantityInStock = quantityInStock - quantity_ordered;

                //insert new quantity into Product table
                SqlCommand quantityStockInsert = new SqlCommand("UPDATE PRODUCT SET PROD_STOCKQTY = " + quantityInStock.ToString() + 
                                                                "WHERE prod_id = " + prod_id.ToString());
                quantityStockInsert.Connection = conn;
                quantityStockInsert.ExecuteScalar();




            }

            conn.Close();
            
            Session["cartSession"] = cart;

            Response.Redirect("OrderDetails.aspx");
            //insert everything remaining in cart into the order_line table and create an order
            // redirect to order page
            // order page will display order in a tax receipt format. 
        }
    }
}