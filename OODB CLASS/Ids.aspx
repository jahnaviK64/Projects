<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Ids.aspx.cs" Inherits="Ids" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
            <link rel="stylesheet" type="text/css" href="css/userhomestyles.css" />

</head>
<body>
     <form id="form1" runat="server">
    <div id="header_container">  
         
    <div id="header">
        
	  <div id="banner">
<h1><a href="http://prtl.uhcl.edu/portal/page/portal/HOMEPAGE" target="_blank"><img border="0" alt="W3Schools" src="imm/logo.png" width="50" height="50"/></a> UHCL</h1>
	 
      </div><!--close banner-->
        	 <asp:Button runat="server"  ID="loout" Text="log out" OnClick="buttonclick"/> 
	  <!--<div id="banner_slogan">
	  </div><!--close banner_slogan-->	
      <div id='cssmenu'>
<ul>
   <li class='active'><a href='Userhome.aspx'>Home</a></li>
   <li><a href='Presentations.aspx'>Presentations</a></li>
   <li><a href='Group.aspx'>Group</a></li>
       <asp:Label ID="username" Text="no" runat="server" CssClass="welcome" style="font-size:12px"/>

</ul>
          
</div><!--close menubar-->  
    </div><!--close header-->  
  </div><!--close header_container-->  
  <div id="main">

	<div id="site_content">	
        <div id="run">
           <%-- <asp:Label runat="server" ID="Hello" Text="hi" style="font-family:cursive;color:cadetblue;font:bold"><br /></asp:Label>--%>
            <asp:Label ID="ask" runat="server" Text="Press the button to get the presentation ID  :" style="font-family:cursive;color:cadetblue;font:bold"></asp:Label>
        <asp:Button ID="getid" runat="server" OnClick="getsid" Text="Get ID" />
           <!-- <asp:Label ID="check" runat="server" Text="we"></asp:Label>
            <asp:Label ID="check2" runat="server" Text="our"></asp:Label>
            <asp:Label ID="hell" runat="server" Text="wow"></asp:Label>-->
        </div>
      
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
