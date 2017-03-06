<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Update.aspx.cs" Inherits="Update" %>
   

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
    <div id="site_content" style="min-height:700px;height:auto;overflow-x:auto">	
     <br />
        
  <table> <tr><td><asp:Label runat="server" Text="Class ID:" Font-Size="small" style="font-family:cursive;color:cadetblue;font:bold"></asp:Label>
                   <asp:Label runat="server" ID="selectclass" style="font-family:cursive;color:cadetblue;font:bold"></asp:Label></td></tr></table>
        <br />

    <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand" OnItemDataBound="Repeater1_ItemDataBound">

    <HeaderTemplate>

    <table class="updatetable" cellpadding="1" cellspacing="1" border="1">
    <tr>
    
    <th text-align="center">P.Id</th>
    <th text-align="center">Chapter</th>
    <th text-align="center">Topic</th>
    <th text-align="center">Month</th>
    <th text-align="center">Date</th>
    <th text-align="center">Page</th>
    <th text-align="center">Modify</th>

</tr>


    
    </HeaderTemplate>
    <ItemTemplate>
    
    <tr>
    <td style="text-align:center"><%# Eval("sno") %></td>
    <td style="text-align:center"><%# Eval("chapter") %></td>
    <td style="text-align:center"><%# Eval("section") %></td>
    <td style="text-align:center"><%# Eval("day") %></td>
    <td style="text-align:center"><%# Eval("date") %></td>
    <td style="text-align:center"><%# Eval("page") %></td>
    <td><center><asp:Button class="upcanbutton" ID="btnEdit" runat="server" Text="Edit" CommandName="Edit"  Width="75" CommandArgument='<%# Eval("sno") %>'/>&nbsp;<asp:Button class="upcanbutton" ID="btnDelete" runat="server" Text="Delete" CommandName="Delete" Width="75" OnClientClick="return confirm('Are you sure? Do you want to delete the record?');" CommandArgument='<%# Eval("sno") %>' /></center></td></tr>
    </ItemTemplate>
    <AlternatingItemTemplate>
    <tr>
    <td style="text-align:center"><%# Eval("sno") %></td>
    <td style="text-align:center"><%# Eval("chapter") %></td>
   <td style="text-align:center"><%# Eval("section") %></td>
    <td style="text-align:center"><%# Eval("day") %></td>
    <td style="text-align:center"><%# Eval("date") %></td>
    <td style="text-align:center"><%# Eval("page") %></td>
    <td><center><asp:Button cssclass="upcanbutton" ID="btnEdit" runat="server" Text="Edit" CommandName="Edit" Width="75" CommandArgument='<%# Eval("sno") %>' />&nbsp;<asp:Button cssclass="upcanbutton" ID="btnDelete" runat="server" Text="Delete" CommandName="Delete" Width="75" OnClientClick="return confirm('Are you sure? Do you want to delete the record?');" CommandArgument='<%# Eval("sno") %>' /></center></td></tr>
    </AlternatingItemTemplate> <FooterTemplate></table></FooterTemplate>                                        
    </asp:Repeater> 
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
