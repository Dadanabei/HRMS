using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Transforman.controller;
using HRMS.Master;


namespace HRMS.Web.Master
{
    public partial class Rate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static string Save(string RateType, string RateDesc)
        {
            try
            {
                
                ExecuteData.InsertRate(RateType, RateDesc);
            }
            catch (Exception ex)
            {

                return ex.Message;
            }
            return "";
        }


   

    }
}