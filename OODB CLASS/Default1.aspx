
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default1.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/loginstyle.css" />
    <link rel="stylesheet" type="text/css" href="css/font-awesome.css" />
 <link rel="shortcut icon" href="../favicon.ico"> 
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
</head>
<body>
   
    <div class="container">
<header>
 <div id="logo">
        <div id="logo_text">
          <!-- class="logo_colour", allows you to change the colour of the text -->
          <h1><a href="Default.aspx">Class &nbsp<span class="logo_colour">Schedule System</span></a></h1>
          <h2>Schedule Your Class</h2>
        </div>
      </div>
</header>
        
<section class="main">
    <form class="form-1" runat="server">
   <p class="field">
       
                        <asp:TextBox ID="login" runat="server" placeholder="Blackboard UserName" > </asp:TextBox>
						
						<i class="icon-user icon-large"></i>
					</p>
						<p class="field">
                            <asp:TextBox ID="password" runat="server" TextMode="Password" placeholder="Studentid/Admin password"></asp:TextBox>
							<i class="icon-lock icon-large"></i>
					</p>
               <p class="fields">
            <asp:DropDownList ID="ddlclass" runat="server" Width="230px" border="none">
                <asp:ListItem Text="Select your Class" Value="0"></asp:ListItem>
                <asp:ListItem Text="5433_1" Value="1"></asp:ListItem>
                <asp:ListItem Text="5433_2"  Value="2"></asp:ListItem>
            </asp:DropDownList>
            <i class="icon-arrow-right icon-large"></i>
        </p>
					<p class="submit">
						
                    <button type="submit" name="submit" runat="server" onserverclick="submiteventbutton"><i class="icon-arrow-right icon-large"></i></button>					</p>
   <asp:Label ID="check" runat="server"></asp:Label>
       
         </form>
       <center>  <asp:Label ID="dong" Text="" runat="server" style="color:red"></asp:Label></center>
    </section>
			</div> 
</body>
</html>
