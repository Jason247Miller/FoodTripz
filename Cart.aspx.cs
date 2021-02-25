using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;
using System.Data;

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







                //update gridview with any changes
                GridViewCart.DataSource = cart;
                GridViewCart.DataBind();


            }
        }
    }
}