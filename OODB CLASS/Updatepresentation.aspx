<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Updatepresentation.aspx.cs" Inherits="Updatepresentation" %>

                   
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
                    <li class='active'><a href='Update.aspx'>Update</a></li>
                    <li><a href='View.aspx'>View</a></li>
   
                    </ul>
                    </div><!--close menubar-->  
                    </div><!--close header-->  
                    </div><!--close header_container-->  
                    <div id="main">
                    <div id="site_content">

                    <table width="50%" style="border: 2px  solid black; border-radius: 10px; margin-top:30px;">
                    <tr>
                    <td colspan="3">
                    <asp:Label ID="lblStatus" runat="server" /></td>
                    </tr>
                    <tr>
                    <th width="15%" style="text-align: left">Month</th>
                    <th width="15"><center>:</center></th>
                    <td>
                    <asp:TextBox ID="dat" runat="server"/></td>
                    </tr>
                    <tr>
                        <tr>
                    <th width="15%" style="text-align: left">Date</th>
                    <th width="15%"><center>:</center></th>
                    <td>
                    <asp:TextBox ID="day" runat="server"/></td>
                    </tr>
                    <th style="text-align: left">Chapter</th>
                    <th>:</th>
                    <td>
                    <asp:TextBox ID="chapter" runat="server"/></td>
                    </tr>
                    <tr>
                    <th style="text-align: left">Topic</th>
                    <th>:</th>
                    <td>
                    <asp:TextBox ID="topic" runat="server" Textmode="MultiLine"/></td>
                    </tr>
                    <tr>
                    <th style="text-align: left">Page</th>
                    <th>:</th>
                    <td>
                    <asp:TextBox ID="pg" runat="server" /></td>
                    </tr>
                    <tr>
                        
                    <td colspan="2"></td>
                    <td>
                    <asp:Button class= "upcanbutton" ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" CssClass="upcanbutton" />
                    &nbsp;
                    <asp:Button class="upcanbutton" ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" CssClass="upcanbutton"/>

                    </td>
                    </tr>

                    </table>

                    <div id="content">
                    </div><!--close content-->
                    </div><!--close site_content-->    
                    </div><!--close main--> 
       
              

        
                    <div id="footer_container">     
                    <div id="footer">
                    <a href="http://sce.uhcl.edu/liaw/">My Website</a> 
                    </div><!--close footer-->
                    </div><!--close footer_container-->  
                    </form>
                    </body>
                    </html>


