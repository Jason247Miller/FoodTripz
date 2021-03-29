using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions;
using CrystalDecisions.CrystalReports; 

namespace WebFormPractice
{
    public partial class OrderDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {   DataTable cart;
            cart = (DataTable)Session["cartSession"];
            CrystalReport1 crpt = new CrystalReport1();
            //load crytal report for cart data table
            crpt.Database.Tables["DataTable1"].SetDataSource(cart);
            crpt.Database.Tables["DataTable1"].LogOnInfo.ConnectionInfo.UserID = "Jason";
            crpt.Database.Tables["DataTable1"].LogOnInfo.ConnectionInfo.Password = "pass";
            crpt.Database.Tables["DataTable1"].LogOnInfo.ConnectionInfo.ServerName = "server";

            CrystalReportViewer1.ReportSource = null;
            CrystalReportViewer1.ReportSource = crpt;

        }

        protected void CrystalReportViewer1_Init(object sender, EventArgs e)
        {

        }
    }
}