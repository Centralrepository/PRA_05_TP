<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="error/user_error_page.jsp"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css/myStyles.css">
<style>


/*body
    {
    width: 100%;
    height: 100%;
    background-image:url(https://twimg0-a.akamaihd.net/a/1350072692/t1/img/front_page/jp-mountain@2x.jpg);
    background-size: cover;
    background-attachment:fixed;
    margin: 0;
    padding: 0;
    }
*/
/* ========== DEMO STYLES ========== */
@font-face {
  font-family:serif;
  font-style: normal;
  font-weight: 400;
  src: local('Open Sans'), local('OpenSans'), url(http://themes.googleusercontent.com/static/fonts/opensans/v6/cJZKeOuBrn4kERxqtaUH3T8E0i7KZn-EPnyo3HZu7kw.woff) format('woff');
}

/* ===== Demo Styles ===== */
.infobox{
  font-family:serif;
  font-weight: 400;
  font-size: 14px;
  color: #323232;
  width: 400px;
  height: 600px;
  margin: 5% auto;
  padding: 10px;
  border: 1px solid #D3D3D3;
  border-radius: 15px;
  -webkit-box-shadow:  0px 0px 10px 0px #f5f5f5;
  box-shadow:  0px 0px 10px 0px #f5f5f5;
}


i.fa.fa-home {
    font-size: 1.3em;
    color: #ffc107;
    background: #fff;
    padding: 1em;
    -webkit-border-radius: 60%;
    -moz-border-radius: 60%;
    border-radius: 50%;
   }

input[type="submit"] {
    font-size: 2em;
    color: white;
    background: #1E90FF;
    outline: none;
    border: 1px solid #1E90FF;
    cursor: pointer;
    padding: .8em;
    -webkit-appearance: none;
    width: 29%;
    font-size:15px;
    margin-top: 1.5em;
   }
  input[type="submit"]:hover {
    background: none;
    color: black;
    }
</style>
</head>
<body>
<%
	if(session.getAttribute("enabled")!=null){
		response.sendRedirect("../user.jsp");
	}
%>
<nav class="navbar navbar-inverse" style="background-color:#1E90FF;">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#" style="color:white;font-size:22px">TwentyPlus</a>
    </div>
    <ul class="nav navbar-nav navbar-right" style="color:white">
       <li><a href="../index.jsp" style="color:white"><span class="glyphicon glyphicon-home"></span> Home</a></li>
    </ul>
  </div>
</nav>
<div class="infobox">
<div style="height:190px;background-color:#1E90FF";>
<center>
<img src="../images/3.png" style="height:150px;width:40%";/></center>
<center>
<a href="index.jsp"> <i class="fa fa-home"></i></a>
</center>
</div>
<center>
	
		<div>
		<center><span style="color: red;font-size: 25px">
		<%try{
			if(request.getParameter("login_msg")!=null){
				%>
				<span><%out.print(request.getParameter("login_msg"));%></span>
				<%
			}
		 }catch(Exception e){
			 
		 }
		%>
		 </center>
		<br/>
		
		
		
		<h1 class="text-center">Forgot Password?</h1><br/>
		    <form class="login-form" action="forgotpasswordusercontroller.jsp" method="post">
			  <div class="form-group">
			      <label for="exampleInputEmail1" style="float:left;font-size:20px;font-weight:300" >User Id</label>
			      <input type="text" class="form-control" style="width:56%;margin-left:21px" name="userId" placeholder=""
			       onkeypress="checkNum1()" required min="0" max="9999999999"
										maxlength="10" required>
			    
			  </div>
			  <div class="form-group">
			    <label for="exampleInputPassword1" style="float:left;font-size:20px;font-weight:300" >Mobile No</label>
			    <input type="text" name="mobileNo" style="width:56%"  class="form-control" placeholder=""
			    onkeypress="checkNum2()" required min="0" max="9999999999" maxlength="10" required>
			  <input type="submit" value="Submit" style="margin-left: 5px; border-radius: 4px; width: 35%;">
			  </div>

  
			</form>		
<script>
	function preventBack() { window.history.forward(); }
	setTimeout("preventBack()", 0);
	window.onunload = function () { null };
</script>
<script>
		function checkNum1() {
			var ch = String.fromCharCode(event.keyCode);
			var filter = /[0-9]/;
			if (!filter.test(ch)) {
				event.returnValue = false;
			}
		}
	</script>
	<script>
		function checkNum2() {
			var ch = String.fromCharCode(event.keyCode);
			var filter = /[0-9]/;
			if (!filter.test(ch)) {
				event.returnValue = false;
			}
		}
	</script>

</body>
</html>