using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Transforman.controller;

namespace HRMS.Web.Master
{
    public partial class City : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static string Save(string CityCode, string CityName)
        {
            try
            {

                ExecuteData.InsertCity(CityCode, CityName);
            }
            catch (Exception ex)
            {

                return ex.Message;
            }
            return "";
        }




    }
}
