<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Group.aspx.cs" Inherits="Group" %>

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
<h1><a href="http://prtl.uhcl.edu/portal/page/portal/HOMEPAGE" target="_blank"><img border="0" alt="W3Schools" src="imm/logo.png" width="50" height="50"></a> UHCL</h1>
	 
      </div><!--close banner-->
        	 <asp:Button runat="server"  ID="loout" Text="log out" OnClick="buttonclick"/> 
	  <!--<div id="banner_slogan">
	  </div><!--close banner_slogan-->	
      <div id='cssmenu'>
<ul>
   <li ><a href='Userhome.aspx'>Home</a></li>
   <li ><a href='Presentations.aspx'>Presentations</a></li>
   <li class='active'><a href='Group.aspx'>Group</a></li>
       <asp:Label ID="username" Text="no" runat="server" CssClass="welcome" style="font-size:12px"/>

</ul>
          
</div><!--close menubar-->  
    </div><!--close header-->  
  </div><!--close header_container-->  
  <div id="main">
	<div id="site_content" style="min-height:700px;height:auto;overflow-x:auto">	
	  <center><img src="images/studentgroup.jpg" style="width:70%;height:400px" /></center>
	 <div id="run">
         
         <asp:Label runat="server" Text="oy" ID="oy" Visible="false"></asp:Label>
         <br />
           <center> <asp:Button ID="grpinfo" runat="server" Text="Select Group" OnClick="showgrpdetails" style="font-family:cursive;color:cadetblue;font:bold"/></center>
           <center> <asp:Label ID="infogrp" runat="server" Text="groups" Visible="false" style="font-family:cursive;color:cadetblue;font:bold"></asp:Label><br /></center>
           <center> <asp:Label ID="grpsizeinfo" runat="server" Text="no.of grps" Visible="false" style="font-family:cursive;color:cadetblue;font:bold"></asp:Label><br /></center>
            <center><asp:Label ID="te" runat="server" Text="Choose the group ID and fill it in the text box below" Visible="false" style="font-family:cursive;color:cadetblue;font:bold"></asp:Label></center><br />
            <center><asp:TextBox ID="grpnumber" runat="server"  Visible="false"></asp:TextBox></center><br />
            <center><asp:Button ID="selctgrp" runat="server" Text="Submit" cssclass="upcanbutton" OnClick="selectthegrp" Visible="false"/></center>
           <center> <asp:Label ID="show" runat="server" style="font-family:cursive;color:cadetblue;font:bold"></asp:Label></center><br/>
        </div><div id="up" runat="server">
           
          <center><table border="0"><tr><td style="font-family:cursive;color:cadetblue;font:bold;cell-spacing:2px">Enter any group number</td><td cell-spacing="2"> <asp:TextBox ID="grpdetai"  runat="server" Height="23px" Width="77px"></asp:TextBox></td>
           <td cell-spacing="2"><asp:Button ID="s" Text="submit" runat="server" CssClass="upcanbutton" OnClick="showupp" /></td> </tr></table></center>
              </div>
        <div id="display" runat="server">
            <asp:Label runat="server" Text="" Visible="false" ID="deco"></asp:Label>
	            <div id="content">
                    <asp:PlaceHolder ID = "PlaceHolder1" runat="server" />
                    <br />
                    <asp:PlaceHolder ID = "PlaceHolder2" runat="server" />
                    <br />
	            </div><!--close site_content-->    
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
