using Microsoft.Ajax.Utilities;
using System;
using System.CodeDom;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Test
{
    public static class AppSql
    {
        public static SqlConnection SqlConnection;
        public static string connectionString = $"Data Source=DESKTOP-JSTJ8LM\\SQLEXPRESS;Initial Catalog=FITHOU_CDTN_LTUD_WebsiteHoTroTimNhaTro;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover='False' providerName='System.Data.SqlClient'";
        

        public static void Test()
        {
            using (SqlConnection = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("Select * from User", SqlConnection);
                SqlDataReader sqlDataReader = cmd.ExecuteReader();
                var m = sqlDataReader.GetString(sqlDataReader.GetOrdinal("UserName"));
                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(cmd);
                DataSet dataSet = new DataSet();
                sqlDataAdapter.Fill(dataSet);
            }
        }
    }
}