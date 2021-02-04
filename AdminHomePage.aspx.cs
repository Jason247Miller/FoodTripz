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
            //set recipietn fields for default display
            BoundField recipient_id = new BoundField();
            recipient_id.DataField = "Recipient_ID";
            recipient_id.HeaderText = "Recipient_ID";
            BoundField email = new BoundField();
            email.DataField = "Email";
            email.HeaderText = "Email";
            GridView1.Columns.Add(recipient_id);
            GridView1.Columns.Add(email);
           


        }

        protected void ButtonRefresh_Click(object sender, EventArgs e)
        {
           
            if (DropDownListTables.SelectedValue == "Recipient Table")
            {   
                LabelTable.Text = "Recipient";
                GridView1.Columns.Clear();
                BoundField recipient_id = new BoundField();
                recipient_id.DataField = "Recipient_ID";
                recipient_id.HeaderText = "Recipient_ID";
                BoundField email = new BoundField();
                email.DataField = "Email";
                email.HeaderText = "Email";
                GridView1.Columns.Add(recipient_id);
                GridView1.Columns.Add(email);

            }
            else if (DropDownListTables.SelectedValue == "Donor Table")
            {   


                LabelTable.Text = "Donor";
                //clear previous columns
                GridView1.Columns.Clear();

                

                //Dynamically Created Columns
                BoundField donor_id = new BoundField();
                donor_id.DataField = "Donor_ID";
                donor_id.HeaderText = "Donor_ID";
                BoundField email = new BoundField();
                email.DataField = "Email";
                email.HeaderText = "Email";
                GridView1.Columns.Add(donor_id);
                GridView1.Columns.Add(email);

               // SqlDataSourceDonors.SelectCommand = "Select Donor_ID from donor"; 


                GridView1.DataSourceID = "SqlDataSourceDonors";
                GridView1.DataBind(); 

            }
        }
    }
}
