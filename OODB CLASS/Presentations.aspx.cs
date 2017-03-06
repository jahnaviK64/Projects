using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using System.Text;
public partial class Presentations : System.Web.UI.Page
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
        string lname = (String)(Session["lname"]);
        string fname = (String)(Session["fname"]);
        string fullname = fname + lname;
        username.Text = fullname;
        eventgetnumbers();
    }
    protected void buttonclick(object sender, EventArgs e)
    {
        Response.Redirect("Default1.aspx");
    }
    protected void getnumbersof(object sender, EventArgs e)
    {
        string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["WebAppConString"].ToString();
        conn = new MySql.Data.MySqlClient.MySqlConnection(connstring);
        try {
            conn.Open();
            string lname = (String)(Session["lname"]);
            string fname = (string)(Session["fname"]);
            int stuid = (Int32)Session["stuid"];
            string clsid = (String)Session["clsid"];
            //string clssid = (String)Session["clsid"];

            string tlclsid = "logindetails_" + clsid;
            querystr = "update " + tlclsid + " set firsttimeuser = 0 where stufirstname='" + fname + "' and stulastname='" + lname + "'";
            cmd = new MySql.Data.MySqlClient.MySqlCommand(querystr, conn);
            reader = cmd.ExecuteReader();
           
            Session["lname"] = lname;
            Session["fname"] = fname;
            Session["stuid"] = stuid;
            Session["clsid"] = clsid;
            Response.Redirect("Ids.aspx");
        }
        finally
        {
            conn.Close();
        }
    }
    protected void eventgetnumbers()
    {
        lastname = (String)(Session["lname"]);
        firstname = (String)(Session["fname"]);
        string clsid = (String)Session["clsid"];

        string tlclsid = "logindetails_" + clsid;
        String connstring = System.Configuration.ConfigurationManager.ConnectionStrings["WebAppConString"].ToString();
        conn = new MySql.Data.MySqlClient.MySqlConnection(connstring);
        try {
            conn.Open();
            MySqlCommand comd = new MySqlCommand("select firsttimeuser from " + tlclsid + " where stufirstname='" + firstname + "' and stulastname='" + lastname + "'", conn);

            MySqlDataAdapter da = new MySqlDataAdapter();
            comd.CommandType = CommandType.Text;
            da.SelectCommand = comd;
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {

                int first = Convert.ToInt32(ds.Tables[0].Rows[0]["firsttimeuser"]);

                if (first == 0)
                {
                    getnumbers.Visible = false;
                    display.Visible = true;
                    janakkaview();
                    //presentation details view of every body goes here

                }
                else
                {
                    getnumbers.Visible = true;
                    display.Visible = true;
                    janakkaview();
                }
            }
        }
        finally
        {
            conn.Close();
        }
        

    }

   protected void janakkaview()
   {
         if (!this.IsPostBack)
         {
            
            // DataTable ttclsid = (DataTable)tclsid;
             DataTable ttclsid = this.GetData1();
             //Building an HTML string.
             StringBuilder html1 = new StringBuilder();
            /* html1.Append("<details>");
             html1.Append("<summary>");
             html1.Append("Click to view details of your Class ");
             html1.Append("</summary>");*/
             //Table start.
             html1.Append("<br/>");
             deco.CssClass = "viewtable1";
             html1.Append("<table class='viewtable1' border='1'");

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
                     html1.Append("<td text-align='center' align='center' padding='5px' cell-padding='5px' colour='green'>");
                     html1.Append(row[column.ColumnName]);
                     html1.Append("</td>");
                 }
                 html1.Append("</tr>");
             }

             //Table end.
             html1.Append("</table>");
            // html1.Append("</details>");
             PlaceHolder1.Controls.Add(new Literal { Text = html1.ToString() });
         }
   }
    private DataTable GetData1()
    {
        //throw new NotImplementedException();
        string clsid = (String)Session["clsid"];
        string tclsid = "cls_" + clsid;
        string constr = System.Configuration.ConfigurationManager.ConnectionStrings["WebAppConString"].ToString();
        try {
            using (MySqlConnection con = new MySql.Data.MySqlClient.MySqlConnection(constr))
            {
                using (MySqlCommand cmd1 = new MySqlCommand("SELECT sno,presentationid,studentid,chapter,section,page,date,day from " + tclsid))
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

}