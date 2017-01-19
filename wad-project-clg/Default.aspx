<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>WAD Assignment1</title>
    <link rel="stylesheet" type="text/css" href="Style.css" />
    <%--<script>
        function home() {
            location.href = 'Default.aspx';
        }
    </script>--%>
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
            <div class="second">
                <div class="part1">
                    <ul style="margin-top:40px">
                    <li><asp:LinkButton ID="login1" runat="server" OnClick="login_Click"></asp:LinkButton></li>
                        <%--<li><a href="#">Login</a></li>--%>
                    <li>
                        <div class="infor" style="display:inline-block"><a href="#">Infor Center</a>
                       <div class="submenu">
                       <asp:LinkButton ID="glossarylinkbtn" runat="server" OnClick="glossarylinkbtn_Click">Glossary</asp:LinkButton><br />
                       <%--<a href="glossary.aspx">Glossary</a><br />--%>
                       <asp:LinkButton ID="faqlinkbtn" runat="server" OnClick="faqlinkbtn_Click">FAQ</asp:LinkButton>
                       <%--<a href="FAQ.aspx">FAQ</a>--%>
                       </div>
                       <div id="arrow" style="float:right;margin:5px;margin-left:7px"></div>
                       </div>
                    </li>
                    <li><asp:LinkButton ID="myaccountlinkbtn" runat="server" OnClick="myaccountlinkbtn_Click">My Account</asp:LinkButton></li>
                    <%--<li><a href="#">My Account</a></li>--%>
                    <li><asp:LinkButton ID="formslinkbtn" runat="server" OnClick="formslinkbtn_Click">Forms</asp:LinkButton></li>
                    <%--<li><a href="Forms.aspx">Forms</a></li>--%>
                    <li><asp:LinkButton ID="contactuslinkbtn" runat="server" OnClick="contactuslinkbtn_Click">Contact Us</asp:LinkButton> </li>
                    <%--<li><a href="Contactus.aspx">Contact Us</a></li>--%>
                    </ul>
                </div>
                <div class="part2">
                    <p style="padding-left:5px"><br /><strong style="color:darkblue">Who We Are....</strong> <br />
                    Defensive Education Loan Service provides loan services for the one who looks for the financial help to 
                    get his/her education goals completed. <%--<br /> &nbsp &nbsp &nbsp--%> We provide services for Campus Based Loans, Private Education Loans and
                    Federal Family Education Loans. We work hard with you to get the loan You Deserve, Maintain Loan Activities, Send Payment 
                    Remainders and Process Payments. 
                    </p>
                </div>
            </div>

            <div class="third">
                <%--<input type="image" src="Image/comodo.png"/>--%>
                <%--<img src="Images/comodo.png" alt="Comodo" class="one"/>--%>
                <div id="one"><a href="https://ssl.comodo.com/" target="_blank"><img src="Images/comodo.png" alt="Comodo"/> </a></div>
                <div id="two"><img src="Images/thumbsup.jpg " alt="Image1" class="two" width="330px" height="240px" /></div>
                <div id="three"><img src="Images/lead_Large.jpg" alt="Image2" class="three" width="330px" height="240px"/></div>
            </div>

        <%--advertisements--%>
        <div class="fourth">
            <asp:ScriptManager ID="sm" runat="server"></asp:ScriptManager>
            <asp:Timer ID="Timer1" Interval="1500" runat="server"></asp:Timer>
            <asp:UpdatePanel ID="Update" runat="server">
            <Triggers>
                <asp:AsyncPostBackTrigger controlID="Timer1" EventName="Tick"/>
            </Triggers>
                <ContentTemplate>
            <asp:AdRotator ID="AdRotator1" runat="server" AdvertisementFile="~/adfile1.xml" Target="_blank" keywordfilter="Computers1"/>
            <asp:AdRotator ID="AdRotator2" runat="server" AdvertisementFile="~/adfile1.xml" Target="_blank" keywordfilter="Computers2"/>
            <asp:AdRotator ID="AdRotator3" runat="server" AdvertisementFile="~/adfile1.xml" Target="_blank" keywordfilter="Computers3"/>
            <asp:AdRotator ID="AdRotator4" runat="server" AdvertisementFile="~/adfile1.xml" Target="_blank" keywordfilter="Computers4"/>
            <asp:AdRotator ID="AdRotator5" runat="server" AdvertisementFile="~/adfile1.xml" Target="_blank" keywordfilter="Computers5"/>
               </ContentTemplate> 
            </asp:UpdatePanel>
        </div>
            <div>
                <hr id="horizontalline"/>
                <p style="color:forestgreen; text-align:center; font:bold 15px 'times new roman', verdana">
                    &copy; Defensive Education Loan Services, Inc. All rights reserved. 2012-2016</p>
            </div>
    </div>
    </form>
</body>
</html>
