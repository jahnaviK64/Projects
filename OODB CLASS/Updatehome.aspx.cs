using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Updatehome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void buttonclick(object sender, EventArgs e)
    {
        Response.Redirect("Default1.aspx");
    }
    protected void Hello_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["class"] = "cls_" + Hello.SelectedValue;
        String k = (String)Session["classid"];
        Response.Redirect("Update.aspx");
    }
}