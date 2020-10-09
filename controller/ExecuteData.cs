using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Text;
using System.IO;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Transforman.controller
{
    public class ExecuteData
    {

        #region Bank 
        //public static void DeleteUserById(Guid Id)
        //{
        //    DataTable dt = new DataTable();
        //    database db = new database();
        //    db.ClearParameters();

        //    db.SPName = "SP_DeleteUserById";
        //    db.AddParameters("@Id_User", SqlDbType.UniqueIdentifier, Id);
        //    DataSet ds = db.ExecuteSP();
        //    db.Dispose();



        //}
        public static void InsertBank(string Code,String Name)
        {
            DataTable dt = new DataTable();
            database db = new database();
            db.ClearParameters();

            db.SPName = "InsertDataBankCode";
            db.AddParameters("@BankCode", SqlDbType.VarChar, Code);
            db.AddParameters("@BankName", SqlDbType.VarChar, Name);
            db.AddParameters("@CreatedBy", SqlDbType.VarChar, "");
            db.AddParameters("@CreatedDate", SqlDbType.VarChar, DateTime.Now);


            DataSet ds = db.ExecuteSP();
            db.Dispose();



        }
        //public static void UpdateApproval(Guid Id,int Status,string NoPek)
        //{
        //    DataTable dt = new DataTable();
        //    database db = new database();
        //    db.ClearParameters();

        //    db.SPName = "SP_UpdateOrder";
        //    db.AddParameters("@Id_Order", SqlDbType.UniqueIdentifier, Id);
        //    db.AddParameters("@Status", SqlDbType.Int, Status);
        //    db.AddParameters("@UpdateBy", SqlDbType.VarChar, NoPek);
        //    db.AddParameters("@UpdateDate", SqlDbType.DateTime, DateTime.Now);

        //    DataSet ds = db.ExecuteSP();
        //    db.Dispose();

        //}
        #endregion
    }
}
