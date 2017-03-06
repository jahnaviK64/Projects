<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Userhome.aspx.cs" Inherits="Userhome" %>

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
<h1><a href="http://prtl.uhcl.edu/portal/page/portal/HOMEPAGE" target="_blank"><img border="0" alt="W3Schools" src="images/logo.png" width="50" height="50"></a> UHCL</h1>
	 
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
            <div id="captioned-gallery">
	<figure class="slider">
		<figure>
			<img src="images/welcome.jpg" height="400" alt>
			<figcaption>Welcome to UHCL</figcaption>
		</figure>
		<figure>
			<img src="images/numbers.jpg" height="400" alt>
			<figcaption>Get Presentation ID</figcaption>
		</figure>
		<figure>
			<img src="images/presentation.jpg" height="400"alt>
			<figcaption>View Presentation Details</figcaption>
		</figure>
		<figure>
			<img src="images/group.jpg" height="400" alt>
			<figcaption>Select Group</figcaption>
		</figure>
		<figure>
			<img src="images/groupdetails.jpg" height="400" alt>
			<figcaption>View Group Details</figcaption>
		</figure>
	</figure>
</div>
            <div>
                <br />
             <center>   <u style="color:cadetblue"><asp:Label runat="server" Text="Presentation details" style="font-family:cursive;color:cadetblue;font:bold;font-size:large"></asp:Label></u>
               <ul style="list-style-type:none"><li style="font-family:cursive;color:black;font:bold 14px">
                      Presentation Id:<asp:Label ID="myid" Text="" runat="server" style="font-family:cursive;color:black;font:bold 14px"> </asp:Label>
                </li>
                    <li style="font-family:cursive;color:black;font:bold 14px">
                        Date:<asp:Label ID="dat" Text="" runat="server" style="font-family:cursive;color:black;font:bold 14px"> </asp:Label>
                    </li>
                    <li style="font-family:cursive;color:black;font:bold 14px">
                        Chapter:<asp:Label ID="ch" Text="" runat="server" style="font-family:cursive;color:black;font:bold 14px"> </asp:Label>
                    </li>
                    <li style="font-family:cursive;color:black;font:bold 14px">
                        Topic:<asp:Label ID="topic" Text="" runat="server" style="font-family:cursive;color:black;font:bold 14px"> </asp:Label>
                    </li>
                    <li style="font-family:cursive;color:black;font:bold 14px">
                        Page:<asp:Label ID="pg" Text="" runat="server" style="font-family:cursive;color:black;font:bold 14px"> </asp:Label>
                    </li>
                </ul></center>

              <%-- <center> <asp:Label ID="myid" Text="my pid" runat="server" style="font-family:cursive;color:black;font:bold 14px"> </asp:Label><br /></center>
                <center><asp:Label ID="mypres" Text="mypresentation is on" runat="server" style="font-family:cursive;color:black;font:bold 14px"></asp:Label></center>--%>
            </div>
	    </div> <!--close site_content-->    
  </div> <!--close main--> 
  <div id="footer_container">     
	<div id="footer">
      <a href="http://sce.uhcl.edu/liaw/" target="_blank">Faculty Website</a> 
    </div><!--close footer-->
  </div><!--close footer_container-->  
    </form>
</body>
</html>
