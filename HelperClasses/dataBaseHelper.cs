using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebFormPractice.HelperClasses
{
    public static class dataBaseHelper
    {

        public static SqlConnection getDbConn()
        {
            SqlConnection conn = new
            SqlConnection(ConfigurationManager.ConnectionStrings["Database1"].ConnectionString);
            return conn; 
        }
    }
}