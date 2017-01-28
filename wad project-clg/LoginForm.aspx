<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LoginForm.aspx.cs" Inherits="LoginForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Form</title>
    <link rel="stylesheet" type="text/css" href="Style.css" />
</head>
<body>
    <form id="form1" runat="server">
        <%--++++++++++++ banner ++++++++++++--%>
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
        <%--+++++++++++++++++ banner ++++++++++++++++++++--%>
    <div class="navbar1">
            <ul class="breadcrumb">
                <li><asp:LinkButton ID="home" runat="server" OnClick="home_Click" CausesValidation="false">Home</asp:LinkButton>&nbsp |</li>
                <%--<li><a href="Default.aspx">Home</a>&nbsp |</li>--%>
                <li>Login</li>
                <%--<li><asp:LinkButton ID="login" runat="server">Login</asp:LinkButton></li>--%>
                <%--<li><a href="#" >Login</a></li>--%>
            </ul>
    </div>
    <div id="loginbox">
           <asp:Label ID="userloginlbl" runat="server" Text="User Login"></asp:Label><br /><br />
            <asp:Label ID="linelbl" runat="server" Text="If your are not a registered user, please click here:"></asp:Label>
            <asp:LinkButton ID="registerlink" runat="server" OnClick="register_Click" CausesValidation="false">Register Now</asp:LinkButton><br />
            <asp:Label ID="Label1" runat="server" Text="If you are a registered user, please enter your credentials below"></asp:Label>
            <br /><asp:Label ID="Label2" runat="server" Text="If you forget your password please click here"></asp:Label>
            <asp:LinkButton ID="pwdresetlink" runat="server" OnClick="pwdresetlink_Click" CausesValidation="false">Recover My Password</asp:LinkButton><br />
        <asp:Table ID="logintable" runat="server" BorderStyle="None" Height="120px" Width="563px">    
        <asp:TableRow>
                <asp:TableCell>
           <asp:Label ID="userid" runat="server" Text="User Id (Email Address):"></asp:Label>
                    <span style="color: #FF0000">&#42;</span>
                    </asp:TableCell>
                <asp:TableCell><span>
           <asp:TextBox ID="credentials1" runat="server" BorderWidth="1px" CausesValidation="True"></asp:TextBox>
           <asp:RegularExpressionValidator class="validations" runat="server" ErrorMessage="Please enter valid user name" ControlToValidate="credentials1" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" Display="Dynamic"></asp:RegularExpressionValidator>
           <asp:RequiredFieldValidator class="validations" runat="server" ErrorMessage="Username Required" ControlToValidate="credentials1"></asp:RequiredFieldValidator>  
             </span>  </asp:TableCell> 
                 </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell> 
           <asp:Label ID="pwd" runat="server" Text="Password:"></asp:Label>
                    <span style="color: #FF0000">&#42;</span>
                    </asp:TableCell>
                <asp:TableCell><span>
           <asp:TextBox ID="credentials" runat="server" BorderWidth="1px" Height="1.8em" Width="20em" TextMode="Password"></asp:TextBox>
           <asp:RequiredFieldValidator class="validations" runat="server" Display="Dynamic" validationexpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,10})$" ErrorMessage="Password Required" ControlToValidate="credentials"></asp:RequiredFieldValidator>
              </span></asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        <p>
            <asp:Label ID="regbottom" runat="server" style="color:red; font-size:0.9em" Text="&#42; DENOTES REQUIRED ITEMS"></asp:Label>
            <asp:Button ID="loginbtn" runat="server" Text="Log In" BorderWidth="1px" Height="2em" Width="5em" Font-Bold="True" Font-Size="0.8em" OnClick="loginbtn_Click"/></p>
    </div> 
    </div>
    </form>
</body>
</html>
