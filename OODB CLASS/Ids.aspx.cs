using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;

public partial class Ids : System.Web.UI.Page
{
    //static int counter = 1;
    MySql.Data.MySqlClient.MySqlConnection conn;
    MySql.Data.MySqlClient.MySqlConnection connect;
    MySql.Data.MySqlClient.MySqlConnection connection;
    MySql.Data.MySqlClient.MySqlConnection connectiong;

    MySql.Data.MySqlClient.MySqlCommand cmd;
    MySql.Data.MySqlClient.MySqlCommand comd;
    MySql.Data.MySqlClient.MySqlCommand cmmd;

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

        string tclsid = "cls_" + clsid;
       // Hello.Text = tclsid;
    }
    protected void buttonclick(object sender, EventArgs e)
    {
        Response.Redirect("Default1.aspx");
    }
    protected void getsid(object sender, EventArgs e)
    {
        string clsid = (String)Session["clsid"];

        string tclsid = "cls_" + clsid;
       // Hello.Text = tclsid;
        getid.Visible = false;
       
       //counter= counter+1;
        //if (counter == 2)
        //{
           // hell.Text =Convert.ToString( counter);
            generatearanomnumber();
        //}
        //else
        //{
        //    hell.Text = "You can access this button only once";
       // }
        
    }
    protected void generatearanomnumber()
    {
        Random rd = new Random();
        string clsid = (String)Session["clsid"];

        string tlclsid = "logindetails_" + clsid;
        String connstring = System.Configuration.ConfigurationManager.ConnectionStrings["WebAppConString"].ToString();
        connection = new MySql.Data.MySqlClient.MySqlConnection(connstring);
        try
        {
            connection.Open();
            querystr = "select count(*) from " + tlclsid;
            cmd = new MySql.Data.MySqlClient.MySqlCommand(querystr, connection);
            long num = (long)cmd.ExecuteScalar();
           
            Int32 numm = Convert.ToInt32(num);

            int randomnum = Convert.ToInt32(rd.Next(1, numm));
            // check.Text =Convert.ToString( randomnum );
            checktherandomnumberandassign(randomnum);
        }
        finally
        {
            connection.Close();
        }
    }
        protected void checktherandomnumberandassign(int randomnum)
        {
            int randomnums = randomnum;
            string randomnumss = Convert.ToString(randomnums);
            string clsid = (String)Session["clsid"];

            string tclsid = "cls_"+clsid;
            string tgcls = "grp_" + clsid;
           // Hello.Text = tclsid;
            
        String connstring = System.Configuration.ConfigurationManager.ConnectionStrings["WebAppConString"].ToString();
        conn = new MySql.Data.MySqlClient.MySqlConnection(connstring);
        try
        {
            conn.Open();
            string query = "select studentid from " + tclsid + " where presentationid =" + randomnums + " ";
            MySqlCommand comd = new MySqlCommand(query, conn);
            MySqlDataAdapter da = new MySqlDataAdapter();
            comd.CommandType = CommandType.Text;
            da.SelectCommand = comd;
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                hell.Text = "heaven";
                generatearanomnumber();
            }
            else
            {
                string lname = (String)(Session["lname"]);
                string fname = (String)(Session["fname"]);
                int stuid = (Int32)Session["stuid"];
                String connestring = System.Configuration.ConfigurationManager.ConnectionStrings["WebAppConString"].ToString();
                connect = new MySql.Data.MySqlClient.MySqlConnection(connestring);
                try
                {
                    connect.Open();

                    querystr = "update " + tclsid + " set presentationid =" + randomnums + " where studentid=" + stuid + " ";
                    querystr1 = "update " + tgcls + " set presentationid=" + randomnums + "  where uhclid=" + stuid + "";
                    cmd = new MySql.Data.MySqlClient.MySqlCommand(querystr, connect);
                    cmmd = new MySql.Data.MySqlClient.MySqlCommand(querystr1, connect);
                    reader = cmd.ExecuteReader();
                    reader.Close();
                    reader = cmmd.ExecuteReader();

                    reader.Close();

                    MySqlCommand coamd = new MySqlCommand("select presentationid from " + tclsid + " where studentid =" + stuid + "", connect);

                    coamd.CommandType = CommandType.Text;


                    MySqlDataAdapter daa = new MySqlDataAdapter();

                    daa.SelectCommand = coamd;
                    daa.Fill(das);

                    if (das.Tables[0].Rows.Count > 0)
                    {
                        int presenid = Convert.ToInt32(das.Tables[0].Rows[0]["presentationid"]);
                        ask.Text = "You presentation ID :" + Convert.ToString(presenid);

                    }
                }
                finally
                {
                    connect.Close();
                }

            }
        }
        finally
        {
            conn.Close();
        }
        }
       /* protected void showgrpdetails(object sender, EventArgs e)
        {
            string clsid = (String)Session["clsid"];
            string tgrpid = "grp_" + clsid;
            infogrp.Visible = true;
            grpsizeinfo.Visible = true;
            te.Visible = true;
            grpnumber.Visible = true;
            selctgrp.Visible = true;
            String connstring = System.Configuration.ConfigurationManager.ConnectionStrings["WebAppConString"].ToString();
            connection = new MySql.Data.MySqlClient.MySqlConnection(connstring);
            connection.Open();
            querystr = "select count(*) from " +tgrpid;
            cmd = new MySql.Data.MySqlClient.MySqlCommand(querystr, connection);
            long num= (long)cmd.ExecuteScalar();
            connection.Close();
            double numm=Convert.ToDouble(num);
            double noofgrps=Math.Floor(numm/5);
            infogrp.Text = "The limit of the group is 6";
            grpsizeinfo.Text = "There are groups from 1 to" +noofgrps;
        }
        protected void selectthegrp(object sender, EventArgs e)
        {
            string clsid = (String)Session["clsid"];
            string tgrpid = "grp_" + clsid;
            Int32 mygrp =Convert.ToInt32 (grpnumber.Text);
            int stuid = (Int32)Session["stuid"];
            String connstring = System.Configuration.ConfigurationManager.ConnectionStrings["WebAppConString"].ToString();
            connectiong = new MySql.Data.MySqlClient.MySqlConnection(connstring);
            connectiong.Open();
            querystr1 = "select count(*) from "+tgrpid+" where groupid=" + mygrp + "";
            cmd = new MySql.Data.MySqlClient.MySqlCommand(querystr1, connectiong);
            long check = (long)cmd.ExecuteScalar();
            Int32 checks = Convert.ToInt32(check);
            if (checks < 6)
            {
                querystr = "update " +tgrpid+ " set groupid='"+mygrp+"' where uhclid=" + stuid + "";
                cmd = new MySql.Data.MySqlClient.MySqlCommand(querystr,connectiong);
                reader = cmd.ExecuteReader();
                reader.Close();
                Int32 num=Convert.ToInt32 (grpnumber.Text);
                show.Text = "Your group number is " + num;
            }
            else
            {
                show.Text = "The maximum limit of group is only 6..Please select other group!!";
            }
        }*/
    }
