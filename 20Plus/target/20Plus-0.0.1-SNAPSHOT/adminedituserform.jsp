<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="error/admin_error_page.jsp"%>
<%@page import="com.model.AdminDetail"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.model.ParentDetailsModel"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.db.conf.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="cond" %>
<!DOCTYPE html>

<c:if test="${empty admin_name}">
    	<jsp:forward page="admin.jsp"></jsp:forward>
    
	</c:if>
	
<%		
	if(session.getAttribute("isEnabled")==null){		
		response.sendRedirect("admin.jsp");		
		}		
%>

<html>
<head>
<title>Approval Form</title>
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
	<script src="js/fetch_admin_details.js" type="text/javascript"></script>
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
	 <script type="text/javascript">
function clearSelectedAdminData(){
	
	var value = document.getElementById("select_first_admin").value;
	if(value==0){
		document.getElementById("parent_name0").value='';
		document.getElementById("parent_address0").value='';
		document.getElementById("parent_pincode0").value='';
		document.getElementById("parent_mobile_no0").value='';
		return;
	}
}


function checkFormValidation(){
	alert("Please select admin");
	if(document.getElementById("parent_name0") =="" || document.getElementById("parent_address0") ==""|| document.getElementById("parent_pincode0") =="" || document.getElementById("parent_mobile_no0") ==""){
		alert("Please select admin");
		return;
	}
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
	<script>
function myFunction() {
	
	var parent_name = document.getElementById("parent_name0");

	if(parent_name.value == ""||parent_name.value == NaN){
    alert("Please select admin");
    return false;
	}
	
	var parent_address = document.getElementById("parent_address0");
	if(parent_address.value == ""|| parent_address.value == NaN){
    alert("Please select admin");
    return false;
	}
	var parent_pincode = document.getElementById("parent_pincode0");
	if(parent_pincode.value == ""|| parent_pincode.value == NaN){
    alert("Please select admin");
    return false;
	}
    
	var parent_mobile_no = document.getElementById("parent_mobile_no0");
	if(parent_mobile_no.value == ""||parent_mobile_no.value == NaN){
    alert("Please select admin");
    return false;
	}
	return true;
}
</script>
	

</head>
<body>

<%
try
{
	List<AdminDetail> listOfAdmins = new ArrayList<AdminDetail>();
	
	String adminNames="SELECT id,user_name FROM admin_info WHERE id >=1";
	Connection adminNameCon = DBConnection.getDBConnetion();
	Statement adminQueryStatement = adminNameCon.createStatement();
	ResultSet adminCursor=adminQueryStatement.executeQuery(adminNames);


	while(adminCursor.next())
	{
		AdminDetail adminDetailOb = new AdminDetail();
		adminDetailOb.setId(adminCursor.getLong("id"));
		adminDetailOb.setAdminName(adminCursor.getString("user_name"));
		listOfAdmins.add(adminDetailOb);
	}
	System.out.println(listOfAdmins);
	request.setAttribute("listOfAdmins", listOfAdmins);
}
catch(Exception e){
	e.printStackTrace();
}

%>
	<%! String firstAdminId=null; %>
<%
            long curentUserID = Long.parseLong(request.getAttribute("currentUSerId").toString());
            Connection firstAdminCon = DBConnection.getDBConnetion();
			Statement firstAdminSt = firstAdminCon.createStatement();
			ResultSet cursorFirstAdmin=firstAdminSt.executeQuery("select first_admin from user_information where user_id='"+curentUserID+"';");
			System.out.println("firstAdminSt :: "+firstAdminSt);
			if(cursorFirstAdmin.next()){
				System.out.println("after firstAdminSt :: "+cursorFirstAdmin.getString("first_admin"));
				firstAdminId = cursorFirstAdmin.getString("first_admin");
				if(firstAdminId!=null){
				/*  */
				Connection con = DBConnection.getDBConnetion();
				Statement st = con.createStatement();
				ResultSet dataCursor=st.executeQuery("select user_id,user_name,address,pincode,mobile_no from user_information where user_id='"+firstAdminId.split("-")[0]+"';");
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
				}
	            /*  */
			}
            
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
    <ul class="nav navbar-nav navbar-right">
      <li><a href="#"><span class="glyphicon glyphicon-user"></span> ${admin_name}</a></li>
            <li><a href="adminhome.jsp"><span class="glyphicon glyphicon-home"></span> Dashboard</a></li>
      <li><a href="adminlogout.jsp"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
    </ul>
  </div>
</nav>

<h1 class="headingLevel1">Member Details</h1>
	<form action="UpdateNewChildController" method="post" onsubmit="return myFunction();" >

		<div class="table-responsive borderForm mgb30">
			<table class="table table-borderless">
				<thead>
					<tr>
						<th>User Id</th>
						<th>Name</th>
						<th>Address</th>
						<th>Pincode</th>
						<th>Mobile No</th>
						
					</tr>
				</thead>
				<tbody>
					<tr>
					<c:if test="${empty list}">
					<td><select name="firstAdmin" id="select_first_admin" class="form-control" required  onchange="clearSelectedAdminData()">
							<option value="0">Select admin </option>
							<c:forEach items="${listOfAdmins}" var="details">
									<option value="${details.id}">${details.adminName}</option>
							</c:forEach>
						</select>
						</td>
						<c:forEach var="i" begin="0" end="0">
							<input type="hidden" value="0" name="exist${i}" readonly="readonly">
							<td><input class="form-control" type="text1" id="parent_name${i}" name="parent_name${i}" min="1" required readonly="readonly"></td>
							<td><input class="form-control" type="text4" id="parent_address${i}" name="parent_address${i}" readonly="readonly" required></td>
							<td><input class="form-control" type="text5" id="parent_pincode${i}" name="parent_pincode${i}" onkeypress="checkNum3()" min="0" max="999999" maxlength="6" readonly="readonly" required></td>
							<td><input class="form-control" type="text5" id="parent_mobile_no${i}" name="parent_mobile_no${i}" onkeypress="checkNum3()" min="0" max="999999" maxlength="6" readonly="readonly" required></td>
						</c:forEach>
							</c:if>
							
						<c:if test="${not empty list}">
							<c:forEach var="i" begin="0" end="0">
								<input type="hidden" value="1" name="exist${i}" readonly="readonly">
							<td><input class="form-control" type="text4" value="${list.parentId}"    name="parent_id${i}" readonly="readonly" required></td>
							<td><input class="form-control" type="text1" value="${list.parentName}" name="parent_name${i}" readonly="readonly" required></td>
							<td><input class="form-control" type="text4" value="${list.address}"    name="parent_address${i}" readonly="readonly" required></td>
							<td><input class="form-control" type="text5" value="${list.pincode}"    name="parent_pincode${i}" onkeypress="checkNum3()" min="0" max="999999" maxlength="6" readonly="readonly" required></td>
							<td><input class="form-control" type="text5" value="${list.pincode}"    name="parent_mobile_no${i}" onkeypress="checkNum3()" min="0" max="999999" maxlength="6" readonly="readonly" required></td>
							</c:forEach>
						</c:if>
					</tr>

					<c:if test="${cond:length(member_details) == 3 }">
						<c:forEach items="${member_details}" var="member"
							varStatus="theCount">
							<tr>
								<td><input class="form-control" type="textb" value="${member.key}"
									id="position2" name="parent_name0" readonly="readonly" required></td>
								<td><input class="form-control" type="text1" value="${member.value.parentName}"id="position2" readonly="readonly" required>
								<input type="hidden" value="${member.key}${'-'}${member.value.parentName}" id="position2" name="parent_name${theCount.count}" readonly="readonly" required>
								</td>
								<td><input class="form-control" type="text4" value="${member.value.address}"
									id="position3" name="parent_address${theCount.count}"
									readonly="readonly" required></td>
								<td><input class="form-control" type="text5" value="${member.value.pincode}"
									id="position2" name="parent_pincode${theCount.count}"
									onkeypress="checkNum3()" min="0" max="999999" maxlength="6"
									readonly="readonly" required></td>
								<td><input class="form-control" type="text6" value="${member.value.mobileNo}" name="parent_mobile_no${theCount.count}"readonly="readonly" required></td>

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
						<td><input type="text" class="form-control" id="position1" name="name17" onkeypress="checkNum2()" disabled="disabled" max="999999999999999999" maxlength="18" ></td>

					</tr>
					<tr>
						<td><input type="text" class="form-control" id="position2" name="name18" onkeypress="checkNum2()" disabled="disabled" max="999999999999999999" maxlength="18" ></td>

					</tr>
					<tr>
						<td><input type="text" class="form-control" id="position3" name="name19" onkeypress="checkNum2()" disabled="disabled" max="999999999999999999" maxlength="18" ></td>

					</tr>



				</tbody>
			</table>
		</div>
		</div></div>
		
<h1 class="headingLevel1">Add Member Details</h1>

		<div class="table-responsive borderForm">
			<table class="table">
				<thead>
					<tr>
						<th>Name</th>
						<th>Address</th>
						<th>Pincode</th>
						<th>Phone Number</th>
						<th>Gender</th>

					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input class="form-control" type="text1" id="position2"
							disabled="disabled"></td>
						<td><input class="form-control" type="text7" id="position3"
							disabled="disabled"></td>
						<td><input class="form-control" type="text5" id="position1"
							disabled="disabled" onkeypress="checkNum3()" min="0"
							max="999999" maxlength="6"></td>
						<td><input class="form-control" type="text6"
							id="userMobileNo1" disabled="disabled"
							onkeypress="checkNum1()" required min="0" max="9999999999"
							maxlength="10"></td>
						<td><select name="gender1" class="form-control" disabled>
								<option></option>
								<option value="Male">Male</option>
								<option value="Female">Female</option>
						</select></td>
					</tr>
					<tr>
						<td><input class="form-control" type="text1" id="position4"
							disabled></td>
						<td><input class="form-control" type="text7" id="position4"
							disabled></td>
						<td><input class="form-control" type="text5" id="position4"
							disabled onkeypress="checkNum3()" min="0"
							max="999999" maxlength="6"></td>
						<td><input class="form-control" type="text6"
							id="userMobileNo2" disabled
							onkeypress="checkNum1()" required min="0" max="9999999999"
							maxlength="10"></td>
						<td><select class="form-control" disabled>
								<option></option>
								<option value="Male">Male</option>
								<option value="Female">Female</option>
						</select></td>
					</tr>
					<tr>
						<td><input class="form-control" type="text1" id="position4"
							disabled></td>
						<td><input class="form-control" type="text7" id="position4"
							disabled></td>
						<td><input class="form-control" type="text5" id="position4"
							disabled onkeypress="checkNum3()" min="0"
							max="999999" maxlength="6"></td>
						<td><input class="form-control" type="text6"
							id="userMobileNo3" disabled
							onkeypress="checkNum1()" required min="0" max="9999999999"
							maxlength="10"></td>
						<td><select class="form-control" disabled>
								<option></option>
								<option value="Male">Male</option>
								<option value="Female">Female</option>
						</select></td>
					</tr>
					<tr>
						<td><input class="form-control" type="text1" id="position4"
							disabled></td>
						<td><input class="form-control" type="text7" id="position4"
							disabled></td>
						<td><input class="form-control" type="text5" id="position4"
							disabled onkeypress="checkNum3()" min="0"
							max="999999" maxlength="6"></td>
						<td><input class="form-control" type="text6"
							id="userMobileNo4" disabled
							onkeypress="checkNum1()" required min="0" max="9999999999"
							maxlength="10"></td>
						<td><select class="form-control"  disabled>
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

				<div class="col-sm-6"></div>
				<div class="col-sm-3">
					<input type="submit"  class="btn btn-default btn-primary btn-lg" style="font-color:#1E90FF;" value="Approve" onsubmit="checkFormValidation()"></input>

				</div>

				<div class="col-sm-4"></div>

			</div></div></form>
		
<script>
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
<center>
 	<a href="usercontent2.jsp"></a> 
 </center>

 
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



  


  </body>
</html>