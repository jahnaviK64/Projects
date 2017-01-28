using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Registration : System.Web.UI.Page
{
    int user = 0;
    protected void login_Click(object sender, EventArgs e)
    {
        Server.Transfer("LoginForm.aspx", true);
    }
    protected void Page_Load(object sender, EventArgs e)
    {

        List<StudentInfor> allUsersList = Application["AllUsersList"] as List<StudentInfor>;
        BindDDL("Year");
        BindDDL("Month");
        BindDDL("Date");
    }
    protected void home_Click(object sender, EventArgs e)
    {
        Server.Transfer("Default.aspx", true);
    }
    private void BindDDL(string ddl)
    {
        switch (ddl)
        {
            case "Year":
                ddlYear.DataSource = GetYear();
                ddlYear.DataBind();
                ddlYear.Items.Insert(0, new ListItem("2001"));
                break;
            case "Date":
                ddlDate.DataSource = GetDate();
                ddlDate.DataBind();
                ddlDate.Items.Insert(0, new ListItem("1"));
                break;
            case "Month":
                ddlMonth.DataSource = GetMonth();
                ddlMonth.DataBind();
                ddlMonth.Items.Insert(0, new ListItem("January"));
                ddlMonth.Items.Insert(1, new ListItem("February"));
                ddlMonth.Items.Insert(2, new ListItem("March"));
                ddlMonth.Items.Insert(3, new ListItem("April"));
                ddlMonth.Items.Insert(4, new ListItem("May"));
                ddlMonth.Items.Insert(5, new ListItem("June"));
                ddlMonth.Items.Insert(6, new ListItem("July"));
                ddlMonth.Items.Insert(7, new ListItem("August"));
                ddlMonth.Items.Insert(8, new ListItem("September"));
                ddlMonth.Items.Insert(9, new ListItem("October"));
                ddlMonth.Items.Insert(10, new ListItem("November"));
                ddlMonth.Items.Insert(11, new ListItem("December"));
                break;
        }
    }
    private List<int> GetYear()
    {
        List<int> year = new List<int>();
        for (int i = 2000; i >= 1950; i--)
        {
            year.Add(i);
        }
        return year;

    }
    private List<int> GetDate()
    {
        List<int> date = new List<int>();
        for (int i = 2; i <= 31; i++)
        {
            date.Add(i);
        }
        return date;
    }
    private List<int> GetMonth()
    {
        List<int> month = new List<int>();
        //for (int i = 1; i <= 12; i++)
        //{
        //    month.Add(i);
        //}
        return month;
    }

    protected void ddlMonth_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void regtxtbox1_Changed(object sender, EventArgs e)
    {
        List<StudentInfor> allUsersList = Application["AllUsersList"] as List<StudentInfor>;
        foreach (StudentInfor item in allUsersList)
        {
            if ((item.SocialSecurityNumber).Equals(regtxtbox1.Text))
            {
                string ssnnumber = regtxtbox1.Text + " Already exists. Please Go to Login Page";
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "err_msg", "alert('" + ssnnumber + "');window.location='Registration.aspx';", true);
                //MessageBox(regtxtbox1.Text + " Already Exists try. Please go to login page");
            }
        }
    }
    //submit btn message box
    protected void submitbtn_Click(object sender, EventArgs e)
    {
        List<StudentInfor> allUsersList = Application["AllUsersList"] as List<StudentInfor>;

        foreach (StudentInfor item in allUsersList)
        {
            if ((item.SocialSecurityNumber).Equals(regtxtbox1.Text))
            {
                string ssnnumber = regtxtbox1.Text + " Already exists. Please Go to Login Page";
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "err_msg", "alert('" + ssnnumber + "');window.location='Registration.aspx';", true);
                // MessageBox(regtxtbox1.Text + " Already Exists try. Please go to login page");
                user = 1;
            }

        }
        if (user == 0)
        {
            Random generator = new Random();
            String r = generator.Next(0, 1000000).ToString("D6");
            int rand = generator.Next(1000000);
            if (firstcheck.Checked == false)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage",
       "alert('Please Accept the Certifying Statement by Checking the box at the Top Left Hand Side.');", true);
            }
            //else
            //{
            //    allUsersList.Add(new StudentInfor(regtxtbox5.Text, regtxtbox6.Text, firstcheck.Checked, regtxtbox1.Text, regtxtbox2.Text, ddlMonth.Text + "" + ddlDate.Text + "" + ddlYear.Text, regtxtbox4.Text, regtxtbox7.Text, secdropdwn.Text, regtxtbox9.Text, rand));
            //    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "err_msg", "alert('Thank you for submitting for registration. You can now login by clicking the Login link at the top right hand side of this page');window.location='Registration.aspx';", true);
            //    //MessageBox("Thank you for submitting for registration. You can now login by clicking the Login link at the top right hand side of this page ");
            //}

            //Email
            else
            {
                DBConnection cn = new DBConnection();
                string str = "INSERT INTO KurraJ_WADfl16_StudentInfor values('" + regtxtbox1.Text + "', '" + regtxtbox5.Text + "','" +
                regtxtbox6.Text + "','" + firstcheck.Checked + "','" + regtxtbox2.Text + "','" + ddlMonth.Text + "/" + ddlDate.Text + "/" + ddlYear.Text + "','" +
                regtxtbox4.Text + "','" + regtxtbox8.Text + "','-','" + regtxtbox9.Text + "'," + rand + ",'0',0,0,0,0,0,'0')";
                cn.activecard(str);
                cn.DBClose();
                allUsersList.Add(new StudentInfor(regtxtbox2.Text, regtxtbox1.Text, "", regtxtbox4.Text, regtxtbox5.Text, regtxtbox6.Text, regtxtbox7.Text, secdropdwn.Text, anslbl.Text, rand, firstcheck.Checked, "0", 0, 0, 0, 0, 0, "0"));

                Application["AllUsersList"] = allUsersList;
                // list
                //allUsersList.Add(new StudentInfor(regtxtbox5.Text.ToString(), regtxtbox6.Text.ToString(), firstcheck.Checked, regtxtbox1.Text, regtxtbox2.Text.ToString(), ddlMonth.Text + "/" + ddlDate.Text + "/" + ddlYear.Text, regtxtbox4.Text, regtxtbox7.Text, secdropdwn.Text, regtxtbox9.Text,rand));
                //Application.Lock();
                //Application["AllUsersList"] = allUsersList;
                //Application.UnLock();

                //var userlist = (List<String>)Session["CurrentUser"];
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
                    string to = regtxtbox7.Text.ToString();
                    MailMessage msg = new MailMessage(from, to);

                    //Subject of the email.
                    msg.Subject = "We have received your message!";
                    msg.IsBodyHtml = true;
                    //Specify the body of the email here.
                    msg.Body = "<br/> Dear" + regtxtbox2.Text + ", <br/> <br/>Thank You for registering with us. <br/> You can now access your loan account at <a href=\"http://dcm.uhcl.edu/c432016fa01kurraj/LoginForm.aspx\" > login</a> <br/> In the meantime, please share the word about Defensive Educational Loan Service with your friends and neighbours!. Defensive Educational Loan Service is open to all eligible college applicants throughout the United States. <br/> <br/>Thank you again for your registration. If you have any questions, Please contact us at <a href=\"http://dcm.uhcl.edu/c432016fa01kurraj/Contactus.aspx\" > Contactus</a> <br/> <br/>With Best Wishes, <br/> Defensive Educational Loan Service Team.";
                    mailServer.Send(msg);
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Thank you. An email notification also has been sent to the address we have in our file')", true);
                }
                catch
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('There is an error while sending an email')", true);
                }

            }
        }
        else
        {

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