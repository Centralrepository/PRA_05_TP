<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="error/admin_error_page.jsp"%>
<html>
<head>
<title>TwentyPlus</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <link rel="stylesheet" type="text/css" href="css/style_index.css">
 <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">

<link rel="stylesheet"	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" type="text/css" href="css/myStyles.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
* {
    margin: 0;
    padding: 0;
    font-family:serif;
}
/* MAIN SECTION */
#main {
background-color:blue;

    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    height: 100vh;
    color: #FFF;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    text-align: center;
    padding: 0 10px;
}
#main h1 {
    font-size: 55px;
}
#main p {
    font-size: 20px;
    margin: 15px;
}
.button {
    padding: 10px 15px;
    border: 1px solid #FFF;
    border-radius: 10px;
    text-decoration: none;
    color: #FFF;
    font-size: 20px;
}
.button:hover {
    color: #000;
    background-color: #FFF;
}
/* SECTION */
.section {
    padding: 50px 20px;
    text-align: center;
}
.section h2 {
    font-weight: 300;
    margin-bottom: 15px;
}
.light {
    color: #000;
    background-color: #F0F0F0;
}
.dark {
    background-color: #181818;
    color: #FFF;
}
/* PROJECTS */
#projects {
    background: url('https://image.ibb.co/jxcNrU/city.jpg');
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    height: 100vh;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    text-align: center;
    color: #FFF;
    padding: 0 10px;
}
#projects h1 {
    font-size: 45px;
}
#projects p {
    font-size: 20px;
    margin: 15px;
}
/* FOOTER */
#footer {
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    height: 100vh;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    text-align: center;
    color: #FFF;
    padding: 0 10px;
}
#footer h1 {
    font-size: 60px;
}
#footer #links {
    margin-top: 25px;
}
#footer i.fa {
    opacity: 0.8;
    margin: 20px 10px;
    border: 1px solid #FFF;
    border-radius: 50%;
    padding: 10px;
}
#footer i.fa:hover {
    color: #181818; 
    background-color: #FFF;
    opacity: 1;
}
@media(min-height: 540px) {
    #main,#projects,#footer {
        background-attachment: fixed;
    }
}



@import url(https://fonts.googleapis.com/css?family=PT+Sans+Caption:400,700);

form {
  border-top: 5px solid #01caa7;
  width: 552px;
  margin: 40px auto;
}

fieldset {
  margin: auto;
  width: 470px;
  height: auto;
  border: 1px solid #e5e5e5;
  border-top: 0px solid #e5e5e5;
  background: #fdfdfd;
  padding: 40px;
}

form div {
  padding: 0 0 40px 0;
}

form label {
  float: left;
  width: 200px;
  font-size: 1em;
  color: #111;
}

form label.mid {
  line-height: 40px;
}

form input, form select {
	border: 2px solid ;
	color: #000000;
	font-family: 'PT Sans Caption', sans-serif;
	font-size: 1em;
	font-weight: 400;
	height: 40px;
	margin: 0;
	padding: 0 10px;
	width: 240px;
 vertical-align: middle;
}

form input:hover, form select:hover, form textarea:hover {
	border: 2px solid #2b7b5c;
}

form input:focus, form select:focus, form textarea:focus {
  border-color: #2b7b5c;
  outline: none;
}

form select {
  float: left;
  margin-bottom: 40px;
  appearance: none;
  width: 260px;
  border-radius: 0;
}

form input.checkbox, form input.radio {
  margin: 0;
  padding: 2px 0;
  width: auto;
  height: auto;
}

form input.button {
  width: 270px;
  height: 40px;
  border: 0px solid #fff;
}

form textarea {
  width: 240px;
  height: 200px;
  padding: 10px;
  background: #01caa7;
	 border: 2px solid #fff;
	 color: #fff;
}

form input.submit { 
  float: left;
  margin-left: 200px;
  width: 100px;
  height: 40px;
}
form input.submit1 { 
  float: left;
  margin-left: 200px;
  width: 100px;
  height: 40px;
}



* {
	box-sizing: border-box;
}
body {
	font-family: 'Montserrat', sans-serif;
	line-height: 1.6;
	margin: 0;
	min-height: 100vh;
}
ul {
  margin: 0;
  padding: 0;
  list-style: none;
}



h2,
h3,
a {
	color: #34495e;
}

a {
	text-decoration: none;
}



.main-nav {
	margin-top: 5px;

}
.logo a,
.main-nav a {
	padding: 10px 15px;
	text-transform: uppercase;
	text-align: center;
	display: block;
}

.main-nav a {
	color: white;
	font-size: 20px;
}

.main-nav a:hover {
	color: orange;
}



.header {
	padding-top: .5em;
	padding-bottom: .5em;
	border: 1px solid #a2a2a2;
	background-color: #f4f4f4;
	-webkit-box-shadow: 0px 0px 14px 0px rgba(0,0,0,0.75);
	-moz-box-shadow: 0px 0px 14px 0px rgba(0,0,0,0.75);
	box-shadow: 0px 0px 14px 0px rgba(0,0,0,0.75);
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	height:65px;
}




@media (min-width: 769px) {
	.header,
	.main-nav {
		display: flex;
	}
	.header {
		flex-direction: column;
		align-items: center;
    	.header{
		width: 80%;
		margin: 0 auto;
		max-width: 1150px;
	}
	}

}

@media (min-width: 1025px) {
	.header {
		flex-direction: row;
		justify-content: space-between;
	}

}

@media (min-width: 1025px) {
	.header {
		flex-direction: row;
		justify-content: space-between;
	}

}

#lab_social_icon_footer {
  padding: 40px 0;
  background-color: rgb(14, 35, 44);
}

