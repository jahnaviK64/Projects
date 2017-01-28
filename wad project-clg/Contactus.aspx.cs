using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Contactus : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["currentuser"] == null)
            {
                login.Text = "Login";
                textarea.Enabled = false;
                button.Enabled = false;
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
                textarea.Enabled = false;
                button.Enabled = false;
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
    protected void button_Click(object sender, EventArgs e)
    {
        var userlist = (List<String>)Session["CurrentUser"];
        if (String.IsNullOrWhiteSpace(textarea.Text))
        {
            string message = "Textbox cannot be empty, please enter your message!";
            string script = String.Format("alert('{0}');", message);
            this.Page.ClientScript.RegisterStartupScript(this.Page.GetType(), "msgbox", script, true);
        }
        try
        {
            String GMAIL_SERVER = "smtp.gmail.com";
            int PORT = 587;
            SmtpClient mailServer = new SmtpClient(GMAIL_SERVER, PORT);
            mailServer.EnableSsl = true;

            //Provide your email id with your password.
            //Enter the app-specfic password if two-step authentication is enabled.
            mailServer.Credentials = new System.Net.NetworkCredential("jahnavik64@gmail.com", "9709597435564");

            //Senders email.
            string from = "jahnavik64@gmail.com";
            //Receiver email
            string to = userlist[1];
            MailMessage msg = new MailMessage(from, to);

            //Subject of the email.
            msg.Subject = "We have received your message!";

            //Specify the body of the email here.
            msg.Body = "\n Dear Valued Student,\n\n You are receiving this email because you contacted us with a question and/ or a concern. Our support staff will respond within the next 48 hours. \n\nThank You. \nDefensive Educational Loan Service Team.";
            mailServer.Send(msg);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Thank you. An email notification also has been sent to the address we have in our file')", true);
        }
        catch
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('There is an error while sending an email')", true);
        }
    }
}