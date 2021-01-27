using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GMap.NET.WindowsForms; 

namespace WebFormPractice
{
    public partial class RegistrationPageDirector : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

        protected void ButtonNext_Click(object sender, EventArgs e)
        {
            if(DropDownListUserType.SelectedValue != "Select User Type")
            {
                if (DropDownListUserType.SelectedValue == "Food Recipient")
                {
                    Response.Redirect("RecipientRegisteration.aspx");
                }
                else if(DropDownListUserType.SelectedValue == "Food Donor")
                {
                    Response.Redirect("DonorRegistrationPage.aspx");
                }
            }
        }
    }
}