#lab_social_icon_footer a {
  color: orange;
}

#lab_social_icon_footer .social:hover {
  -webkit-transform: scale(1.1);
  -moz-transform: scale(1.1);
  -o-transform: scale(1.1);
}

#lab_social_icon_footer .social {
  -webkit-transform: scale(0.8);
  /* Browser Variations: */
  
  -moz-transform: scale(0.8);
  -o-transform: scale(0.8);
  -webkit-transition-duration: 0.5s;
  -moz-transition-duration: 0.5s;
  -o-transition-duration: 0.5s;
}
/*
    Multicoloured Hover Variations
*/

#lab_social_icon_footer #social-fb:hover {
  color: #3B5998;
}

#lab_social_icon_footer #social-tw:hover {
  color: #4099FF;
}

#lab_social_icon_footer #social-gp:hover {
  color: #d34836;
}

#lab_social_icon_footer #social-em:hover {
  color: #f39c12;
}
</style>
 
</head>
<body>
<%
	if(session.getAttribute("isEnabled")!=null){
		response.sendRedirect("adminhome.jsp");
	}
%>
<%
	if(session.getAttribute("enabled")!=null){
		response.sendRedirect("user.jsp");
	}
%>
<nav class="navbar" style="background-color:#1E90FF;">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#" style="color:white;font-size:22px">TwentyPlus</a>
    </div>
    <ul class="nav navbar-nav navbar-right" style="color:white">
       <li><a href="admin_login.jsp" style="color:white;background-color:#1E90FF;text-decoration:none;"><span class="glyphicon glyphicon-user"></span> Admin Login</a></li>
    </ul>
  </div>
</nav> 

