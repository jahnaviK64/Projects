using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Myhome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String name = (string)(Session["uname"]);
        Session["fullname"] = name;
       // username.Text = name;
    }
    protected void buttonclick(object sender, EventArgs e)
    {
        Response.Redirect("Default1.aspx");
    }
    protected void Timer1_Tick(object sender, EventArgs e)
    {
        SetImageUrl();
    }

    private void SetImageUrl()
    {
        Random _rand = new Random();
        int i = _rand.Next(1, 6);
        Image1.ImageUrl = "~/images/" + i.ToString() + ".jpg";
    }
   
}