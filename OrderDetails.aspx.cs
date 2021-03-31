using System;
using System.Data;
using Syncfusion.Pdf;
using Syncfusion.Pdf.Graphics;
using System.Drawing;
using System.Web;
using Syncfusion.Pdf.Grid;
using System.Data.SqlClient;
using System.Configuration;

namespace WebFormPractice
{
    public partial class OrderDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {   DataTable cart;
            cart = (DataTable)Session["CartTable"];

            //Creates a new PDF document
            PdfDocument document = new PdfDocument();
            //Adds page settings
            document.PageSettings.Orientation = PdfPageOrientation.Landscape;
            document.PageSettings.Margins.All = 50;
            //Adds a page to the document
            PdfPage page = document.Pages.Add();
            PdfGraphics graphics = page.Graphics;

            //Loads the image from disk
            PdfImage image = PdfImage.FromFile(Server.MapPath(@"Content\\GTY_groceries_jt_130720_16x9_992.jpg"));
            RectangleF bounds = new RectangleF(176, 0, 390, 130);
            //Draws the image to the PDF page
            page.Graphics.DrawImage(image, bounds);

            PdfBrush solidBrush = new PdfSolidBrush(new PdfColor(126, 151, 173));
            bounds = new RectangleF(0, bounds.Bottom + 90, graphics.ClientSize.Width, 30);

            //Draws a rectangle to place the heading in that region.
            graphics.DrawRectangle(solidBrush, bounds);
            //Creates a font for adding the heading in the page
            PdfFont subHeadingFont = new PdfStandardFont(PdfFontFamily.TimesRoman, 14);


            //get appropriate fields:order_number, company_name, and pickup times to be listed on pdf
            string[] orderDetails = new string[2]; 
             orderDetails = getOrderDetails();

            //Creates a text element to add the invoice number
            PdfTextElement element = new PdfTextElement("ORDER_NUMBER:" + orderDetails[0] + 
                                                       " COMPANY:" + orderDetails[1] + "PICKUP TIMES:" + 
                                                        orderDetails[2], subHeadingFont);
            element.Brush = PdfBrushes.White;

            //Draws the heading on the page
            PdfLayoutResult result = element.Draw(page, new PointF(10, bounds.Top + 8));
            PdfFont font = new PdfStandardFont(PdfFontFamily.Helvetica, 20);
            graphics.DrawString("Food Tripz", font, PdfBrushes.Black, new PointF(0,0));
            string currentDate = "DATE " + DateTime.Now.ToString("MM/dd/yyyy");
            //Measures the width of the text to place it in the correct location
            SizeF textSize = subHeadingFont.MeasureString(currentDate);
            PointF textPosition = new PointF(graphics.ClientSize.Width - textSize.Width - 10, result.Bounds.Y);
            //Draws the date by using DrawString method
            graphics.DrawString(currentDate, subHeadingFont, element.Brush, textPosition);
            PdfFont timesRoman = new PdfStandardFont(PdfFontFamily.TimesRoman, 10);

            PdfGrid grid = new PdfGrid();
            //Adds the data source
            grid.DataSource = cart;
            //Creates the grid cell styles
            PdfGridCellStyle cellStyle = new PdfGridCellStyle();
            cellStyle.Borders.All = PdfPens.White;
            PdfGridRow header = grid.Headers[0];
            //Creates the header style
            PdfGridCellStyle headerStyle = new PdfGridCellStyle();
            headerStyle.Borders.All = new PdfPen(new PdfColor(126, 151, 173));
            headerStyle.BackgroundBrush = new PdfSolidBrush(new PdfColor(126, 151, 173));
            headerStyle.TextBrush = PdfBrushes.White;
            headerStyle.Font = new PdfStandardFont(PdfFontFamily.TimesRoman, 14f, PdfFontStyle.Regular);

            //Adds cell customizations
            for (int i = 0; i < header.Cells.Count; i++)
            {
                if (i == 0 || i == 1)
                    header.Cells[i].StringFormat = new PdfStringFormat(PdfTextAlignment.Left, PdfVerticalAlignment.Middle);
                else
                    header.Cells[i].StringFormat = new PdfStringFormat(PdfTextAlignment.Right, PdfVerticalAlignment.Middle);
            }

            //Applies the header style
            header.ApplyStyle(headerStyle);
            cellStyle.Borders.Bottom = new PdfPen(new PdfColor(217, 217, 217), 0.70f);
            cellStyle.Font = new PdfStandardFont(PdfFontFamily.TimesRoman, 12f);
            cellStyle.TextBrush = new PdfSolidBrush(new PdfColor(131, 130, 136));
            //Creates the layout format for grid
            PdfGridLayoutFormat layoutFormat = new PdfGridLayoutFormat();
            // Creates layout format settings to allow the table pagination
            layoutFormat.Layout = PdfLayoutType.Paginate;
            //Draws the grid to the PDF page.
            PdfGridLayoutResult gridResult = grid.Draw(page, new RectangleF(new PointF(0, result.Bounds.Bottom + 40), new SizeF(graphics.ClientSize.Width, graphics.ClientSize.Height - 100)), layoutFormat);

            PointF textPosition2 = new PointF(graphics.ClientSize.Width - textSize.Width - 10, result.Bounds.Y);
           
            graphics.DrawString("Total Balance: $0.00", font, PdfBrushes.Black, new PointF(0, gridResult.Bounds.Bottom + 20));
        
            document.Save("Output.pdf", HttpContext.Current.Response, HttpReadType.Open);
        }

        protected void CrystalReportViewer1_Init(object sender, EventArgs e)
        {

        }
        protected  string[] getOrderDetails()
        {
            // Session["orderNumber"] 
            //Session["Donor_ID"]
            //need company names and pickup times
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Database1"].ConnectionString);
            conn.Open();
            SqlCommand query_pickup_times = new SqlCommand("Select Pickup_times from donor where donor_id = " + Session["Donor_ID"].ToString());
            query_pickup_times.Connection = conn;
            string pickupTimes = query_pickup_times.ExecuteScalar().ToString();

            SqlCommand query_company_name = new SqlCommand("Select company_name from donor where donor_id = " + Session["Donor_ID"].ToString());
            query_company_name.Connection = conn; 
            string companyName = query_company_name.ExecuteScalar().ToString();
            string[] orderDetails = new string[3];
            orderDetails[0] = Session["orderNumber"].ToString();
            orderDetails[1] = companyName;
            orderDetails[2] = pickupTimes; 
            return orderDetails; 
        }
    }
}