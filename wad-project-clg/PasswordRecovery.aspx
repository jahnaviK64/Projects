<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PasswordRecovery.aspx.cs" Inherits="Password_Recovery" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Password Recovery</title>
    <link rel="stylesheet" type="text/css" href="Style.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <div class="first">
            <div class="image">
            <img src="Images/download.jpg" alt="Loan" class="left" />
            </div>
            <p><br />
            <strong><em>DEFENSIVE EDUCATION LOAN SERVICE</em></strong><br />
            We work hard with you to get that Loan You Deserve
            </p>
    </div>
 <div>
     <br />
     <asp:Label ID="pwsreclbl" runat="server" Text="Password Recovery"></asp:Label><br /><br />
     <asp:Table ID="pwdrectable" runat="server">
         <asp:TableRow>
             <asp:TableCell>
                <asp:Label ID="pwdrecemail" runat="server" Text="Email Address:"></asp:Label>
                 <asp:TextBox ID="pwdrecemailtxt" runat="server"></asp:TextBox>
                 <asp:Button ID="pwdrecbtn" runat="server" Text="Recover Password" OnClick="pwdrecbtn_Click" style="margin-left:8px;"/> <br />
                 <asp:RegularExpressionValidator class="validations" runat="server" ErrorMessage="Enter valid Email" ControlToValidate="pwdrecemailtxt" style="margin-left:9em" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" Display="Dynamic"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator class="validations" runat="server" ErrorMessage="Email Required" style="margin-left:9em" ControlToValidate="pwdrecemailtxt"></asp:RequiredFieldValidator>
             </asp:TableCell>
         </asp:TableRow>
         <asp:TableRow>
             <asp:TableCell>
                 <asp:LinkButton ID="pwdreclinkbtn" runat="server" OnClick="pwdreclinkbtn_Click" CausesValidation="false">Go Back To The Main Page</asp:LinkButton>
             </asp:TableCell>
         </asp:TableRow>
     </asp:Table> 
 </div>
    </div>
    </form>
</body>
</html>
