<%@ Page Language="C#" AutoEventWireup="true" CodeFile="My-Account.aspx.cs" Inherits="My_Account" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Account</title>
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
                <li><asp:LinkButton ID="home" runat="server" OnClick="home_Click">Home</asp:LinkButton>&nbsp |</li>
                <%--<li><a href="Default.aspx">Home</a>&nbsp |</li>--%>
                <li>MyAccount</li>
                <li><asp:LinkButton ID="logout" runat="server">Logout</asp:LinkButton></li>
                <%--<li><a href="#" >Login</a></li>--%>
            </ul>
    </div>
    <div class="myaccount">
            <%--first table--%>
        <div style="text-align:center"><asp:Label ID="myaccheader" runat="server" Text="Your Loan Account Details" ></asp:Label></div>
        <hr /><br />
            <asp:Table ID="myacctable1" runat="server">
                <%--<asp:TableHeaderRow>
                    <asp:TableHeaderCell style ="text-align:center; font-size:x-large">
                    Your Loan Account Details</asp:TableHeaderCell>
                </asp:TableHeaderRow>--%>
                <asp:TableRow>
                    <asp:TableCell>Account Number:</asp:TableCell>
                    <asp:TableCell id="account" runat="server" style ="text-align:right; font-size:x-large; color:#a524bc"></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Full Name:</asp:TableCell>
                    <asp:TableCell id="fullname" runat="server" style ="text-align:right; font-size:x-large;color:#a524bc"></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Last Updated Date:</asp:TableCell>
                    <asp:TableCell ID="veena" runat="server" style ="text-align:right; font-size:x-large;color:#a524bc"></asp:TableCell>
                </asp:TableRow>
            </asp:Table> <hr />
            <%--second table--%> <%--style ="font-size:x-large"--%> <%--Height="300px" Width="1000px"--%> <%--style ="text-align:right;"--%>
            <asp:Table ID="myacctable2" runat="server" >
                <asp:TableRow ID="mat1" >
                    <asp:TableCell ID="mat2">Current Balance</asp:TableCell>
                    <asp:TableCell ID="mat3">0.0</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="mat4">
                    <asp:TableCell ID="mat5">Last Updated Date</asp:TableCell>
                    <asp:TableCell ID="mat6">0.0</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="mat7">
                    <asp:TableCell ID="mat8">Regular Monthly Payment Amount</asp:TableCell>
                    <asp:TableCell ID="mat9">0.0</asp:TableCell>
                </asp:TableRow>
            <asp:TableRow ID="mat10">
                    <asp:TableCell ID="mat11">Amount Satisfied by Extra Payment</asp:TableCell>
                    <asp:TableCell ID="mat12">0.0</asp:TableCell>
                </asp:TableRow>
            <asp:TableRow ID="mat13">
                    <asp:TableCell ID="mat14">Past Due Amount (if applicable)</asp:TableCell>
                    <asp:TableCell ID="mat15">0.0</asp:TableCell>
                </asp:TableRow>
            <asp:TableRow ID="mat16">
                    <asp:TableCell ID="mat17" Style="font-weight:bold">Current Amount Due</asp:TableCell>
                    <asp:TableCell ID="mat18">0.0</asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        <span><asp:Label ID="myaccbottom" runat="server" Text="Current Statement Due Date: "></asp:Label>
        <asp:Label ID="myaccbottomdate" runat="server" Style="color:#a524bc; font-size:xx-large; 
        font-weight:bold"></asp:Label></span><hr />
    </div>
    </div>
    </form>
</body>
</html>
