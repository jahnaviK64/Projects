using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DBConnection
/// </summary>
public class DBConnection
{
    public SqlConnection cn;
    public SqlCommand cmd;
    public SqlDataReader dr;
    public SqlDataAdapter da;
    public DBConnection()
    {
        //
        // TODO: Add constructor logic here
        //
    }

        public void DBOpen()
        {
            cn = new SqlConnection(ConfigurationManager.AppSettings["connect1"]);
            cn.Open();
        }
        public void DBClose()
        {
            cn.Close();
        }

        public void activecard(string query)
        {
            DBOpen();
            cmd = new SqlCommand(query, cn);
            cmd.ExecuteNonQuery();
        }

        public void DBReaderOpen(string query)
        {
            DBOpen();
            cmd = new SqlCommand(query, cn);
            dr = cmd.ExecuteReader();
        }
        public void DBReaderClose()
        {
            cmd = null;
            dr.Close();
            cn.Close();
        }

    }