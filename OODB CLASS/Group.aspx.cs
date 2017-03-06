using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

using MySql.Data.MySqlClient;
using System.Data;

public partial class Group : System.Web.UI.Page
{
    MySql.Data.MySqlClient.MySqlConnection conn;
    MySql.Data.MySqlClient.MySqlConnection connect;
    MySql.Data.MySqlClient.MySqlConnection connection;
    MySql.Data.MySqlClient.MySqlConnection connectiong;

    MySql.Data.MySqlClient.MySqlCommand cmd;
    MySql.Data.MySqlClient.MySqlCommand comd;

    MySql.Data.MySqlClient.MySqlDataReader reader;
    String querystr;
    string querystr1;
    DataSet ds = new DataSet();
    DataSet das = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        
        string lname = (String)(Session["lname"]);
        string fname = (String)(Session["fname"]);
        string fullname = fname + lname;
        username.Text = fullname;
        string clsid = (String)Session["clsid"];

        //string tclsid = "cls_" + clsid;
        string tgcls = "grp_" + clsid;
        oy.Text = tgcls;
        
        checkgrp();
    }
    protected void checkgrp()
    {
        string clsid =(string) Session["clsid"];
        string tgcls = "grp_" + clsid;
        Int32 stdid =Convert.ToInt32( Session["stuid"]);
        String connstring = System.Configuration.ConfigurationManager.ConnectionStrings["WebAppConString"].ToString();
        conn = new MySql.Data.MySqlClient.MySqlConnection(connstring);
        try {
            conn.Open();
            string query = "select groupid from " + tgcls + " where uhclid =" + stdid + " ";
            MySqlCommand comd = new MySqlCommand(query, conn);
            MySqlDataAdapter da = new MySqlDataAdapter();
            comd.CommandType = CommandType.Text;
            da.SelectCommand = comd;
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                object value = ds.Tables[0].Rows[0]["groupid"];
                //int groupid = Convert.ToInt32(ds.Tables[0].Rows[0]["groupid"]);
                if (value == DBNull.Value)
                {
                    grpinfo.Visible = true;
                    //up.Visible = true;
                    //group details view goes here
                    //janakkaview();
                }

                else
                {
                    grpinfo.Visible = false;
                    // up.Visible = true;
                    //janakkaview();
                }
            }
        }
        finally
        {
            conn.Close();
        }
    }
    protected void buttonclick(object sender, EventArgs e)
    {
        Response.Redirect("Default1.aspx");
    }
    protected void showgrpdetails(object sender, EventArgs e)
    {
        string clsid = (String)Session["clsid"];

        //string tclsid = "cls_" + clsid;
        string tgcls = "grp_" + clsid;
        oy.Text = tgcls;
        infogrp.Visible = true;
        grpsizeinfo.Visible = true;
        te.Visible = true;
        grpnumber.Visible = true;
        selctgrp.Visible = true;
        String connstring = System.Configuration.ConfigurationManager.ConnectionStrings["WebAppConString"].ToString();
        connection = new MySql.Data.MySqlClient.MySqlConnection(connstring);
        try
        {
            connection.Open();
            querystr = "select count(*) from " + tgcls;
            cmd = new MySql.Data.MySqlClient.MySqlCommand(querystr, connection);
            long num = (long)cmd.ExecuteScalar();


            double numm = Convert.ToDouble(num);
            double noofgrps = Math.Floor(numm / 5);
            infogrp.Text = "The limit of the group is 6";
            grpsizeinfo.Text = "There are groups from 1 to" + noofgrps;
        }
        finally
        {
            connection.Close();
        }
    }
    protected void selectthegrp(object sender, EventArgs e)
    {
        string clsid = (String)Session["clsid"];
        string tgrpid = "grp_" + clsid;
        Int32 mygrp = Convert.ToInt32(grpnumber.Text);
        int stuid = (Int32)Session["stuid"];
        String connstring = System.Configuration.ConfigurationManager.ConnectionStrings["WebAppConString"].ToString();
        connectiong = new MySql.Data.MySqlClient.MySqlConnection(connstring);
        try
        {
            connectiong.Open();
            querystr1 = "select count(*) from " + tgrpid + " where groupid=" + mygrp + "";
            cmd = new MySql.Data.MySqlClient.MySqlCommand(querystr1, connectiong);
            long check = (long)cmd.ExecuteScalar();
            Int32 checks = Convert.ToInt32(check);
            if (checks < 6)
            {
                querystr = "update " + tgrpid + " set groupid='" + mygrp + "' where uhclid=" + stuid + "";
                cmd = new MySql.Data.MySqlClient.MySqlCommand(querystr, connectiong);
                reader = cmd.ExecuteReader();
                reader.Close();
                Int32 num = Convert.ToInt32(grpnumber.Text);
                show.Text = "Your group number is " + num;
            }
            else
            {
                show.Text = "The maximum limit of group is only 6..Please select other group!!";
            }
        }
        finally
        {
            conn.Close();
        }
    }
    protected void janakkaview()
    {
       // ch.Text = "wow";
        
            //ch.Text = "wow";
            // DataTable ttclsid = (DataTable)tclsid;
            DataTable ttclsid = this.GetData1();
            //Building an HTML string.
            StringBuilder html1 = new StringBuilder();
         /*   html1.Append("<details>");
            html1.Append("<summary>");
            html1.Append("Click to view group details ");
            html1.Append("</summary>");*/
            //Table start.
            html1.Append("<br/>");
            deco.CssClass = "viewtable1";
            html1.Append("<table class='viewtable1' border='1'>");

            //Building the Header row.
            html1.Append("<tr>");
            foreach (DataColumn column in ttclsid.Columns)
            {
                html1.Append("<th>");
                html1.Append(column.ColumnName);
                html1.Append("</th>");
            }
            html1.Append("</tr>");

            foreach (DataRow row in ttclsid.Rows)
            {
                html1.Append("<tr>");
                foreach (DataColumn column in ttclsid.Columns)
                {
                    html1.Append("<td text-align='center' align='center' padding='5px'>");
                    html1.Append(row[column.ColumnName]);
                    html1.Append("</td>");
                }
                html1.Append("</tr>");
            }

            //Table end.
            html1.Append("</table>");
           //html1.Append("</details>");
            PlaceHolder1.Controls.Add(new Literal { Text = html1.ToString() });
        
    }
    private DataTable GetData1()
    {
        //throw new NotImplementedException();
        string clsid = (String)Session["clsid"];
        string tclsid = "grp_" + clsid;
        Int32 grpnn = Convert.ToInt32( grpdetai.Text);
        string constr = System.Configuration.ConfigurationManager.ConnectionStrings["WebAppConString"].ToString();
        try {
            using (MySqlConnection con = new MySql.Data.MySqlClient.MySqlConnection(constr))
            {
                using (MySqlCommand cmd1 = new MySqlCommand("SELECT presentationid,uhclid,studentname,email,groupid from " + tclsid + " where groupid=" + grpnn + " "))
                {
                    //data from class 1
                    using (MySqlDataAdapter sda = new MySqlDataAdapter())
                    {
                        cmd1.Connection = con;
                        sda.SelectCommand = cmd1;
                        using (DataTable ttclsid = new DataTable())
                        {
                            sda.Fill(ttclsid);
                            return ttclsid;
                        }
                    }
                }
            }
        }
        finally
        {
            conn.Close();
        }
    }
    protected void showupp(object sender, EventArgs e)
    {
        janakkaview();
    }
}