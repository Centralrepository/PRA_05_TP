<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="error/user_error_page.jsp"%>
<%@page import="com.model.ParentDetailsModel"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.db.conf.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="cond" %>
<!DOCTYPE html>

<c:if test="${empty user_id}">
    	<jsp:forward page="index.jsp"></jsp:forward>
	</c:if>

<html>
<head>


<style>
@media print {
@page {size: landscape}
  html, body {
    width: 35cm;
    height: 29.7cm;
     margin: -20mm 00mm 00mm 00mm;
  	
 }
 }
 
</style>
<title>Download</title>
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


<script src="https://code.jquery.com/jquery-1.10.2.js"
	type="text/javascript"></script>
<script src="js/validation.js" type="text/javascript"></script>
<style type="text/css">
.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th,
	.table>thead>tr>td, .table>thead>tr>th {
	border: none;
}
.table tr th{
background:	#1E90FF;
}
.navbar-inverse .navbar-nav>li>a
{
	color:white;
}
.navbar-inverse .navbar-nav>li>a>hover
{
	color:blue;
}
</style>

	<script>
	function validateFile(){
		if( document.getElementById("uploadFile").files.length == 0 ){
		    alert("no files selected");
		    return false;
		}
		return true
	}
	
	</script>
	<script>
	function validateFile(){
		if( document.getElementById("uploadFile1").files.length == 0 ){
		    alert("no files selected");
		    return false;
		}
		return true
	}
	
	</script>

</head>


<body>

<%!String firstAdmin = null; %>
<%
            Connection defaultCon = DBConnection.getDBConnetion();
			Statement defaultst = defaultCon.createStatement();
			ResultSet dataCursor1=defaultst.executeQuery("select first_admin from user_information where user_id='"+session.getAttribute("user_id")+"';");
			if(dataCursor1.next()){
				firstAdmin =dataCursor1.getString("first_admin");
			}
            
        %>


<%
            Connection con = DBConnection.getDBConnetion();
			Statement st = con.createStatement();
			ResultSet dataCursor=st.executeQuery("select user_id,user_name,address,pincode,mobile_no from user_information where user_id='"+firstAdmin.trim().split("-")[0]+"';");
			ParentDetailsModel adminDetails= new ParentDetailsModel();
			if(dataCursor.next()){
				adminDetails.setParentId(dataCursor.getLong("user_id"));
				adminDetails.setParentName(dataCursor.getString("user_name"));
				adminDetails.setAddress(dataCursor.getString("address"));
				adminDetails.setMobileNo(dataCursor.getLong("mobile_no"));
				adminDetails.setPincode(dataCursor.getLong("pincode"));
			}
            
            request.setAttribute("list", adminDetails);
            adminDetails = null;
        %>
        <%
Connection con1 = DBConnection.getDBConnetion();
Statement st1 = con1.createStatement();
ResultSet rs=st1.executeQuery("select maxlimit from user_information where user_id='"+session.getAttribute("user_id")+"'");
while(rs.next()){
	int maxlimit=rs.getInt("maxlimit");
	request.setAttribute("submit_key", maxlimit);
}


%>
	
	<nav class="navbar navbar-inverse" style="background-color:#1E90FF;">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#" style="color:white">TwentyPlus</a>
    </div>
    <ul class="nav navbar-nav navbar-right" style="color:white">
      <li><a href="#" style="color:white"><span class="glyphicon glyphicon-user"></span> ${user_name}</a></li>
            <li><a href="user.jsp"><span class="glyphicon glyphicon-home"></span> Dashboard</a></li>
      <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
    </ul>
  </div>
</nav>

