using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Configuration;

namespace Transforman.controller
{
    public class GetDataList
    {

        
        public static DataTable GetDataBank()
        {
            database db = new database();
            db.ClearParameters();
            db.SPName = "GetDataBank";
            
            DataSet ds = db.ExecuteSP();
            db.Dispose();
            return ds.Tables[0];
        }
        public static DataTable GetDataMenu()
        {
            database db = new database();
            db.ClearParameters();
            db.SPName = "GetDataMenu";
            
            DataSet ds = db.ExecuteSP();
            db.Dispose();
            return ds.Tables[0];
        }
       
        

        
        
        
    }
}