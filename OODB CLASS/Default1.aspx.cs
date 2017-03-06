using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    MySql.Data.MySqlClient.MySqlConnection conn;
    MySql.Data.MySqlClient.MySqlCommand cmd;
    MySql.Data.MySqlClient.MySqlDataReader reader;
    String querystr;
    DataSet ds = new DataSet();
    
    protected void Page_Load(object sender, EventArgs e)
    {
       // Response.Redirect("index.html");
    }
    protected void submiteventbutton(object sender, EventArgs e)
    {
        //Response.Redirect("Myhome.aspx");
        //password.Text = "hello";
        loginUser();
    }
    private void loginUser()
    {
        
        String connstring = System.Configuration.ConfigurationManager.ConnectionStrings["WebAppConString"].ToString();
        conn = new MySql.Data.MySqlClient.MySqlConnection(connstring);

        try
        {
            conn.Open();


            querystr = "";

            /*string name = "";
            while (reader.HasRows && reader.Read())
            {
                name = reader.GetString(reader.GetOrdinal("stufirstname")) + "" + reader.GetString(reader.GetOrdinal("stulastname"));
            }
            if (reader.HasRows)
           {
                Session["uname"] = name;
                Response.BufferOutput = true;*/
            string cls = ddlclass.SelectedItem.Text;
            string tlcls = "logindetails_" + cls;
            MySqlCommand comd = new MySqlCommand("select usertype,stufirstname,stulastname,uhclid from " + tlcls + " where lastname='" + login.Text + "' and uhclid='" + password.Text + "'", conn);
            MySqlDataAdapter da = new MySqlDataAdapter();
            comd.CommandType = CommandType.Text;
            da.SelectCommand = comd;

            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                //string cls = ddlclass.SelectedItem.Text;
                // string tcls = "logindetails_" + cls;
                /* querystr = "update "+tcls+" set classid='" + cls + "' where lastname='" + login.Text + "' and uhclid='" + password.Text + "'";
                cmd = new MySql.Data.MySqlClient.MySqlCommand(querystr, conn);
                reader = cmd.ExecuteReader();
                reader.Close();*/
                int usertype = Convert.ToInt32(ds.Tables[0].Rows[0]["usertype"]);
                string fname = Convert.ToString(ds.Tables[0].Rows[0]["stufirstname"]);
                string lname = Convert.ToString(ds.Tables[0].Rows[0]["stulastname"]);
                string fullname = fname + lname;
                int stuid = Convert.ToInt32(ds.Tables[0].Rows[0]["uhclid"]);

                if (usertype == 1)
                {
                    Session["uname"] = fullname;
                    Session["lname"] = lname;
                    Session["fname"] = fname;
                    Response.Redirect("Myhome.aspx");
                }
                else if (usertype == 2)
                {
                    Session["uname"] = fullname;
                    Session["lname"] = lname;
                    Session["fname"] = fname;
                    Session["stuid"] = stuid;
                    Session["clsid"] = cls;
                    Response.Redirect("Userhome.aspx");
                }
                else
                {
                    check.Text = "no user";
                }
            }
            else
            {
                dong.Text = "***** Your user name or password is incorrect *****";
            }



            /*   }
               else
               {
                  check.Text = "invalid user";
               }
               reader.Close();*/
        }

        finally
        {
            conn.Close();
        }
        } 
    }
