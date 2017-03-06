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
public partial class Update : System.Web.UI.Page
{
    MySql.Data.MySqlClient.MySqlConnection conn;
    MySql.Data.MySqlClient.MySqlCommand cmd;
    MySql.Data.MySqlClient.MySqlDataReader reader;
    MySql.Data.MySqlClient.MySqlDataAdapter da = null;
    DataSet ds = null;
    String querystr;
    protected void Page_Load(object sender, EventArgs e)
    {
        string fullname = (String)(Session["fullname"]);
        //username.Text = fullname;
        String connstring = System.Configuration.ConfigurationManager.ConnectionStrings["WebAppConString"].ToString();
        conn = new MySql.Data.MySqlClient.MySqlConnection(connstring);
        if (!Page.IsPostBack)
        {

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
        selectclass.Text = classid;

        //String cid = "cls_" + Hello.SelectedValue;
        querystr = "Select p.sno,p.chapter,p.section,p.day,p.date,p.page,p.studentid,s.uhclid from " + classid + " as p,logindetails_5433_1 s where s.uhclid=p.studentid order by sno";
        da = new MySqlDataAdapter(querystr, conn);
        ds = new DataSet();
        cmd = new MySql.Data.MySqlClient.MySqlCommand(querystr, conn);
        try
        {


            conn.Open();
            MySqlDataReader dr = cmd.ExecuteReader();

            DataTable dt = new DataTable();
            dt.Load(dr);
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
        }
        finally
        {
            conn.Close();
        }
        /* da.Fill(ds, "class");
        Repeater1.DataSource = ds.Tables["class"];
        Repeater1.DataBind();*/


    }
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

        String classid = (String)Session["class"];
        int pid = int.Parse(e.CommandArgument.ToString());

        if (e.CommandName == "Edit")
        {

            Response.Redirect("Updatepresentation.aspx?eid=" + pid);

        }
        else if (e.CommandName == "Delete")
        {


            querystr = "Delete from " + classid + " Where sno= " + pid;
            try {
                if (conn.State != ConnectionState.Open)


                    conn.Open();

                cmd = new MySqlCommand(querystr, conn);

                // cmd.Parameters.AddWithValue("sno", pid);

                if (cmd.ExecuteNonQuery() > 0)
                {

                    Response.Redirect("Update.aspx");
                    // Response.Write("<b style='color:green'>Record Deleted Successfully!!!</b>");


                    //Rebind Repeater Control

                    //BindPresentationData();

                }

                else
                {

                    Response.Write("<b style='color:red'>Record Deletion Failed!!!</b>");

                }
            }
            finally
            {
                conn.Close();
            }
            

        }


    }
    protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
    }



    /*protected void Hello_SelectedIndexChanged(object sender, EventArgs e)
     {
         string val = "cls_"+Hello.SelectedValue.ToString();
         querystr = "Select p.sno,p.date,p.chapter,p.page,p.studentid,s.uhclid from " + val + " as p,logindetails s where s.uhclid=p.studentid order by sno";
         cmd = new MySql.Data.MySqlClient.MySqlCommand(querystr, conn);
         conn.Open();

         MySqlDataReader dr = cmd.ExecuteReader();

         DataTable dt = new DataTable();
         dt.Load(dr);
         Repeater1.DataSource = dt;
         Repeater1.DataBind();
     }*/
}