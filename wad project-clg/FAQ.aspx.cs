using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FAQ : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["currentuser"] == null)
            {
                login.Text = "Login";
            }
            else
            {
                login.Text = "Logout";
            }

        }
        else
        {
            if (Session["currentuser"] != null)
            {
                login.Text = "Logout";
            }
            else
            {
                login.Text = "Login";
            }
        }
    }
    protected void home_Click(object sender, EventArgs e)
    {
        Server.Transfer("Default.aspx", true);
    }
    protected void login_Click(object sender, EventArgs e)
    {
        if (Session["CurrentUser"] != null)
        {
            Session.Abandon();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('You Are Now Logged Out')", true);
            login.Text = "Login";

        }
        else
        {
            Server.Transfer("LoginForm.aspx", true);
        }
    }
}