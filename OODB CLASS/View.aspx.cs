using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using MySql.Data.MySqlClient;
using System.Data;
using System.Text;

public partial class View : System.Web.UI.Page
{
    protected void buttonclick(object sender, EventArgs e)
    {
        Response.Redirect("Default1.aspx");
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        string fullname = (String)(Session["fullname"]);
        //username.Text = fullname;
        if (!this.IsPostBack)
        {
            //************ from class 1 database ***************//

            //Populating a DataTable from database.
            //Response.Write("Class 1 details");
            //Console.WriteLine("Details of Class 1");
            //Console.WriteLine();
            //PlaceHolder1.Controls.Add(new LiteralControl("<br /> <br />"));

            DataTable cls_5433_1 = this.GetData1();

            //Building an HTML string.
            StringBuilder html1 = new StringBuilder();
            html1.Append("<details>");
            html1.Append("<summary>");
            html1.Append("Click to view details of Class 1");
            html1.Append("</summary>");
            //html1.Append("</br>");


            //PlaceHolder1.Controls.Add(new LiteralControl("<br /> <br />")); 
            //html1.AppendLine = ();

            //Table start.
            html1.Append("<br/>");
            deco.CssClass = "viewtable";
            html1.Append("<table class='viewtable' border='1' >");

            //Building the Header row.
            html1.Append("<tr>");
            foreach (DataColumn column in cls_5433_1.Columns)
            {
                html1.Append("<th>");
                html1.Append(column.ColumnName);
                html1.Append("</th>");
            }
            html1.Append("</tr>");

            //Building the Data rows.
            foreach (DataRow row in cls_5433_1.Rows)
            {
                html1.Append("<tr>");
                foreach (DataColumn column in cls_5433_1.Columns)
                {
                    html1.Append("<td text-align='center' align='center' padding='5px' cell-padding='5px'>");
                    html1.Append(row[column.ColumnName]);
                    html1.Append("</td>");
                }
                html1.Append("</tr>");
            }

            //Table end.
            html1.Append("</table>");
            html1.Append("</details>");

            //Append the HTML string to Placeholder.
            PlaceHolder1.Controls.Add(new Literal { Text = html1.ToString() });
            //PlaceHolder1.Controls.Add(new LiteralControl("<br /> <br />"));


            //*************from class 2 database****************//

            //Populating a DataTable from database.
            //Response.Write("Class 2 details");
            //PlaceHolder1.Controls.Add(new LiteralControl("<br /> <br />"));
            DataTable cls_5433_2 = this.GetData2();

            //Building an HTML string.
            StringBuilder html = new StringBuilder();
            //html.Append("Click below to view details of Class 2");
            html.Append("<details>");
            html.Append("<summary>");
            html.Append("Click to view details of Class 2");
            html.Append("</summary>");
            html.Append("</br>");


            PlaceHolder1.Controls.Add(new LiteralControl("<br /> <br />"));
            //Table start.

            html.Append("<table class='viewtable' border = '1'>");

            //Building the Header row.
            html.Append("<tr>");
            foreach (DataColumn column in cls_5433_2.Columns)
            {
                html.Append("<th>");
                html.Append(column.ColumnName);
                html.Append("</th>");
            }
            html.Append("</tr>");

            //Building the Data rows.
            foreach (DataRow row in cls_5433_2.Rows)
            {
                html.Append("<tr>");
                foreach (DataColumn column in cls_5433_2.Columns)
                {
                    html.Append("<td text-align='center' align='center' padding='5px' cell-padding='5px'>");
                    html.Append(row[column.ColumnName]);
                    html.Append("</td>");
                }
                html.Append("</tr>");
            }

            //Table end.
            html.Append("</table>");
            html.Append("</details>");

            //Append the HTML string to Placeholder.
            PlaceHolder1.Controls.Add(new Literal { Text = html.ToString() });
        }
    }
    private DataTable GetData1()
    {
        //throw new NotImplementedException();

        string constr = System.Configuration.ConfigurationManager.ConnectionStrings["WebAppConString"].ToString();
        
            using (MySqlConnection con = new MySql.Data.MySqlClient.MySqlConnection(constr))
            {
                using (MySqlCommand cmd1 = new MySqlCommand("SELECT sno,presentationid, studentid,chapter,section,page,date,day from cls_5433_1"))
                {
                    //data from class 1
                    using (MySqlDataAdapter sda = new MySqlDataAdapter())
                    {
                        cmd1.Connection = con;
                        sda.SelectCommand = cmd1;
                        using (DataTable cls_5433_1 = new DataTable())
                        {
                            sda.Fill(cls_5433_1);
                            return cls_5433_1;
                        }
                    }
                }
            }
        
        
        
    }
    // data from class 2

    private DataTable GetData2()
    {
        string constr = System.Configuration.ConfigurationManager.ConnectionStrings["WebAppConString"].ToString();
        using (MySqlConnection con = new MySql.Data.MySqlClient.MySqlConnection(constr))
        {
            using (MySqlCommand cmd2 = new MySqlCommand("SELECT sno,presentationid, studentid,chapter,section,page,date,day from cls_5433_2"))
            {
                using (MySqlDataAdapter sda = new MySqlDataAdapter())
                {
                    cmd2.Connection = con;
                    sda.SelectCommand = cmd2;
                    using (DataTable cls_5433_2 = new DataTable())
                    {
                        sda.Fill(cls_5433_2);
                        return cls_5433_2;
                    }
                }
            }
        }
    }

    protected void loout_Click(object sender, EventArgs e)
    {
        //Response.Redirect("Default.aspx");
        //or
        Server.Transfer("Default1.aspx");
    }
}
