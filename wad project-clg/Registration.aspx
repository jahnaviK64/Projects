<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration</title>
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
    <div class="navbar">
            <ul class="breadcrumb">
                <li><asp:LinkButton ID="home" runat="server" OnClick="home_Click" CausesValidation="false">Home</asp:LinkButton>&nbsp |</li>
                <%--<li><a href="Default.aspx">Home</a>&nbsp |</li>--%>
                <li>Registration</li>
                <li><asp:LinkButton ID="login" runat="server" OnClick="login_Click" CausesValidation="false">Login</asp:LinkButton></li>
                <%--<li><a href="#" >Login</a></li>--%>
            </ul>
    </div>
    <div class="registrationform">
        <p>
        <asp:CheckBox ID="firstcheck" runat="server" Height="1.5em" Width="1.5em" />         
        <asp:Label ID="checklbl" runat="server" Text="By providing this information, I certify that I am the person identified
            by these items, and that I agree to the site Terms and Use."></asp:Label> 
        </p>
        <%--table start--%>
        <asp:Table ID="regtable" runat="server" Height="346px" Width="687px">

            <%--<span style="color: #FF0000; background-color: #FFFF00">&#63;</span>--%>
            <asp:TableRow>
                <asp:TableCell>
        <asp:Label ID="fullnlbl" runat="server" Text="Full Name&nbsp;"></asp:Label><span style="color: #FF0000">&#42;</span>
                    </asp:TableCell>
                <asp:TableCell>
            <asp:TextBox ID="regtxtbox2" runat="server" BorderColor="Black" Width="15em"></asp:TextBox>&nbsp;
            <a href="#" data-toggle="tooltip" data-placement="right" style="text-decoration: none" 
                title="Many foreign countries do not have a zip code. If you are foreign, you can skip the zip code in the address."><asp:Label ID="fullnq" runat="server" Text="&#63;"></asp:Label></a>
            <asp:RequiredFieldValidator class="validations" runat="server" ErrorMessage="Full Name Required" ControlToValidate="regtxtbox2" Display="Dynamic"></asp:RequiredFieldValidator>
                </asp:TableCell>
                </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
        <asp:Label ID="ssnlbl" runat="server" Text="Social Security Number&nbsp;"></asp:Label>
            <span style="color: #FF0000">&#42;</span>
                </asp:TableCell>
                <asp:TableCell>
            <asp:TextBox ID="regtxtbox1" runat="server" BorderColor="Black" AutoPostBack="true" OnTextChanged="regtxtbox1_Changed"></asp:TextBox>&nbsp;
            <a href="#" data-toggle="tooltip" data-placement="right" style="text-decoration: none"
                title="Once you set up a User Name to access your account, you will no longer need to provide your complete social security number/account number, birthdate or zip code to log in. For security, you will need to provide your full social security number or account number if your forget your User Name or Password." / >
                 <asp:Label ID="ssnq" runat="server" Text="&#63;"></asp:Label></a>
           <asp:RegularExpressionValidator class="validations" runat="server" ErrorMessage="Enter valid SSN" ControlToValidate="regtxtbox1" ValidationExpression="^\d{3}-?\d{2}-?\d{4}$" Display="Dynamic"></asp:RegularExpressionValidator>
           <asp:RequiredFieldValidator class="validations" runat="server" ErrorMessage="SSN Required" ControlToValidate="regtxtbox1" Display="Dynamic"></asp:RequiredFieldValidator> 
                 </asp:TableCell>
                 </asp:TableRow>
            <%--<span style="color: #FF0000; background-color: #FFFF00">&#63;</span></p>--%>
            <asp:TableRow>
                <asp:TableCell>
        <asp:Label ID="ssnlbl2" runat="server" Text="Confirm Social Security Number&nbsp;"></asp:Label>
                <span style="color: #FF0000">&#42;</span>
                </asp:TableCell>
                <asp:TableCell>
            <asp:TextBox ID="regtxtbox3" runat="server" BorderColor="Black"></asp:TextBox>
                    <%-- validations --%>
           <asp:RegularExpressionValidator class="validations" runat="server" ErrorMessage="Enter valid SSN" ControlToValidate="regtxtbox3" ValidationExpression="^\d{3}-?\d{2}-?\d{4}$" Display="Dynamic"></asp:RegularExpressionValidator>
           <asp:RequiredFieldValidator class="validations" runat="server" ErrorMessage="Confirm SSN" ControlToValidate="regtxtbox3"></asp:RequiredFieldValidator>
           <asp:CompareValidator class="validations" runat="server" ErrorMessage="SSN's do not match." ControlToValidate="regtxtbox3" ControlToCompare="regtxtbox1"></asp:CompareValidator> 
                    </asp:TableCell>
                 </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell> 
            <asp:Label ID="doblbl" runat="server" Text="Date of Birth&nbsp;"></asp:Label><span style="color: #FF0000">&#42;</span>
                          </asp:TableCell>
                       <asp:TableCell>   
            <asp:DropDownList ID="ddlMonth" runat="server" OnSelectedIndexChanged="ddlMonth_SelectedIndexChanged"></asp:DropDownList>
            <asp:DropDownList ID="ddlDate" runat="server"></asp:DropDownList>
            <asp:DropDownList ID="ddlYear" runat="server"></asp:DropDownList>&nbsp;
                    </asp:TableCell> 
                        </asp:TableRow>
            
            <%--<asp:Label ID="dobq" runat="server" Text="&#63;"></asp:Label>--%>
            <%--<span style="color: #FF0000; background-color: #FFFF00">&#63;</span></p>--%>  
             <asp:TableRow>
                 <asp:TableCell>
        <asp:Label ID="addrslbl" runat="server" Text="Address&nbsp;"></asp:Label><span style="color: #FF0000">&#42;</span>
                 </asp:TableCell> 
                 <asp:TableCell>
            <asp:TextBox ID="regtxtbox4" runat="server" BorderColor="Black" Width="25em"></asp:TextBox>
                     <a href="#" data-toggle="tooltip" data-placement="right" style="text-decoration: none" 
                title="Many foreign countries do not have a zip code. If you are foreign, you can skip the zip code in the address. "><asp:Label ID="addressq" runat="server" Text="&#63;"></asp:Label></a>
            <asp:RequiredFieldValidator class="validations" runat="server" Display="Dynamic" ErrorMessage="Please enter address" ControlToValidate="regtxtbox4"></asp:RequiredFieldValidator>
                 </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
            <asp:Label ID="usernamelbl" runat="server" Text="User Name&nbsp;"></asp:Label><span style="color: #FF0000">&#42;</span>
                </asp:TableCell>
                <asp:TableCell>
            <asp:TextBox ID="regtxtbox5" runat="server" BorderColor="Black"></asp:TextBox>&nbsp;
            <asp:Label ID="chars" runat="server" Text="6 to 64 characters"></asp:Label>
           <asp:RegularExpressionValidator class="validations" runat="server" Display="Dynamic" ErrorMessage="Enter valid User Name" ControlToValidate="regtxtbox5" ValidationExpression="^[a-zA-Z''-'\s]{6,40}$"></asp:RegularExpressionValidator>
           <asp:RequiredFieldValidator class="validations" runat="server" ErrorMessage="Username Required" ControlToValidate="regtxtbox5"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>

            <%--<span style="color: #FF0000; background-color: #FFFF00">6 to 64 characters</span></p>--%>
            <asp:TableRow>
                <asp:TableCell>
            <asp:Label ID="pwdlbl" runat="server" Text="Password&nbsp;"></asp:Label><span style="color: #FF0000">&#42;</span>
                </asp:TableCell>
                <asp:TableCell>
            <asp:TextBox ID="regtxtbox6" runat="server" BorderColor="Black" TextMode="Password"></asp:TextBox>&nbsp;
            <a href="#" data-toggle="tooltip" data-placement="right"style="text-decoration: none" 
            title="Password must be between 8 and 10 characters, contain at least one digit and one alphabetic character, and must not contain special characters">
            <asp:Label ID="pwdrules" runat="server" Text="Password Rules"></asp:Label></a>
           <asp:RegularExpressionValidator class="validations" runat="server" Display="Dynamic" ErrorMessage="Enter valid Password" ControlToValidate="regtxtbox6" ValidationExpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,10})$"></asp:RegularExpressionValidator>
           <asp:RequiredFieldValidator class="validations" runat="server" Display="Dynamic" ErrorMessage="Password Required" ControlToValidate="regtxtbox6"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
            <asp:Label ID="repwdlbl" runat="server" Text="Confirm Password&nbsp;"></asp:Label><span style="color: #FF0000">&#42;</span>
                </asp:TableCell>
                <asp:TableCell>
            <asp:TextBox ID="regtxtbox10" runat="server" BorderColor="Black" BorderWidth="1px" TextMode="Password" ></asp:TextBox>&nbsp;
           <asp:RegularExpressionValidator class="validations" runat="server" Display="Dynamic" ErrorMessage="Enter valid Password" ControlToValidate="regtxtbox10" ValidationExpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,10})$"></asp:RegularExpressionValidator>
           <asp:RequiredFieldValidator class="validations" runat="server" ErrorMessage="Password Required" ControlToValidate="regtxtbox10"></asp:RequiredFieldValidator>
           <asp:CompareValidator class="validations" runat="server" ErrorMessage="Password do not match." ControlToValidate="regtxtbox10" ControlToCompare="regtxtbox6"></asp:CompareValidator>
                </asp:TableCell>
            </asp:TableRow>
            <%--<span style="color: #FF0000; background-color: #FFFF00">Password Rules</span></p>--%>
            <asp:TableRow>
                <asp:TableCell>
        <asp:Label ID="emaillbl" runat="server" Text="Email Address&nbsp;"></asp:Label><span style="color: #FF0000">&#42;</span>
                </asp:TableCell>
                <asp:TableCell>
        <asp:TextBox ID="regtxtbox7" runat="server" BorderColor="Black" Width="12em"></asp:TextBox>
        <asp:RegularExpressionValidator class="validations" runat="server" Display="Dynamic" ErrorMessage="Enter valid Email" ControlToValidate="regtxtbox7" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"></asp:RegularExpressionValidator>
           <asp:RequiredFieldValidator class="validations" runat="server" ErrorMessage="Email Required" ControlToValidate="regtxtbox7"></asp:RequiredFieldValidator>
                </asp:TableCell>
                </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
        <asp:Label ID="emaillbl2" runat="server" Text="Confirm Email Address&nbsp;"></asp:Label><span style="color: #FF0000">&#42;</span>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="regtxtbox8" runat="server" BorderColor="Black" Width="12em"></asp:TextBox>
           <asp:RegularExpressionValidator class="validations" runat="server" Display="Dynamic" ErrorMessage="Enter valid Email" ControlToValidate="regtxtbox8" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"></asp:RegularExpressionValidator>
           <asp:RequiredFieldValidator class="validations" runat="server" ErrorMessage="Email Required" ControlToValidate="regtxtbox8"></asp:RequiredFieldValidator>
           <asp:CompareValidator class="validations" runat="server" ErrorMessage="Emails do not match." ControlToValidate="regtxtbox8" ControlToCompare="regtxtbox7"></asp:CompareValidator>
                    </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
             <asp:Label ID="secq" runat="server" Text="Security Question&nbsp;"></asp:Label><span style="color: #FF0000">&#42;</span>
                </asp:TableCell>
                <asp:TableCell>
            <asp:DropDownList ID="secdropdwn" runat="server">
              <asp:ListItem>What is your mother's maiden name?</asp:ListItem>
                <asp:ListItem>What was your childhood nickname? </asp:ListItem>
                <asp:ListItem>What is the name of your favorite childhood friend? </asp:ListItem>
                <asp:ListItem>What is your favorite sport team?</asp:ListItem>
                <asp:ListItem>What was the make and model of your first car?</asp:ListItem>
                <asp:ListItem>What school did you attend for sixth grade?</asp:ListItem>
                <asp:ListItem>What was the last name of your third grade teacher? </asp:ListItem>
                <asp:ListItem>In what town was your first job? </asp:ListItem>
                <asp:ListItem>What is your favorite movie? </asp:ListItem>
                <asp:ListItem>Who is your childhood sports hero? </asp:ListItem>
                <asp:ListItem>In what year was your father born? </asp:ListItem>
            </asp:DropDownList>
             <a href="#" data-toggle="tooltip" data-placement="right" style="text-decoration: none" 
            title="Single word answers are best. John, red, green, drum, for example.">
            <asp:Label ID="secqq" runat="server" Text="&#63;"></asp:Label></a>
                    </asp:TableCell>
            </asp:TableRow>
            <%--<span style="color: #FF0000; background-color: #FFFF00">&#63;</span></p>--%>
            <asp:TableRow>
                <asp:TableCell>
        <asp:Label ID="anslbl" runat="server" Text="Answer&nbsp;"></asp:Label><span style="color: #FF0000">&#42;</span>
                </asp:TableCell>
                <asp:TableCell>
            <asp:TextBox ID="regtxtbox9" runat="server" BorderColor="Black" Width="12em"></asp:TextBox>
            <asp:RequiredFieldValidator class="validations" runat="server" Display="Dynamic" ErrorMessage="Please provide an Answer" ControlToValidate="regtxtbox9"></asp:RequiredFieldValidator>
                </asp:TableCell>
                </asp:TableRow>
        </asp:Table>
        <%--table end--%>
        <asp:Label ID="regbottom" runat="server" style="color:red; font-size:1.5em" Text="&#42; DENOTES REQUIRED ITEMS"></asp:Label>
        <%--<p style="color:red">&#42; DENOTES REQUIRED ITEMS</p>--%>
        <p><asp:Button ID="submitbtn" runat="server" Text="Submit" BorderColor="Black" BorderStyle="Solid" BorderWidth="1.2px" Font-Size="1.2em" Height="2.1em" Width="7.3em" OnClick="submitbtn_Click"/></p>
    </div>
    </div>
    </form>
    <p>
        &nbsp;</p>
<script>
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();   
});
</script>
</body>
</html>
