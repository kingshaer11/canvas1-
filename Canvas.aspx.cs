using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using GPM.PanuEntity;
using GPM.PanuModels;
using System.Text;

namespace GPM
{
    public partial class Canvas : System.Web.UI.Page
    {
        public string lineData;
        public string getsection;
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadData();
            GridChart();
            LoadDataOfLineChart();

        }

        private void LoadDataOfLineChart()
        {
            String strConnectionString = ConfigurationManager.ConnectionStrings["MyDBConnecStr"].ToString();

            SqlConnection myconnect = new SqlConnection(strConnectionString);

            myconnect.Open();

            string strCommandText = "select count (PartsNumber) as PartsNumber from T_Inventory ";
                   strCommandText += "left join M_MachineMaster on M_MachineMaster.MachineCode = T_Inventory.MachineCode ";
                   strCommandText += "WHERE  YEAR(TransactionDate) = '2022' ";
                   strCommandText += "and Description = 1 ";
                   strCommandText += "and SectionCode ='DP17' ";
                   strCommandText += "GROUP BY  MONTH(TransactionDate) ";

            SqlCommand comm = new SqlCommand(strCommandText,myconnect);
            DataTable dt = new DataTable();
            dt.Load(comm.ExecuteReader());
            gvLineChart.DataSource = dt;
            gvLineChart.DataBind();
            myconnect.Close();
            lineData = "";
            foreach (DataRow dr in dt.Rows)
            {
                
                lineData += "" + dr["PartsNumber"] + ",";
            }
            lineData = lineData.Remove( lineData.Length - 1) ;
        }

        protected void LoadData()
        {
            var dc = Canvas.GetDataSectionCode();
            GridView1.DataSource = dc;
            GridView1.DataBind();
        }

        protected void GridChart()
        {
            foreach (GridViewRow row in GridView1.Rows)
            {
                var lblSection = (Label)row.FindControl("lblSection");

                var get = new Getdatacanvas();

                get.SectionCode = lblSection.Text;
            }
        }
        public static DataTable GetDataSectionCode()
        {
            var oSb = new StringBuilder();
            oSb.AppendLine("  select	DISTINCT 	SectionCode from T_Inventory 	     ");
            oSb.AppendLine(" left join M_MachineMaster on M_MachineMaster.MachineCode = T_Inventory.MachineCode  ");
            oSb.AppendLine(" where TransactionDate between '2022-07-01' and '2022-07-31'  ");
            oSb.AppendLine(" and SectionCode IS NOT NULL   ");

            //if (condition.Trim() != "")
            //{
            //    oSb.AppendLine("    " + condition);
            //}

            return DataAccess.GetDataTable1(oSb.ToString());
        }
        public class Getdatacanvas 
        {
            public string SectionCode { get; set; }
        }
    }
}