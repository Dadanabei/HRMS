using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Transforman.controller;

namespace HRMS
{
    public partial class SiteMaster : MasterPage
    {
        DataTable Menus = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
           
            this.BindMenu();
        }
        private void BindMenu()
        {
            Menus = GetDataList.GetDataMenu();
            //GetData("SELECT [MenuId], [ParentMenuId], [Title], [Description], [Url],[CssFont] FROM [Menus]");


            DataView view = new DataView(Menus);
            view.RowFilter = "ParentMenuId=0";
            this.rptCategories.DataSource = view;
            this.rptCategories.DataBind();
        }


        protected void rptMenu_OnItemBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    if (Menus != null)
                    {
                        DataRowView drv = e.Item.DataItem as DataRowView;
                        string ID = drv["MenuId"].ToString();
                        string Title = drv["Title"].ToString();
                        DataRow[] rows = Menus.Select("ParentMenuId=" + ID);
                        if (rows.Length > 0)
                        {

                            StringBuilder sb = new StringBuilder();
                            sb.Append("<ul id='" + Title + "' class='sub-menu collapse'>");
                            foreach (var item in rows)
                            {
                                string parentId = item["MenuId"].ToString();
                                string parentTitle = item["Title"].ToString();

                                DataRow[] parentRow = Menus.Select("ParentMenuId=" + parentId);

                                if (parentRow.Count() > 0)
                                {
                                    sb.Append("<li data-toggle='collapse' data-target='#" + parentTitle + "' class='collapsed'><a href='" + item["Url"] + "'>" + item["Title"] + "<span class='arrow'></span></a>");
                                    sb.Append("</li>");
                                }
                                else
                                {
                                    sb.Append("<li><a href='" + item["Url"] + "'>" + item["Title"] + "</a>");
                                    sb.Append("</li>");
                                }
                                sb = CreateChild(sb, parentId, parentTitle, parentRow);
                            }
                            sb.Append("</ul>");
                            (e.Item.FindControl("ltrlSubMenu") as Literal).Text = sb.ToString();
                        }
                    }
                }
            }
        }

        private StringBuilder CreateChild(StringBuilder sb, string parentId, string parentTitle, DataRow[] parentRows)
        {
            if (parentRows.Length > 0)
            {
                sb.Append("<ul id='" + parentTitle + "' class='sub-menu collapse'>");
                foreach (var item in parentRows)
                {
                    string childId = item["MenuId"].ToString();
                    string childTitle = item["Title"].ToString();
                    DataRow[] childRow = Menus.Select("ParentMenuId=" + childId);

                    if (childRow.Count() > 0)
                    {
                        sb.Append("<li data-toggle='collapse' data-target='#" + childTitle + "' class='collapsed'><a href='" + item["Url"] + "'>" + item["Title"] + "<span class='arrow'></span></a>");
                        sb.Append("</li>");
                    }
                    else
                    {
                        sb.Append("<li><a href='" + item["Url"] + "'>" + item["Title"] + "</a>");
                        sb.Append("</li>");
                    }
                    CreateChild(sb, childId, childTitle, childRow);
                }
                sb.Append("</ul>");

            }
            return sb;
        }
       
    }
}