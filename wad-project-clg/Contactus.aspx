<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Contactus.aspx.cs" Inherits="Contactus" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contact Us</title>
    <link rel="stylesheet" type="text/css" href="Style.css" />
    
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="first">
            <div class="image">
            <img src="Images/download.jpg" alt="Loan" class="left" /
            ></div>
            <p><br />
            <strong><em>DEFENSIVE EDUCATION LOAN SERVICE</em></strong><br />
            We work hard with you to get that Loan You Deserve
            </p>
            </div
            ><div class="navbar">
            <ul class="breadcrumb">
                <li><asp:LinkButton ID="home" runat="server" OnClick="home_Click">Home</asp:LinkButton>&nbsp |</li>
                <%--<li><a href="Default.aspx">Home</a>&nbsp |</li>--%>
                <li>Contact Us</li>
                <li><asp:LinkButton ID="login" runat="server" OnClick="login_Click">Login</asp:LinkButton></li>
                <%--<li><a href="#" style="float:right">Login</a></li>--%>
            </ul><div id="demo" style="margin-top:0;"></div>
        <div>
          <script>
        function loadDoc(contactinfo)
        {
            if (window.XMLHttpRequest) {
                xhttp = new XMLHttpRequest();
            }
            else {
                xhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            xhttp.open("GET",contactinfo, false);
            xhttp.send(null);
            xmlDoc = xhttp.responseXML;
            return xmlDoc;
        }
        function myFunction(xml) {
                var i;
                var tab = "<table style='margin-top:0; width:70%; height:auto; border:1px solid black; margin-left:200px'>";
                var xml_dom = loadDoc(xml);
                var items = xml_dom.getElementsByTagName('info');
                var phone = items[0].getAttribute('toll-free-phone');
                var dphone = items[0].getAttribute('direct-phone');
                var address = items[0].getAttribute('mailing-address');
                var email = items[0].getAttribute('email');
                var web = items[0].getAttribute('website');
                tab += '<tr><td style="text-align:center;border:1px solid black; border-collapse:collapse;">Mailing Address</td> <td style="text-align:center;border:1px solid black; border-collapse:collapse;">' + address + '</td><br/>' + '<tr><td style="text-align:center;border:1px solid black; border-collapse:collapse;">Toll Free Number</td><td style="color:blue;text-align:center;border:1px solid black;border-collapse:collapse;"><u>' + phone + '</u></td><br/>' + '<tr><td style="text-align:center;border:1px solid black; border-collapse:collapse;">Direct Phone Number</td><td style="color:blue;text-align:center;border:1px solid black;border-collapse:collapse;"><u>' + dphone + '</u></td><br/>' + '<tr><td style="text-align:center;border:1px solid black; border-collapse:collapse;">Email Address</td><td style="text-align:center;border:1px solid black;border-collapse:collapse;">' + email + '</td><br/>' + '<tr><td style="text-align:center;border:1px solid black; border-collapse:collapse;">Web Site</td><td style="text-align:center;border:1px solid black;border-collapse:collapse;">' + web + '</td></tr>';
                tab += '</table>';
            return tab;        
        }
        var file = 'contactus.xml';
        document.getElementById("demo").innerHTML = myFunction(file);
    </script>
            </div>
        </div><br /> 
        <div style="text-align:center;">
        <p style="color:mediumblue"><b>You must be logged in to send us a message</b></p>
        <p style="color:red"><b>Please type your message below and click the Send Message button</b></p>
        <asp:TextBox ID="textarea" runat="server" TextMode="MultiLine" style="width:50%;"></asp:TextBox><br /><br />
        <%--<textarea rows="15" cols="10" disabled="disabled" style="width:50%;"></textarea><br />--%>
        <asp:Button ID="button" runat="server" Text="Send Message" Onclick="button_Click" style="color:royalblue; width:250px; padding:4px; align-content:center"></asp:Button>
        </div>
       <%--<button type="button" style="color:royalblue; width:250px; padding:4px; align-content:center">Send Message</button></center>--%>
    </div>
    </form>
</body>
</html>
