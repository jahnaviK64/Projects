<%@ Page Language="C#" AutoEventWireup="true" CodeFile="View.aspx.cs" Inherits="View" %>


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
        	 <asp:Button runat="server"  ID="loout" Text="log out" OnClick="loout_Click"/> 
	  <!--<div id="banner_slogan">
	  </div><!--close banner_slogan-->	
        <div id='cssmenu'>	
      <ul>
   <li ><a href='Myhome.aspx'>Home</a></li>
   <li><a href='Updatehome.aspx'>Update</a></li>
   <li class='active'><a href='View.aspx'>View</a></li>
   
</ul></div><!--close menubar-->  
    </div><!--close header-->  
  </div><!--close header_container-->  
  <div id="main">
	<div id="site_content" style="min-height:700px;height:auto;overflow:auto">	
        <asp:Label runat="server" Text="" Visible="false" ID="deco"></asp:Label>
	  <div id="content">
      <asp:PlaceHolder ID = "PlaceHolder1" runat="server" />
     <br />
 <asp:PlaceHolder ID = "PlaceHolder2" runat="server" />
          <br />
          <%--<asp:LinkButton ID="class1" runat="server" OnServerClick="Page_Load" >Click here to view details of class 1</asp:LinkButton> <br /> <br />
          <asp:LinkButton ID="class2" runat="server" OnServerClick="Page_Load">Click here to view details of class 2</asp:LinkButton>--%>
          <%--dropdown and label

          <asp:Label ID="Label1" runat="server" Text="Select Section to view details:"></asp:Label>
&nbsp;<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" Height="19px" Width="75px">
          </asp:DropDownList>--%>
          
          <%--//tabel--%>
           <%-- <table> 
            <tr style="text-align:center; padding:2px;">
            <td style="text-align:center; padding:2px;">
        </td>
        </tr>
        </table> --%>

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
