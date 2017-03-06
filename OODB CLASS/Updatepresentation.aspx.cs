using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Text;
using System.Data;
using MySql.Data.Common;
using MySql.Data.Types;
using MySql.Data.MySqlClient;
public partial class Updatepresentation : System.Web.UI.Page
{
    MySql.Data.MySqlClient.MySqlConnection conn;
    MySql.Data.MySqlClient.MySqlCommand cmd;
    MySql.Data.MySqlClient.MySqlDataReader reader;
    MySql.Data.MySqlClient.MySqlDataAdapter da = null;
    DataSet ds = null;
    String querystr;
    protected void Page_Load(object sender, EventArgs e)
    {
        String connstring = System.Configuration.ConfigurationManager.ConnectionStrings["WebAppConString"].ToString();
        conn = new MySql.Data.MySqlClient.MySqlConnection(connstring);

        if (!Page.IsPostBack)
        {
            if (Request.QueryString["eid"] == null)

                Response.Redirect("Update.aspx");
            BindPresentationData();

        }
    }
    protected void buttonclick(object sender, EventArgs e)
    {
        Response.Redirect("Default1.aspx");
    }
    void BindPresentationData()
    {

        String classid = (String)Session["class"];
        int pid = Convert.ToInt32(Request.QueryString["eid"]);

        querystr = "select * from " + classid + " Where sno=" + pid + "";
        try
        {



            if (conn.State != ConnectionState.Open)

                conn.Open();

            cmd = new MySqlCommand(querystr, conn);

            cmd.Parameters.AddWithValue("sno", pid);

            MySqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {

                dat.Text = dr["day"].ToString();
                day.Text = dr["date"].ToString();
                chapter.Text = dr["chapter"].ToString();
                pg.Text = dr["page"].ToString();
                topic.Text = dr["section"].ToString();

            }

            else
            {

                lblStatus.Text = "<b>No presentation Details Found!!!</b>";

            }

            dr.Close();
        }
        finally
        {
            conn.Close();
        }
        

    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (dat.Text == "" || day.Text == "" || chapter.Text == "" || topic.Text == "" || pg.Text == "")
        {
            Response.Write("<b style='color:red'>Please fill all the details</b>");
        }

        else
        {

            if ((int.Parse(dat.Text) > 12 || (int.Parse(dat.Text)) < 1))
            {

                Response.Write("<b style='color:red'> Please enter valid Month</b>");

            }
            if ((int.Parse(day.Text) > 31 || (int.Parse(day.Text)) < 1))
            {

                Response.Write("<b style='color:red'> Please enter valid Day</b>");

            }
            else
            {

                String classid = (String)Session["class"];
                querystr = "Update " + classid + " Set date=" + day.Text.Trim() + ", chapter='" +

                chapter.Text.Trim() + "'" + ", page='"+ pg.Text.Trim() + "',day=" + dat.Text + " ,section='" + topic.Text.Trim() + "'" + " Where sno= " + Request.QueryString["eid"].ToString();
                try {
                    if (conn.State != ConnectionState.Open)

                        conn.Open();

                    cmd = new MySqlCommand(querystr, conn);

                    if (cmd.ExecuteNonQuery() > 0)
                    {

                        /*lblStatus.Text = "<b style='color:green'>Record Updated Successfully!!!</b>";*/
                        Response.Redirect("Update.aspx");

                    }
                    else
                    {

                        lblStatus.Text = "<b style='color:red'>Record Updation Failed!!!</b>";

                    }
                }
                finally
                {
                    conn.Close();
                }
               
            }
        }

    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {

        Response.Redirect("Update.aspx");

    }
}