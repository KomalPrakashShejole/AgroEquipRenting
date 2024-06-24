<%@ page import = "com.r3sys.project.*" %>
<%@ page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<link href='//fonts.googleapis.com/css?family=Work+Sans:400,500,600' rel='stylesheet' type='text/css'>
<!--static chart-->
</head>
<body>	
<div class="login-page">
    <div class="login-main">  	
    	 <div class="login-head">
				<h1>Delete</h1>
			</div>
			 <%
     try
   
     {
       int prodid =Integer.parseInt(request.getParameter("prodid"));
       Connection con=ConnectDB.connect();
       PreparedStatement ps1=con.prepareStatement("delete from product_tbl where prodid=?");
       ps1.setInt(1,prodid);
       int i =ps1.executeUpdate();
       if(i>0)
       {
    	   response.sendRedirect("adminpanel.html");
       }
       else
       {
    	   response.sendRedirect("failed.html");
       }
       
     }
     catch(Exception e)
     {
    	 e.printStackTrace();
     }

      %>
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
    