<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Updatehome.aspx.cs" Inherits="Updatehome" %>



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
    <h1><a href="http://prtl.uhcl.edu/portal/page/portal/HOMEPAGE" target="_blank"><img border="0" alt="W3Schools" src="imm/logo.png" width="50" height="50"/></a> UHCL</h1>
    </div><!--close banner-->
    <asp:Button runat="server"  ID="loout" Text="log out" OnClick="buttonclick" /> 
    <!--<div id="banner_slogan">
    </div><!--close banner_slogan-->	
    <div id='cssmenu'>
    <ul>
    <li ><a href='Myhome.aspx'>Home</a></li>
    <li class='active'><a href='Updatehome.aspx'>Update</a></li>
    <li><a href='View.aspx'>View</a></li>
   
    </ul>
    </div><!--close menubar-->  
    </div><!--close header-->  
    </div><!--close header_container-->  
    <div id="main">
    <div id="site_content">	
        <br />
     <center><img src="images/update.jpg" style="width:80%;height:400px"/></center>  
       <br />
        <marquee scrollamount="10" style="color:cadetblue">Select class to update</marquee>
       <br />
        <br />
        <center>
      <asp:DropDownList ID="Hello" runat="server" width="8em" Height="2em" AutoPostBack="True" OnSelectedIndexChanged="Hello_SelectedIndexChanged">
          <asp:ListItem>Select class</asp:ListItem>
          <asp:ListItem Value="5433_1"></asp:ListItem>
          <asp:ListItem Value="5433_2"></asp:ListItem>
       </asp:DropDownList>
           
            </center>
    <br />
       
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

