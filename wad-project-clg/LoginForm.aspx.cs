using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LoginForm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void home_Click(object sender, EventArgs e)
    {
        Server.Transfer("Default.aspx", true);
    }
    protected void register_Click(object sender, EventArgs e)
    {
        Server.Transfer("Registration.aspx", true);
    }
    protected void pwdresetlink_Click(object sender, EventArgs e)
    {
        Server.Transfer("PasswordRecovery.aspx", true);
    }
    protected void loginbtn_Click(object sender, EventArgs e)
    {
        List<StudentInfor> allUsersList = Application["AllUsersList"] as List<StudentInfor>;
        if (allUsersList.Count == 0)
        {
            MessageBox("It appears this user is not in our database. Please Click Register Now Link.");
        }
        else
        {   // list
            foreach (StudentInfor item in allUsersList)
            {
                if (item.EmailAddress.Equals(credentials1.Text) && item.Password.Equals(credentials.Text))
                {
                    List<String> userlist = new List<String>();
                    userlist.Add(credentials.Text);
                    userlist.Add(credentials1.Text);
                    Session["currentuser"] = userlist;
                    Response.Redirect("My-Account.aspx");
                    //MessageBox("You are now Logged In.");
                }
            }
        }
    }
    private void MessageBox(string Message)
    {
        Label lblMessageBox = new Label();
        lblMessageBox.Text =
            "<script language='javascript'>" + Environment.NewLine +
            "window.alert('" + Message + "')</script>";
        Page.Controls.Add(lblMessageBox);
    }
}