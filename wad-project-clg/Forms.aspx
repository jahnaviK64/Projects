<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Forms.aspx.cs" Inherits="Forms" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Forms</title>
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
                <li>Forms</li>
                <li><asp:LinkButton ID="login" runat="server" OnClick="login_Click">Login</asp:LinkButton></li>
                <%--<li><a href="#" >Login</a></li>--%>
            </ul></div>
        <div class="table" style="text-align:center">
                <asp:Table ID="formtable" runat="server">
                <asp:TableRow ID="fr1">
                    <asp:TableCell ID="fc1">Defensive Account Creation Authorization </asp:TableCell>
             <asp:TableCell ID="fc11"><a href="Documents/Forms.pdf" target="_blank"><img src="Images/PDF.png" alt="PDF Doc"/></a></asp:TableCell>       
                </asp:TableRow>
                <asp:TableRow ID="fr2">
                <asp:TableCell ID="fc2">Federal Direct Conslidation Loan Application and Promissory Note</asp:TableCell>    
                <asp:TableCell ID="fc22"><a href=" https://static.studentloans.gov/images/ApplicationAndPromissoryNote.pdf" target="_blank"><img src="Images/PDF.png" alt="PDF Doc"/></a></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="fr3">
                    <asp:TableCell ID="fc3">Direct Consolidation Loan Application</asp:TableCell>
                    <asp:TableCell ID="fc33"><a href="https://studentloans.gov/myDirectLoan/consolidationPaper.action" target="_blank"><img src="Images/PDF.png" alt="PDF Doc"/></a></asp:TableCell>
               </asp:TableRow>
                <asp:TableRow ID="fr4">
               <asp:TableCell ID="fc4">Public Service Loan Forgiveness(PSLF)</asp:TableCell>     
               <asp:TableCell ID="fc44"><a href="https://studentaid.ed.gov/sa/sites/default/files/public-service-employment-certification-form.pdf" target="_blank"><img src="Images/PDF.png" alt="PDF Doc"/></a></asp:TableCell>     
               </asp:TableRow>
            </asp:Table>
        </div>

    </div>
    </form>
</body>
</html>
