using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data; 

namespace WebFormPractice.HelperClasses
{
    public class adjustTableQuantity
    {
        private DataTable dataTable;
        private DataTable cart; 
        public adjustTableQuantity(DataTable dt, DataTable c)
        {
            dataTable = dt;
            cart = c; 
        }
    }
}