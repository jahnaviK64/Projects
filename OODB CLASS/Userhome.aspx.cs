using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;

public partial class Userhome : System.Web.UI.Page
{
    string name;
    string lastname;
    string firstname;
    MySql.Data.MySqlClient.MySqlConnection conn;
    MySql.Data.MySqlClient.MySqlCommand cmd;
    MySql.Data.MySqlClient.MySqlDataReader reader;
    String querystr;
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        name = (String)(Session["uname"]);
        username.Text = name;
        eventgetnumbers();
    }
  /*  protected void getnumbersof(object sender, EventArgs e)
    {
        string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["WebAppConString"].ToString();
        conn = new MySql.Data.MySqlClient.MySqlConnection(connstring);
        conn.Open();
        string lname = (String)(Session["lname"]);
        string fname =(string)(Session["fname"]);
        int stuid = (Int32)Session["stuid"];
        string clsid = (String)Session["clsid"];
        //string clssid = (String)Session["clsid"];

        string tlclsid = "logindetails_" + clsid;
        querystr = "update "+tlclsid+" set firsttimeuser = 0 where stufirstname='" + fname + "' and stulastname='" + lname + "'";
        cmd = new MySql.Data.MySqlClient.MySqlCommand(querystr, conn);
        reader = cmd.ExecuteReader();
        conn.Close();
        Session["lname"] = lname;
        Session["fname"] = fname;
        Session["stuid"] = stuid;
        Session["clsid"] = clsid;
        Response.Redirect("Ids.aspx");
        
    }*/
    protected void buttonclick(object sender, EventArgs e)
    {
        Response.Redirect("Default1.aspx");
    }
    protected void eventgetnumbers()
    {
        lastname = (String)(Session["lname"]);
        firstname=(String)(Session["fname"]);
        int stuid = (Int32)Session["stuid"];
        string clsid = (String)Session["clsid"];

        string tlclsid = "cls_" + clsid;
        String connstring = System.Configuration.ConfigurationManager.ConnectionStrings["WebAppConString"].ToString();
        conn = new MySql.Data.MySqlClient.MySqlConnection(connstring);
        try {
            conn.Open();
            MySqlCommand comd = new MySqlCommand("select presentationid,chapter,section,page,date,day,year from " + tlclsid + " where studentid=" + stuid + "", conn);

            MySqlDataAdapter da = new MySqlDataAdapter();
            comd.CommandType = CommandType.Text;
            da.SelectCommand = comd;
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {

                object value = ds.Tables[0].Rows[0]["presentationid"];
                Int32 chapter = Convert.ToInt32(ds.Tables[0].Rows[0]["chapter"]);
                string section = Convert.ToString(ds.Tables[0].Rows[0]["section"]);
                string page = Convert.ToString(ds.Tables[0].Rows[0]["page"]);
                Int32 date = Convert.ToInt32(ds.Tables[0].Rows[0]["date"]);
                Int32 month = Convert.ToInt32(ds.Tables[0].Rows[0]["day"]);
                //Int32 year=Convert.ToInt32(ds.Tables[0].Rows[0]["year"]);
                //int groupid = Convert.ToInt32(ds.Tables[0].Rows[0]["groupid"]);
                if (value == DBNull.Value)
                {
                    myid.Text = "You have not yet selected your Presentation ID please select it in presentations tab";
                    //mypres.Visible = false;
                    //getnumbers.Visible = false;

                }
                else
                {
                    /* myid.Text = "Your presentation id is " + value;
                     mypres.Text="you have presentation on "+month+" /"+date+" from chapter number "+chapter+" section "+section+" and page numbers covering are "+page;
                     //getnumbers.Visible = true;*/
                    myid.Text = value.ToString();
                    dat.Text = month.ToString() + "/" + date.ToString();
                    ch.Text = chapter.ToString();
                    topic.Text = section;
                    pg.Text = page;

                }
            }
        }
        finally
        {
            conn.Close();
        }
                    
                   
    }
   
}