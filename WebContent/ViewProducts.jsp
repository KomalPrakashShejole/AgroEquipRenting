<%@ page import = "com.r3sys.project.*" %>
<%@ page import = "java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Login Page</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Shoppy Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
<!-- Custom Theme files -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
<!--js-->
<script src="js/jquery-2.1.1.min.js"></script> 
<!--icons-css-->
<link href="css/font-awesome.css" rel="stylesheet"> 
<!--Google Fonts-->
<link href='//fonts.googleapis.com/css?family=Carrois+Gothic' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Work+Sans:500,600,700' rel='stylesheet' type='text/css'>
<!--static chart-->
</head>
<body>	
<div class="login-page">
    <div class="login-main">  	
    	 <div class="login-head">
				<h1>My Products</h1>
			</div>
			<div class="login-block">
				<table class="table table-hover">
                                  <thead>
                                    <tr>
                                    <th>PID</th> 
                                      <th>Email</th> 
                                      <th>Product Name</th>                     
                                        <th>Price/Month</th>
                                      <th>Deposit</th>     
                                       <th>Action</th>                                   
                                  </tr>
                              </thead>
         <%
 
    try
    {
    	Connection con = ConnectDB.connect();
    	String email = Mail.getEmail();
    	PreparedStatement ps1 = con.prepareStatement("select * from product_tbl where email=? ");
    	ps1.setString(1,email);
    	ResultSet rs1 = ps1.executeQuery();
    	while(rs1.next())
    	{
     %>	
             <tbody>
              <tr>
               <td><%=rs1.getString("prodid") %></td>
         <td><%=rs1.getString("email") %></td>
         <td><%=rs1.getString("prodname") %></td>
        <td><%=rs1.getString("price") %></td>
        <td><%=rs1.getString("deposit") %></td>
          <td><a href="Delete.jsp?prodid=<%=rs1.getString("prodid")%>">Delete</a></td>
         
      </tr>
           <% 
    	}
    }
    catch(Exception e)
    {
    	e.printStackTrace();
    }
    %>
                             
                          </tbody>
                      </table>
				
				
			</div>
      </div>
</div>
<!--inner block end here-->
<!--copy rights start here-->
<div class="copyrights">
	 <p>© 2023 Rent-O-Palace. All Rights Reserved | Design by  <a href="http://rent-o-palace.com/" target="_blank">Rent-O-Palace</a> </p>
</div>	
<!--COPY rights end here-->

<!--scrolling js-->
		<script src="js/jquery.nicescroll.js"></script>
		<script src="js/scripts.js"></script>
		<!--//scrolling js-->
<script src="js/bootstrap.js"> </script>
<!-- mother grid end here-->
</body>
</html>
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 