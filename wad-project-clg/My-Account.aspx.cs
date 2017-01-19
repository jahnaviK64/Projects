using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class My_Account : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var userlist = (List<String>)Session["currentuser"];
        List<StudentInfor> allUsersList = Application["AllUsersList"] as List<StudentInfor>;
        if (Session["currentuser"] == null)
        {
            //Session["currentuser"] = new List<StudentInfor>();
            account.Text = ""; 
            fullname.Text = "";
        }
        else
        {
            
            foreach (StudentInfor item in allUsersList)
            {
                if (item.EmailAddress.Equals(userlist[1]) && item.Password.Equals(userlist[0]))
                {
                    account.Text = item.AccountNumber.ToString();
                    fullname.Text = item.FullName;
                    mat3.Text = item.CurrentBalance.ToString();
                    mat6.Text = item.LastUpdatedDate.ToString();
                    veena.Text = item.LastUpdatedDate.ToString();
                    mat9.Text = item.RegularMonthlyPaymentAmount.ToString();
                    mat12.Text = item.AmountSatisfiedByExtraPayment.ToString();
                    mat15.Text = item.PastDueAmount.ToString();
                    mat18.Text = item.CurrentAmountDue.ToString();
                    myaccbottomdate.Text = item.CurrentStatementDueDate.ToString();
                }
            }
        }
        }
    protected void home_Click(object sender, EventArgs e)
    {
        Server.Transfer("Default.aspx", true);
    }
}