<div id="main" style="margin-top:-20px">
        <h1 style="margin-top:-180px">Welcome to TwentyPlus</h1><br/>
        <div>
        <center>
        <h3 style="color:white">Success usually comes to those who are too busy to be looking for it.</h3>
 		</center>
        </div>
        <br/>
		<div>
		<a href="#section2"><input style="width:120px; padding:5px; cursor: pointer; box-shadow: 6px 6px 5px; #999; -webkit-box-shadow: 6px 6px 5px #999; -moz-box-shadow: 6px 6px 5px #999; font-weight: bold; background: #ffff00; color: #000; border-radius: 10px; border: 1px solid #999; font-size: 150%;float:right" type="button" value="Ask Help"></a>
		</div>
        </div>
	 <div class = "section light" id="section2">
          <div class="boxpattenbg">
    <div class="boxpattentitlesbg">
        <div class="pagewidth">
            <div class="padding30">
			<div class="ourtitlestext" style="font-size:25px">Our HelpDesk</div>
				<div style="text-align: center;"><img src="theme/GreenGlory/img/boredrtitarrow.png" alt=""/></div>
            </div>
        </div>
    </div>
    
    <div class="pagewidth" >
    <div class="padding30" style="text-align: center; padding-top: 45px;background-color:#f0f2f8;color:black" >
        <div class="container-fluid">
        <div class="row">
            
            <div class="col-sm-12 col-md-12" >
                <div class="table-responsive table-bordered table-dark" >          
    <table class="table" id="example">
    <thead>
      
        <tr style="background-color:#e9a620;color=#fff;"> 
            <td><strong><font color="#fff">Sr.No</font></strong></td>
            <td><strong><font color="#fff">User Id</font></strong></td>
            <td><strong><font color="#fff">Date</font></strong></td>
            <td><strong><font color="#fff">User Name</font></strong></td>
            <td><strong><font color="#fff">Address</font></strong></td>
            <td><strong><font color="#fff">Purpose</font></strong></td>
        <td><strong><font color="#fff">Estimation Amount</font></strong></td>
            
        </tr>  
    </thead>
   <tbody>
    
    	<tr > 
        <td style="padding-top:50px;">1</td>
            <td style="padding-top:50px;"> G75433</td>
           <td style="padding-top:50px;">&nbsp;&nbsp; 2018-11-08 &nbsp;&nbsp;&nbsp;&nbsp;21:07:27</td>
            <td style="padding-top:50px;">Pradnyankur Bhimrao Waghmare</td>
            <td style="padding-top:50px;">At Sungaguda Post Singarwadi Tq Kinwat Dist Nanded</td>
            <td style="padding-top:50px;">Hospital & Medicine</td>
            <td style="padding-top:50px;">200000</td>
        </tr> 
       
        
        <tr > 
        <td style="padding-top:50px;">2</td>
           <td style="padding-top:50px;"> G32862</td>
           <td style="padding-top:50px;s;">&nbsp;&nbsp; 2018-09-28 &nbsp;&nbsp;&nbsp;&nbsp; 12:00:00</td>
            <td style="padding-top:50px;">Kalluri Appa Rao</td>
            <td style="padding-top:50px;">F 2 Balagi Appt. Laxmipuram 3 rd Line Ashok Nagar Guntur (A.P.)</td>
            <td style="padding-top:50px;">Hospital Bill & Medicine</td>
            <td style="padding-top:50px;">400000</td>
        </tr> 
       
           </tbody>
  </table>

            </div>
</div></div></div></div></div></div>
</div><br/>
<div style="margin-top:-22px;height:40px;background-color:rgb(14, 35, 44)">
<section id="lab_social_icon_footer">
<!-- Include Font Awesome Stylesheet in Header -->
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<div>
        <div class="text-center center-block">
               <!--<a href="https://www.facebook.com/bootsnipp"><i id="social-fb" class="fa fa-facebook-square fa-3x social"></i></a>
	            <a href="https://twitter.com/bootsnipp"><i id="social-tw" class="fa fa-twitter-square fa-3x social"></i></a>
	            <a href="https://plus.google.com/+Bootsnipp-page"><i id="social-gp" class="fa fa-google-plus-square fa-3x social"></i></a>
	            <a href="mailto:#"><i id="social-em" class="fa fa-envelope-square fa-3x social"></i></a>
    --> 
    
    </div>
    <div class="footer-copyright text-center py-3" style="color:white">© 2018 Copyright:
      <a href="<%=request.getScheme()+"://"+request.getServerName()+"/"%>" style="color:white;"><%out.println(request.getServerName());%></a>
    </div>
</div>
</section></div>
</body>
</html>
