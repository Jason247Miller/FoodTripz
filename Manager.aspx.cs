using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormPractice
{
    public partial class Manager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            //data source defaults to the recipient table
        

        }

        protected void ButtonRefresh_Click(object sender, EventArgs e)
        {
            //  Response.Write("");
            if (DropDownListTables.SelectedValue == "Recipient Table")
            {
                LabelTable.Text = "Recipient"; 
                 SqlDataSourceRegistration.SelectCommand = "SELECT * FROM Recipient";

               




            }
            else if (DropDownListTables.SelectedValue == "Donor Table")
            {
                LabelTable.Text = "Donor";
                SqlDataSourceRegistration.SelectCommand = "SELECT * FROM Donor";
               
            }
        }
    }
}