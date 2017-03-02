using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["currentuser"] == null)
            {
                login1.Text = "Login";
            }
            else
            {
                login1.Text = "Logout";
            }

        }
        else
        {
            if (Session["currentuser"] != null)
            {
                login1.Text = "Logout";
            }
            else
            {
                login1.Text = "Login";
            }
        }
    }
   
   
    protected void myaccountlinkbtn_Click(object sender, EventArgs e)
    {
        Server.Transfer("My-Account.aspx", true);
    }
    protected void formslinkbtn_Click(object sender, EventArgs e)
    {
        Server.Transfer("Forms.aspx", true);
    }
    protected void contactuslinkbtn_Click(object sender, EventArgs e)
    {
        Server.Transfer("Contactus.aspx", true);
    }
    protected void glossarylinkbtn_Click(object sender, EventArgs e)
    {
        Server.Transfer("Glossary.aspx", true);
    }
    protected void faqlinkbtn_Click(object sender, EventArgs e)
    {
        Server.Transfer("FAQ.aspx", true);
    }
    protected void login_Click(object sender, EventArgs e)
    {
        if (Session["CurrentUser"] != null)
        {
            Session.Abandon();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('You Are Now Logged Out')", true);
            login1.Text = "Login"; 
        }
        else
        {
            Server.Transfer("LoginForm.aspx", true);
        }
    }
}
