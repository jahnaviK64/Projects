<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Myhome.aspx.cs" Inherits="Myhome" %>

    <!DOCTYPE html>
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/myhomestyles.css" />
    </head>
        
    <body>
    <form id="form1" runat="server">
    <div id="header_container">  
    <div id="header">
    <div id="banner">
    <h1><a href="http://prtl.uhcl.edu/portal/page/portal/HOMEPAGE" target="_blank"><img border="0" alt="W3Schools" src="images/logo.png" width="50" height="50"/></a> UHCL</h1>
    </div><!--close banner-->
    <asp:Button runat="server"  ID="loout" Text="log out" OnClick="buttonclick" /> 
    <!--<div id="banner_slogan">
    </div><!--close banner_slogan-->	
    <div id='cssmenu'>
    <ul>
    <li class='active'><a href='Myhome.aspx'>Home</a></li>
    <li ><a href='Updatehome.aspx'>Update</a></li>
    <li><a href='View.aspx'>View</a></li>
   
    </ul>
    </div><!--close menubar-->  
    </div><!--close header-->  
    </div><!--close header_container-->  
    <div id="main">
    <div id="site_content" style="min-height:700px;height:auto">
        <center><img src="images/welcome.gif" /></center>
       <%--<center><img src="imm/1.jpg" width="700"/></center>--%>
        
        <%--re--------------------------------------------------------------------------------------------------------------------------- re --%>
        
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
            <asp:Timer runat="server" Interval="1400" OnLoad="Timer1_Tick"></asp:Timer>
       <center> <asp:Image ID="Image1" height="400" width="700" ImageAlign="middle" runat="server" /></center>
                </ContentTemplate>
        </asp:UpdatePanel>
            
                
         <%--re--------------------------------------------------------------------------------------------------------------------------- re --%>
    
        
        
        <center><p>Schedule for this semester</p></center>
        <center><table border="1" style="width:700px;height:200px"><tr><th>class</th><th>Day</th><th>Time</th><th>Location</th></tr>
                <tr style="text-align:center"><center><td>5433-1</td><td>Wednesday</td></center><center><td>4.00 PM - 6.50 PM</td></center><center><td>Delta-241</td></center></tr>
                <tr style="text-align:center"><center><td>5433-2</td></center><center><td>Thursday</td></center><center><td>4.00 PM - 6.50 PM</td></center><center><td>Delta-243</td></center></tr>
                </table></center>
    <div id="content">
    </div><!--close content-->
    </div><!--close site_content-->    
    </div><!--close main--> 
    <div id="footer_container">     
    <div id="footer">
    <a href="http://sce.uhcl.edu/liaw/" target="_blank">Faculty Website</a> 
    </div><!--close footer-->
    </div><!--close footer_container-->  
    </form>
    </body>
    </html>

