using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormPractice
{
    public partial class DonorHomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"]!= null)
            {
                LabelWelcome.Text += " " + Session["Username"].ToString(); 
            }
            else
            {
                Response.Redirect("Login.aspx"); 
            }
        }

        protected void ButtonLogOut_Click(object sender, EventArgs e)
        {
            Session["Username"] = null;
            Response.Redirect("Login.aspx");

        }
    }
}