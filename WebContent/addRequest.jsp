<%@ page import = "com.r3sys.project.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.time.format.DateTimeFormatter" %>
<%@ page import = "java.time.LocalDateTime" %>
  


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Request</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Rent-O-Palace Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
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
<!--//skycons-icons-->
</head>
<body>	
<div class="page-container">	
   <div class="left-content">
	   <div class="mother-grid-inner">
            <!--header start here-->
				<div class="header-main">
					<div class="header-left">
							<div class="logo-name">
									 <a href="index.html"> <h1>Rent-O-Palace</h1> 
									<!--<img id="logo" src="" alt="Logo"/>--> 
								  </a> 								
							</div>
							
							<div class="clearfix"> </div>
						 </div>
						 <div class="header-right">
							<div class="profile_details_left">
							
												</div> 
											</li>
										</ul>
									</li>	
								</ul>
								<div class="clearfix"> </div>
							</div>
							<!--notification menu end -->
							<div class="profile_details">		
								<ul>
									<li class="dropdown profile_details_drop">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
											<div class="profile_img">	
												<span class="prfil-img"><img src="images/p1.png" alt=""> </span> 
												<div class="user-name">
													<p>User</p>
													<span>rent-o-palace</span>
												</div>
												<i class="fa fa-angle-down lnr"></i>
												<i class="fa fa-angle-up lnr"></i>
												<div class="clearfix"></div>	
											</div>	
										</a>
										<ul class="dropdown-menu drp-mnu">
											<li> <a href="#"><i class="fa fa-cog"></i> Settings</a> </li> 
											<li> <a href="#"><i class="fa fa-user"></i> Profile</a> </li> 
											<li> <a href="#"><i class="fa fa-sign-out"></i> Logout</a> </li>
										</ul>
									</li>
								</ul>
							</div>
							<div class="clearfix"> </div>				
						</div>
				     <div class="clearfix"> </div>	
				</div>
<!--heder end here-->
<!-- script-for sticky-nav -->
		<script>
		$(document).ready(function() {
			 var navoffeset=$(".header-main").offset().top;
			 $(window).scroll(function(){
				var scrollpos=$(window).scrollTop(); 
				if(scrollpos >=navoffeset){
					$(".header-main").addClass("fixed");
				}else{
					$(".header-main").removeClass("fixed");
				}
			 });
			 
		});
		</script>
		<!-- /script-for sticky-nav -->
<!--inner block start here-->

<head>  
    <title>table</title>  
    <style>  
        table{  
            border-collapse: collapse;  
            width: 80%;   
        }  
    th,td{  
        border: 2px solid black;   
        padding: 15px;  
    }  
               
    </style>  
  </head>  
<body>  
  <table>  
    <tr>  
        <th>PID</th>  
        <th>Product Name</th>
        <th>Email</th>
        <th>date</th>  
        <th>Status</th>  
         
    </tr>  
     
     
     <%
	
try		 
{
	 String status="pending";
	 
	 DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");  
	   LocalDateTime now = LocalDateTime.now();  
	   System.out.println(dtf.format(now));  
	 
	 String prodname = request.getParameter("prodname");

int prodid =Integer.parseInt(request.getParameter("prodid"));
Connection con=ConnectDB.connect();
PreparedStatement ps=con.prepareStatement("select * from product_tbl where prodid=?");
ps.setInt(1,prodid);
ResultSet rs1 = ps.executeQuery();
if(rs1.next())
{
   int i=rs1.getInt("prodid");
   String email=rs1.getString("email");
   PreparedStatement ps1 = con.prepareStatement("insert into order_tbl values(?, ?, ?, ?, ?, ?)");
	
	ps1.setInt(1,0);
	ps1.setInt(2,i);
	ps1.setString(3,email);
	ps1.setString(4,dtf.format(now));
	ps1.setString(5,Mail.getEmail());
	ps1.setString(6,status);
	int p = ps1.executeUpdate();
	if(p>0)
	{
		response.sendRedirect("viewMyRequest.jsp");
	}
}
}
catch(Exception e)
{
	e.printStackTrace();
}

   %>
</table>  
</body>  
</html>
</div>
<!--inner block end here-->
<!--copy rights start here-->
<div class="copyrights">
	
</div>	
<!--COPY rights end here-->
</div>
</div>

<script>
var toggle = true;
            
$(".sidebar-icon").click(function() {                
  if (toggle)
  {
    $(".page-container").addClass("sidebar-collapsed").removeClass("sidebar-collapsed-back");
    $("#menu span").css({"position":"absolute"});
  }
  else
  {
    $(".page-container").removeClass("sidebar-collapsed").addClass("sidebar-collapsed-back");
    setTimeout(function() {
      $("#menu span").css({"position":"relative"});
    }, 400);
  }               
                toggle = !toggle;
            });
</script>
<!--scrolling js-->
		<script src="js/jquery.nicescroll.js"></script>
		<script src="js/scripts.js"></script>
		<!--//scrolling js-->
<script src="js/bootstrap.js"> </script>
<!-- mother grid end here-->
</body>
</html>


                      
						
