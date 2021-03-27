using System;


namespace WebFormPractice
{
    public partial class WebForm1 : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["logged"] == null)
                {
                    Response.Redirect("Default.aspx");
                }
            }

            if (!IsPostBack)
            {
                GridView1.DataBind();
                GridView2.DataBind();
                GridView3.DataBind();
                GridView4.DataBind();
            }

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

            String self = DropDownList1.SelectedValue.ToString();

            if (self == "rt")
            {
                recDiv.Visible = true;
                donorDiv.Visible = false;
                orderDiv.Visible = false;
                prodDiv.Visible = false;
            }
            else if (self == "dt")
            {
                recDiv.Visible = false;
                donorDiv.Visible = true;
                orderDiv.Visible = false;
                prodDiv.Visible = false;

            }
            else if (self == "ot")
            {
                recDiv.Visible = false;
                donorDiv.Visible = false;
                orderDiv.Visible = true;
                prodDiv.Visible = false;

            }
            else if (self == "pt")
            {
                recDiv.Visible = false;
                donorDiv.Visible = false;
                orderDiv.Visible = false;
                prodDiv.Visible = true;
            }
            else
            {
                //no need
            }

        }

        protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session["logged"] = null;
            Response.Redirect("Login.aspx");
        }
    }
}