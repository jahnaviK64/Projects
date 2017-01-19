using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Net.Mail;  
using System.Web.UI.WebControls;

public partial class Password_Recovery : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
        protected void pwdreclinkbtn_Click(object sender, EventArgs e)
    {
        Server.Transfer("LoginForm.aspx", true);
    }
    protected void pwdrecbtn_Click(object sender, EventArgs e)
    {
        if(Page.IsValid)
        {
            var userlist = (List<String>)Session["CurrentUser"];
            List<StudentInfor> allUsersList = Application["AllUsersList"] as List<StudentInfor>;
            Boolean flag = false;
            String recoveredPwd = "";
            try
            {
                if (allUsersList == null)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('hello')", true);
                }
                else
                {
                    foreach (StudentInfor item in allUsersList)
                    {
                        if (item.EmailAddress.Equals(pwdrecemailtxt.Text))
                        {
                            recoveredPwd = item.Password.ToString();
                            flag = true;
                            break;
                        }
                    }
                    if (flag)
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
                        string to = pwdrecemailtxt.Text;
                        MailMessage msg = new MailMessage(from, to);

                        //Subject of the email.
                        msg.Subject = "We have recovered your password!";

                        //Specify the body of the email here.
                        msg.Body = "Dear Valued Student,\n You are receiving this email because a you requested to recover your password.\n  Your current password is :" + recoveredPwd + "\n  Thank You.\n Defensive Educational Loan Service Team. ";
                        mailServer.Send(msg);
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Thank you. An email has been sent to the address your provided')", true);
                    }

                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Entered email id is not a registered user. Please register')", true);
                        //Server.Transfer("Registration.aspx");
                    }
                }
            }
            catch
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('There is an error while sending an email')", true);
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