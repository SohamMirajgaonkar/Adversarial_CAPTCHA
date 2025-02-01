<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.connection.DBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Random"%>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Adversarial CAPTCHAs</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Dewi - v4.9.0
  * Template URL: https://bootstrapmade.com/dewi-free-multi-purpose-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->

<style type="text/css">
#contact .btn-get-started {
  font-family: "Open Sans", sans-serif;
  text-transform: uppercase;
  font-weight: 500;
  font-size: 14px;
  display: inline-block;
  padding: 10px 35px 10px 35px;
  border-radius: 4px;
  transition: 0.5s;
  color: #fff;
  background: #ff4a17;
  border: 2px solid #ff4a17;
}


</style>
<script type="text/javascript">
var count=0,chkfn=null;
function changeColor() {
// Call function with 1000 milliseconds gap
chkfn = setInterval(starttimer, 1000);
}
function starttimer() {
count += 1;
var oElem = document.getElementById("divtxt");
oElem.style.color = oElem.style.color == "red" ? "blue" : "red";
document.getElementById("pcount").innerHTML = "Your Time Starts: " + count;
}
function stoptimer() {
clearInterval(chkfn);
chkfn = null;
count = 0;
document.getElementById("pcount").innerHTML = '';
}
var shapeCount=0;
</script>
</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top" style="background-color:gray;">
    <div class="container d-flex align-items-center justify-content-between">

      <h1 class="logo"><a href="">Adversarial CAPTCHAs</a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav id="navbar" class="navbar">
       <ul>
          <li><a class="nav-link scrollto active" href="">Home</a></li>
          <li><a class="nav-link scrollto" href="About.jsp">About</a></li>
          <li><a class="nav-link scrollto" href="StudentLogin.jsp">User</a></li>
          <li><a class="nav-link scrollto " href="StaffLogin.jsp">Staff</a></li>
          <li><a class="nav-link scrollto " href="AdminLogin.jsp">Admin</a></li>
         
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->



      <br><br><br><br><br>
<!-- ======= Contact Section ======= -->
    <section id="contact" class="contact">
      <div class="container">

        <div class="section-title">
          <h2 style="font-size:22px;"><span>Login</span> Here</h2>
          
        </div>
 
        <div class="row">
       <div class="col-lg-6">
         <form action="UserOtpController" method="post" class="formone">
          <div class="row">           
           
            <div class="form-group mt-1">
              <input type="text" class="form-control" name="genotp" id="email" placeholder="OTP" required>
            </div>
           
          </div>
          <br>
          <%
					
					Random rand=new Random();
					String sql1="Select max(id) from tblCaptcha";
					int maxID=0;
					try{
						PreparedStatement pstmt1 = DBConnection.getConnection().prepareStatement(sql1);
						ResultSet rs1=pstmt1.executeQuery();
						if(rs1.next()){
							maxID=rs1.getInt(1);
						}
					}catch(Exception e){
						e.printStackTrace();
					}
					int val=rand.nextInt(maxID);
					if (val==0)
						val=1;
					final  int countClick=0;
					int countSymbol=0;;
					
					String sql="Select * from tblShape where captchaid=?";
					try{
						PreparedStatement pstmt = DBConnection.getConnection().prepareStatement(sql);
						pstmt.setInt(1, val);
						ResultSet rs=pstmt.executeQuery();
						while(rs.next()){
							
							countSymbol++;
							%>
							 <div class="form-group">
						<label>Click <%=rs.getString(2) %></label>
						
						<img alt="Captcha1" src="captcha1.jsp?shapeId=<%=rs.getInt(1)%>&capId=<%=rs.getInt(9)%>" usemap="#captchamap<%=rs.getInt(1)+""+rs.getInt(9)%>">
						<% if(rs.getString(2).equals("Circle")){ 
							String coord=rs.getString(3);
							coord=coord.replace("(", "").replace(")","");
							String s1[]=coord.split(",");
							int s2=Integer.parseInt(s1[2]);
							s2=(s2/2);
							coord=s1[0]+","+s1[1]+","+s2;							
						%>
						<map name="captchamap<%=rs.getInt(1)+""+rs.getInt(9)%>"><area class="blue" shape="circle" coords="<%=coord %>" href="#" onclick="getValidate()"></map>
						<%}else if(rs.getString(2).equals("Rectangle")){ 
							String coord=rs.getString(3);
							coord=coord.replace("(", "").replace(")","");													
						%>
						<map name="captchamap<%=rs.getInt(1)+""+rs.getInt(9)%>"><area shape="poly" class="red" coords="<%=coord %>" href="#" onclick="getValidate()"></map>
						<%}else if(rs.getString(2).equals("Triangle")||rs.getString(2).equals("Pentagon")||rs.getString(2).equals("Hexagon")||rs.getString(2).equals("Star")||rs.getString(2).equals("Octagon")){ 
							String coord=rs.getString(3);
							coord=coord.replace("(", "").replace(")","");
													
						%>
						<map name="captchamap<%=rs.getInt(1)+""+rs.getInt(9)%>"><area class="yellow" shape="poly" coords="<%=coord %>" href="#" onclick="getValidate()"></map>
						<%}%>
						</div>
						
							<%
							
						}%>
						<script type="text/javascript">
						shapeCount=<%=countSymbol%>
						</script>
						<%
					}catch(Exception e){
						e.printStackTrace();
					}
					%>
       <div class="text-center"><button type="submit" class="btn-get-started">Login</button>
     
       </div>
        </form>
</div>
 <div class="col-lg-6">
 <img src="assets/img/user.jpg" class="img-fluid" alt="" width="400px" height="200px">
 </div>
</div>
      </div>
    </section><!-- End Contact Section -->



  <div id="preloader"></div>
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>
<script type="text/javascript">
var timeCount=0;
$(document).ready(function() {
    console.log( "ready!" );
    changeColor();
});
function getValidate(){
	var email=document.getElementById("email").value;
	var password=document.getElementById("password1").value;
	$(".yellow").click( function(event){
	    timeCount++;
	});
	$(".blue").click( function(event){
	    timeCount++;
	});
	$(".red").click( function(event){
	    timeCount++;
	});
	if(count>=60){
		stoptimer();
		alert("Invalid Captcha...Please try again...");
		document.location.reload();
	}
	
}
function validateUser(){
	if((shapeCount==timeCount)||(timeCount>=3)){
		 document.location.href="UserLoginController?email="+email+"&password1="+password;
		/* $.ajax({
			  method: "POST",
			  url: "/UserLoginController",
			  data: { username: "email", password: "password1" }
			})
			.success(function(){
			  //do success stuff
			})
			.error(function(){
			  //do error handling stuff
			}); */
	}else{
		/* alert("Invalid User...Please try again...");
		document.location.reload(); */
	}
}

</script>
</body>

</html>