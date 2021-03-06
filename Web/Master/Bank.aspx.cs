﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Transforman.controller;
using HRMS.Master;
using Newtonsoft.Json;

namespace HRMS.Master
{
    public partial class Bank : System.Web.UI.Page
    {
        protected string _ListData;
        protected void Page_Load(object sender, EventArgs e)
        {
            _ListData = JsonConvert.SerializeObject(GetDataList.GetDataBank());
        }
        [WebMethod]
        public static string Save(string BankCode, string BankName)
        {
            try
            {
            //    DataModel.Bank _oBank = new DataModel.Bank();
            //    JavaScriptSerializer serializer = new JavaScriptSerializer();
            //    _oBank = serializer.Deserialize<DataModel.Bank>(oBank);
                ExecuteData.InsertBank(BankCode,BankName);
            }
            catch (Exception ex)
            {

                return ex.Message;
            }
            return "succes";
        }
    }

}