<h1 class="headingLevel1">Member Details</h1>
	

		<div class="table-responsive borderForm mgb30">
			<table class="table table-borderless">
				<thead>
					<tr>
						<th style="width:7%">User Id</th>
						<th style="width:17%">Name</th>
						<th style="width:62%">Address</th>
						<th style="width:8%">Pincode</th>
						<th style="width:6%">Money</th>

					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input class="form-control" type="textb" value="" id="position2"
							name="parent_name0" readonly="readonly"></td>
						<td><input class="form-control" type="text1" value="${list.parentName}"
							id="position2" name="parent_name0" readonly="readonly"></td>
						<td><input class="form-control" type="text4" value="${list.address}"
							id="position3" name="parent_address0" readonly="readonly"></td>
						<td><input class="form-control" type="text5" value="${list.pincode}"
							id="position2" name="parent_pincode0" onkeypress="checkNum3()"
							min="0" max="999999" maxlength="6" readonly="readonly"></td>
						<td><input class="form-control" type="text6" requried onkeypress="checkNum3()"
							min="2000" max="2000" maxlength="4" value="2000" disabled></td>
					</tr>

					<c:if test="${cond:length(member_details) == 3 }">
						<c:forEach items="${member_details}" var="member"
							varStatus="theCount">

							<tr>

								<td><input class="form-control" type="textb" value="${member.key}"
									id="position2" name="parent_name0" readonly="readonly"></td>
								<td><input class="form-control" type="text1" value="${member.value.parentName}"
									id="position2" readonly="readonly"><input type="hidden"
									value="${member.key}${'-'}${member.value.parentName}"
									id="position2" name="parent_name${theCount.count}"
									readonly="readonly"></td>
								<td><input class="form-control" type="text4" value="${member.value.address}"
									id="position3" name="parent_address${theCount.count}"
									readonly="readonly"></td>
								<td><input class="form-control" type="text5" value="${member.value.pincode}"
									id="position2" name="parent_pincode${theCount.count}"
									onkeypress="checkNum3()" min="0" max="999999" maxlength="6"
									readonly="readonly"></td>
								<td><input class="form-control" type="text6" value="2000" disabled></td>

							</tr>

						</c:forEach>
					</c:if>

				</tbody>
			</table>
		</div>
		<div class="row">
<div class="col-sm-4"></div>
<div class="col-sm-5">
		<div class="table-responsive borderForm " style="width:100%">
			<table class="table">
				<thead>
					<tr>
						<th>PNR Number</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" class="form-control" id="pnr1" name="name17" onkeypress="checkNum2()" required min="0" max="999999999999999999" maxlength="18" ></td>

					</tr>
					<tr>
						<td><input type="text" class="form-control" id="pnr2" name="name18" onkeypress="checkNum2()" required min="0" max="999999999999999999" maxlength="18" ></td>

					</tr>
					<tr>
						<td><input type="text" class="form-control" id="pnr3" name="name19" onkeypress="checkNum2()" required min="0" max="999999999999999999" maxlength="18" ></td>

					</tr>



				</tbody>
			</table>
		</div>
		</div></div>
		
		<p style="page-break-after: always;">&nbsp;</p>
<p style="page-break-before: always;">&nbsp;</p>
		
