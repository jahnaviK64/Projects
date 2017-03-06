<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Presentations.aspx.cs" Inherits="Presentations" %>

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
   <li ><a href='Userhome.aspx'>Home</a></li>
   <li class='active'><a href='Presentations.aspx'>Presentations</a></li>
   <li><a href='Group.aspx'>Group</a></li>
       <asp:Label ID="username" Text="no" runat="server" CssClass="welcome" style="font-size:12px"/>

</ul>
          
</div><!--close menubar-->  
    </div><!--close header-->  
  </div><!--close header_container-->  
  <div id="main">
	<div id="site_content" style="min-height:700px;height:auto;overflow-x:auto">
         <asp:Label runat="server" Text="" Visible="false" ID="deco"></asp:Label>
        <br />
      <center>  <asp:Label runat="server" Text="Student Presentation Details" style="font-family:cursive;color:cadetblue;font:bold;font-size:large"></asp:Label></center>	
	  <div id="firsttimeonly" runat="server">
            <!--<asp:Label ID="he" runat="server" Text="he"></asp:Label>
               <asp:Label ID="she" runat="server" Text="she"></asp:Label>-->

	       	<center> <asp:Button ID="getnumbers" runat="server" Text="Get Presentation Id " OnClick="getnumbersof" /></center>
      </div>
      <div id="display" runat="server">
           
	            <div id="content">
                    <asp:PlaceHolder ID = "PlaceHolder1" runat="server" />

                    <asp:PlaceHolder ID = "PlaceHolder2" runat="server" />
                    
	            </div><!--close site_content-->    
    </div>
    </div>

  </div>
  <div id="footer_container">     
	<div id="footer">
      <a href="http://sce.uhcl.edu/liaw/" target="_blank">Faculty Website</a> 
    </div><!--close footer-->
  </div><!--close footer_container-->  
    </form>
</body>
</html>
