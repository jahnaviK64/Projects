<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup
        Application["AllUsersList"] = new List< StudentInfor>(); 
         List<StudentInfor> allUsersList = Application["AllUsersList"] as List<StudentInfor>;

       DBConnection c = new DBConnection();
       string stmt = "SELECT * from kurraj_WADfl16_StudentInfor";
       c.DBReaderOpen(stmt);
       StudentInfor st;
       while(c.dr.Read())
       {
           st = new StudentInfor(c.dr["fullName"].ToString(),
               c.dr["socialSecurityNumber"].ToString(),
               c.dr["dateOfBirth"].ToString(),
           c.dr["address"].ToString(),
           c.dr["userName"].ToString(),
           c.dr["password"].ToString(),
           c.dr["emailAddress"].ToString(),
           c.dr["securityQuestion"].ToString(),
           c.dr["securityQuestionAnswer"].ToString(),
           Convert.ToInt32(c.dr["accountNumber"]),
          Convert.ToBoolean( c.dr["certifiedChecked"]),
          c.dr["lastUpdatedDate"].ToString() ,
          Convert.ToSingle(c.dr["currentBalance"]),
          Convert.ToSingle(c.dr["regularMonthlyPaymentAmount"]),
          Convert.ToSingle(c.dr["amountSatisfiedByExtraPayment"]),
          Convert.ToSingle(c.dr["pastDueAmount"]),
          Convert.ToSingle(c.dr["currentAmountDue"]),
          c.dr["currentStatementDueDate"].ToString());
           allUsersList.Add(st);

       }
       Application["AllUsersList"] = allUsersList;
       c.DBReaderClose();
    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.
    }       
</script>