<h1 class="headingLevel1">Add Member Details</h1>
<center><span id="message" style="position:absolute;"></span></center><br>
		<div class="table-responsive borderForm">
			<table class="table">
				<thead>
					<tr>
						<th style="width:17%">Name</th>
						<th style="width:54%">Address</th>
						<th style="width:7%">Pincode</th>
						<th style="width:12%">Phone Number</th>
						<th style="width:14%">Gender</th>

					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input class="form-control" type="text1" id="position2"
							name="user_name1" required></td>
						<td><input class="form-control" type="text7" id="position3"
							name="user_address1" required></td>
						<td><input class="form-control" type="text5" id="position1"
							name="user_pincode1" onkeypress="checkNum3()" min="0"
							max="999999" maxlength="6" required></td>
						<td><input class="form-control" type="text6"
							id="userMobileNo1" name="user_mobile_no1"
							onkeypress="checkNum1()" required min="0" max="9999999999"
							maxlength="10"></td>
						<td><select name="gender1" class="form-control" required>
								<option></option>
								<option value="Male">Male</option>
								<option value="Female">Female</option>
						</select></td>
					</tr>
					<tr>
						<td><input class="form-control" type="text1" id="position4"
							name="user_name2" required></td>
						<td><input class="form-control" type="text7" id="position4"
							name="user_address2" required></td>
						<td><input class="form-control" type="text5" id="position4"
							name="user_pincode2" onkeypress="checkNum3()" min="0"
							max="999999" maxlength="6" required></td>
						<td><input class="form-control" type="text6"
							id="userMobileNo2" name="user_mobile_no2"
							onkeypress="checkNum1()" required min="0" max="9999999999"
							maxlength="10"></td>
						<td><select class="form-control" name="gender2" required>
								<option></option>
								<option value="Male">Male</option>
								<option value="Female">Female</option>
						</select></td>
					</tr>
					<tr>
						<td><input class="form-control" type="text1" id="position4"
							name="user_name3" required></td>
						<td><input class="form-control" type="text7" id="position4"
							name="user_address3" required></td>
						<td><input class="form-control" type="text5" id="position4"
							name="user_pincode3" onkeypress="checkNum3()" min="0"
							max="999999" maxlength="6" required></td>
						<td><input class="form-control" type="text6"
							id="userMobileNo3" name="user_mobile_no3"
							onkeypress="checkNum1()" required min="0" max="9999999999"
							maxlength="10"></td>
						<td><select class="form-control" name="gender3" required>
								<option></option>
								<option value="Male">Male</option>
								<option value="Female">Female</option>
						</select></td>
					</tr>
					<tr>
						<td><input class="form-control" type="text1" id="position4"
							name="user_name4" required></td>
						<td><input class="form-control" type="text7" id="position4"
							name="user_address4" required></td>
						<td><input class="form-control" type="text5" id="position4"
							name="user_pincode4" onkeypress="checkNum3()" min="0"
							max="999999" maxlength="6" required></td>
						<td><input class="form-control" type="text6"
							id="userMobileNo4" name="user_mobile_no4"
							onkeypress="checkNum1()" required min="0" max="9999999999"
							maxlength="10"></td>
						<td><select class="form-control" name="gender4" required>
								<option></option>
								<option value="Male">Male</option>
								<option value="Female">Female</option>
						</select></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div>
		<div class="row">

				<div class="col-sm-5"></div>
				<div class="col-sm-2">
					<button onclick="myFunction()" class="btn btn-default btn-primary btn-lg">Print this page</button>

				</div>

				<div class="col-sm-4"></div>

			</div></div>
		
		<script>
function myFunction() {
    window.print();
}
</script>
<script>
function validateFile(){
	var pnr1 = document.getElementById("pnr1").value;
	var pnr2 = document.getElementById("pnr2").value;
	var pnr3 = document.getElementById("pnr3").value;
	var pnr11 = /^(([0-9]*)|0)?$/;
	if (!pnr1.match(pnr11)) {
		alert("PNR should contain only numbers!!!Please enter a valid PNR");
		document.getElementById("pnr1").value='';
		return false;
}
if (!pnr2.match(pnr11)) {
	alert("PNR should contain only numbers!!!Please enter a valid PNR");
	document.getElementById("pnr2").value='';
	return false;
 }
if (!pnr3.match(pnr11)) {
	alert("PNR should contain only numbers!!!Please enter a valid PNR");
	document.getElementById("pnr3").value='';
	return false;
}

return true;
}

	
	
	
	
function checkNum3(){
     var ch = String.fromCharCode(event.keyCode);
     var filter = /[0-9]/;   
     if(!filter.test(ch)){
          event.returnValue = false;
     }
}
</script>

 <script>
function checkNum1(){
     var ch = String.fromCharCode(event.keyCode);
     var filter = /[0-9]/;   
     if(!filter.test(ch)){
          event.returnValue = false;
     }
}
</script>

 <script>
function checkNum2(){
     var ch = String.fromCharCode(event.keyCode);
     var filter = /[0-9]/;   
     if(!filter.test(ch)){
          event.returnValue = false;
     }
}
</script>


 
 <script>
function checkNum2(){
     var ch = String.fromCharCode(event.keyCode);
     var filter = /[0-9]/;   
     if(!filter.test(ch)){
          event.returnValue = false;
     }
}

function validateFunction(){
	var mobileno= document.getElementById("userMobileNo").value;
	alert("your no :"+mobile);
	
}
</script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
        <script>
        //When the page has loaded.
        $( document ).ready(function(){
            $('#message').fadeIn('slow', function(){
               $('#message').delay(2000).fadeOut(); 
            });
        });
        </script>
  


  </body>
</html>