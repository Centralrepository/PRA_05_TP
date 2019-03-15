<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="error/admin_error_page.jsp"%>
<%@page import="java.util.Calendar"%>		
<%@page import="java.sql.Date"%>
<%@page import="com.model.UserInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.UserInformationModel"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.db.conf.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<%@ page import="java.util.*" %>		
<%@ page import="com.google.gson.Gson"%>		
<%@ page import="com.google.gson.JsonObject"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<!-- <script type="text/javascript" src="js/downloadForm.js"></script> -->
<script type="text/javascript" src="js/pagination.js"></script>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet"	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" type="text/css" href="css/myStyles.css">
<!-- <script type="text/javascript" src="js/adminvalidation.js"></script> -->
<script>

$(document).ready(function() {
	 m1();
	function disableBack() { window.history.forward() }
    window.onload = disableBack();
    window.onpageshow = function(evt) { if (evt.persisted){ disableBack();} }
}
); 

</script>

    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js">
        </script>
        <script src="https://code.jquery.com/jquery-1.10.2.js"
	type="text/javascript"></script>
<!--         <script type="text/javascript" src="js/validation.js"></script> -->
        
        <style>

th a:link { text-decoration: none; color: black }

th a:visited { text-decoration: none; color: black }

.rows { background-color: white }

.hiliterows { background-color: pink; color: #000000; font-weight: bold }

.alternaterows { background-color: #efefef }

.header { background-color: cyan; color: #000000;font-weight: bold }



.datagrid { border: 1px solid #C7C5B2; font-family: arial; font-size: 9pt;

font-weight: normal }

</style>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<style>
	body {
    font-family: serif;
    transition: background-color .5s;
}
table, td, th {    
    border: 1px solid #ddd;
    text-align: center;
}

table {
    border-collapse: collapse;
    width: 100%;
}

th, td {
    padding: 15px;
}


.scrollable {
   height: 80px; /* or any value */
    overflow-y: auto;
}

.navigation {
     height: 65px;
     position: absolute;
     background: linear-gradient(45deg, #595e63, #74b4fe);
}
 .brand {
     position: absolute;
     padding-left: 20px;
     float: left;
     line-height: 55px;
     
     font-size: 1.4em;
}
 .brand a, .brand a:visited {
     color: #ffffff;
     text-decoration: none;
}
 .nav-container {
     max-width: 1000px;
     margin: 0 auto;
}
 
.tabcontent {
    float: left;
    padding: 0px 12px;
    border: 1px solid #ccc;
    width: 100%;
    border-left: none;
    height: 650px;
    overflow: scroll;
    background-color:white;
/*     font-family:serif;
    position:fixed;
    margin-top:30px; */
    
}

input[type=text], input[type=textarea], input[type=password],input[type=number], input[type=email], select {
width: 95%;
color: black;
padding: 6px 20px;
margin: 8px 0;
display: inline-block;
border: 1px solid #ccc;
border-radius: 4px;
box-sizing: border-box;
font-size: 18px;

}

label {
    /* display: inline-block; */
    max-width: 100%;
    margin-bottom: 5px;
    font-weight: 500;
}


.tex {
	font-family: sans-serif;
	display: inherit;
	
}
.fil{
	margin-left: 40px;
}





.autocomplete {
  /*the container must be positioned relative:*/
  position: relative;
  
}




.autocomplete-items div {
  padding: 10px;
  cursor: pointer;
  background-color: #fff; 
  border-bottom: 1px solid #d4d4d4; 
  width: 255px;
}

.autocomplete-items div:hover {
  /*when hovering an item:*/
  background-color: #e9e9e9; 
}

.autocomplete-active {
  /*when navigating through the items using the arrow keys:*/
  background-color: DodgerBlue !important; 
  color: #ffffff; 
}

.button {
    position: relative;
    background-color: #1E90FF;
    border: none;
    font-size: 22px;
    color: #FFFFFF;
    padding: 0px;
    width: 140px;
    height: 45px;
    border-radius: 5px;
    text-align: center;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    text-decoration: none;
    overflow: hidden;
    cursor: pointer;
}

.button:after {
    content: "";
    background: white;
    display: block;
    position: absolute;
    padding-top: 300%;
    padding-left: 350%;
    margin-left: -20px!important;
    margin-top: -120%;
    opacity: 0;
    transition: all 0.8s
}

.button:active:after {
    padding: 0;
    margin: 0;
    opacity: 1;
    transition: 0s
}

* {
box-sizing: border-box;
}

.wrapper {
display: flex;
align-items: center;
flex-direction: column; 
justify-content: center;
width: 100%;
min-height: 60%;
padding: 20px;
}
.login {

border-radius: 19px 19px 19px 19px;
padding: 15px 20px 20px 20px;
width: 110%;
max-width: 420px;
background: #ffffff;
position: relative;
padding-bottom: -5px;
box-shadow: 12px 29px 94px rgba(0, 0, 0, 0.3);
height: 488px;
border: 1px groove white;

}

</style>
</head>




</style>


	</head>
<body>
<!--  Session Management 	-->		
	<%		
		if(session.getAttribute("isEnabled")==null){		
		response.sendRedirect("admin.jsp");		
		}		
	%>

<div class="container" >

     <div class="navmenu navmenu-default navmenu-fixed-left" style="background-color:#1E90FF;">
      <div class="logo-off" style="background-color:#1E90FF;height:51px;">
      <a class="navmenu-brand"  style="font-size:22px; text-decoration: none;">TwentyPlus</a></div>
      <ul class="nav navmenu-nav">
        <li><button class="tablinks" onclick="openCity(event, 'Home')" id="defaultOpen" href="userinformationshow" method="post"><i class="fa fa-home" style="font-size: 16px;color:">&nbsp;&nbsp;&nbsp;Home</i></button></li>
        <li><button class="tablinks" onclick="openCity(event, 'My Network')"><i class="fa fa-sitemap" style="font-size:16px">&nbsp;&nbsp;&nbsp;My Network</i></button></li>
        <li><button class="tablinks" onclick="openCity(event, 'My Income')"><i class="fa fa-money" style="font-size:16px;">&nbsp;&nbsp;&nbsp;My Income</i></button></li>
        <li><button class="tablinks" onclick="openCity(event, 'Pending Approval Notification')"><i class="fa fa-file-o" style="font-size:16px;">&nbsp;&nbsp;&nbsp;Pending Approval Notification</i></button></li>
        <li><button class="tablinks" onclick="openCity(event, 'Add New User')"><i class="fa fa-user" style="font-size:16px">&nbsp;&nbsp;&nbsp;Add New User</i></button></li>
       <li><button class="tablinks" onclick="openCity(event, 'Expired User Approval')"><i class="fa fa-file-o" style="font-size:16px;">&nbsp;&nbsp;&nbsp;Expired Users</i></button></li>
       <li><button class="tablinks" onclick="openCity(event, 'Add New Admin')"><i class="fa fa-user" style="font-size:16px">&nbsp;&nbsp;&nbsp;Add New Admin</i></button></li>
       <li><button class="tablinks" onclick="openCity(event, 'Request Approval')"><i class="fa fa-user" style="font-size:16px">&nbsp;&nbsp;&nbsp;Request Approval</i></button></li>
        
       </ul>
    </div>

    
</div>
   <div class="container" style="background-color:#1E90FF;height:20px">
		<nav class="navbar navbar-inverse">
		<div class="container" style="background-color:#1E90FF;">
			<div class="navbar navbar-default navbar-fixed-top">
				<!-- <button type="button" class="navbar-toggle" data-toggle="offcanvas"
					data-target=".navmenu" data-canvas="body">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>-->
			</div>
			<ul class="nav navbar-nav navbar" style="background-color:#1E90FF;">
				<li><a href="#" style="color: white; margin-left: 900px"><span
						class="glyphicon glyphicon-user"></span>${admin_name}</a></li>
				<li><a href="adminlogout.jsp" style="color: white"><span
						class="glyphicon glyphicon-log-out"></span> Logout</a></li>
			</ul>
		</div>
		</nav>
		<font color="red">${approve_msg}</font>
<%
try{
	if(request.getParameter("member_update") != null){
		%>
		<span id="message" style="margin-left: 500px;position:relative;"><font color="green"><b><% out.println(request.getParameter("member_update"));%></b></font><hr/></span>
		<% 
	}
}
catch(NullPointerException e){
	
}
		try{
			if(request.getParameter("approve_msg") != null){
				%>
				<span id="message" style="margin-left: 400px;position:relative;"><font color="green"><b><% out.println(request.getParameter("approve_msg"));%></b></font><hr/></span>
				<% 
			}
		}
		catch(NullPointerException e){
			
		}
		
	%>
	
	<h4 style="margin-left:-988px;margin-top:-31px;color:green;">${msg}</h4>
	</div>

<div id="Home" class="tabcontent" style="margin-left:300px;width:100%">
    <h3>Home</h3>
<% 
			  Calendar now = Calendar.getInstance();
			  int currentYear=now.get(Calendar.YEAR);
			  %>


			 <% 
			    Connection connect1 = DBConnection.getDBConnetion();
			    String query1="SELECT COUNT(start_date) FROM user_information WHERE (DATE(start_date) BETWEEN '"+currentYear+"-01-01' AND '"+currentYear+"-01-31') AND user_id >=10000 AND start_date IS NOT NULL";
				Statement stmt1 = connect1.createStatement();
				ResultSet results1=stmt1.executeQuery(query1);
				long result1=0;
				if(results1.next()){
					result1=(results1.getInt(1));
					
				}
				%>

			  <% 
			    Connection connect2 = DBConnection.getDBConnetion();
			    String query2="SELECT COUNT(start_date) FROM user_information WHERE (DATE(start_date) BETWEEN '"+currentYear+"-02-01' AND '"+currentYear+"-02-29') AND user_id >=10000 AND start_date IS NOT NULL";
				Statement stmt2 = connect2.createStatement();
				ResultSet results2=stmt2.executeQuery(query2);
				long result2=0;
				if(results2.next()){
					result2=(results2.getInt(1));
					
				}
				%>

			  <% 
			    Connection connect3 = DBConnection.getDBConnetion();
			    String query3="SELECT COUNT(start_date) FROM user_information WHERE (DATE(start_date) BETWEEN '"+currentYear+"-03-01' AND '"+currentYear+"-03-31') AND user_id >=10000 AND start_date IS NOT NULL";
				Statement stmt3 = connect3.createStatement();
				ResultSet results3=stmt3.executeQuery(query3);
				long result3=0;
				if(results3.next()){
					result3=(results3.getInt(1));
					
				}
				%>

			  <% 
			    Connection connect4 = DBConnection.getDBConnetion();
			    String query4="SELECT COUNT(start_date) FROM user_information WHERE (DATE(start_date) BETWEEN '"+currentYear+"-04-01' AND '"+currentYear+"-04-30') AND user_id >=10000 AND start_date IS NOT NULL";
				Statement stmt4 = connect4.createStatement();
				ResultSet results4=stmt4.executeQuery(query4);
				long result4=0;
				if(results4.next()){
					result4=(results4.getInt(1));
					
				}
				%>

			  <% 
			    Connection connect5 = DBConnection.getDBConnetion();
			    String query5="SELECT COUNT(start_date) FROM user_information WHERE (DATE(start_date) BETWEEN '"+currentYear+"-05-01' AND '"+currentYear+"-05-31') AND user_id >=10000 AND start_date IS NOT NULL";
				Statement stmt5 = connect5.createStatement();
				ResultSet results5=stmt5.executeQuery(query5);
				long result5=0;
				if(results5.next()){
					result5=(results5.getInt(1));
					
				}
				%>

			  <% 
			    Connection connect6 = DBConnection.getDBConnetion();
			    String query6="SELECT COUNT(start_date) FROM user_information WHERE (DATE(start_date) BETWEEN '"+currentYear+"-06-01' AND '"+currentYear+"-06-30') AND user_id >=10000 AND start_date IS NOT NULL";
				Statement stmt6 = connect6.createStatement();
				ResultSet results6=stmt6.executeQuery(query6);
				long result6=0;
				if(results6.next()){
					result6=(results6.getInt(1));
					
				}
				%>

			  <% 
			    Connection connect7 = DBConnection.getDBConnetion();
			    String query7="SELECT COUNT(start_date) FROM user_information WHERE (DATE(start_date) BETWEEN '"+currentYear+"-07-01' AND '"+currentYear+"-07-31') AND user_id >=10000 AND start_date IS NOT NULL";
				Statement stmt7 = connect7.createStatement();
				ResultSet results7=stmt7.executeQuery(query7);
				long result7=0;
				if(results7.next()){
					result7=(results7.getInt(1));
					
				}
				%>

			  <% 
			    Connection connect8 = DBConnection.getDBConnetion();
			    String query8="SELECT COUNT(start_date) FROM user_information WHERE (DATE(start_date) BETWEEN '"+currentYear+"-08-01' AND '"+currentYear+"-08-31') AND user_id >=10000 AND start_date IS NOT NULL";
				Statement stmt8 = connect8.createStatement();
				ResultSet results8=stmt8.executeQuery(query8);
				long result8=0;
				if(results8.next()){
					result8=(results8.getInt(1));
					
				}
				%>

			  <% 
			    Connection connect9 = DBConnection.getDBConnetion();
			    String query9="SELECT COUNT(start_date) FROM user_information WHERE (DATE(start_date) BETWEEN '"+currentYear+"-09-01' AND '"+currentYear+"-09-30') AND user_id >=10000 AND start_date IS NOT NULL";
				Statement stmt9 = connect9.createStatement();
				ResultSet results9=stmt9.executeQuery(query9);
				long result9=0;
				if(results9.next()){
					result9=(results9.getInt(1));
					
				}
				%>

			  <% 
			    Connection connect10 = DBConnection.getDBConnetion();
			    String query10="SELECT COUNT(start_date) FROM user_information WHERE (DATE(start_date) BETWEEN '"+currentYear+"-10-01' AND '"+currentYear+"-10-31') AND user_id >=10000 AND start_date IS NOT NULL";
				Statement stmt10 = connect10.createStatement();
				ResultSet results10=stmt10.executeQuery(query10);
				long result10=0;
				if(results10.next()){
					result10=(results10.getInt(1));
					
				}
				%>
           <% 
			    Connection connect11 = DBConnection.getDBConnetion();
			    String query11="SELECT COUNT(start_date) FROM user_information WHERE (DATE(start_date) BETWEEN '"+currentYear+"-11-01' AND '"+currentYear+"-11-30') AND user_id >=10000 AND start_date IS NOT NULL";
				Statement stmt11 = connect11.createStatement();
				ResultSet results11=stmt11.executeQuery(query11);
				long result11=0;
				if(results11.next()){
					result11=(results11.getInt(1));
					
				}
				%>

			  <% 
			    Connection connect12 = DBConnection.getDBConnetion();
			    String query12="SELECT COUNT(start_date) FROM user_information WHERE (DATE(start_date) BETWEEN '"+currentYear+"-12-01' AND '"+currentYear+"-12-31') AND user_id >=10000 AND start_date IS NOT NULL";
				Statement stmt12 = connect12.createStatement();
				ResultSet results12=stmt12.executeQuery(query12);
				long result12=0;
				if(results12.next()){
					result12=(results12.getInt(1));
					
				}
				%>
		<h3 style="margin-left:20%;">TwentyPlus user growth graph for the year <%out.println(+currentYear); %></h3>
		<div id="chartContainer" style="height: 320px; width: 78%;"></div>
		<script src="js/graph.js"></script> 
		<%
Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> listg = new ArrayList<Map<Object,Object>>();
 
map = new HashMap<Object,Object>(); map.put("label", "January"); map.put("y", result1); listg.add(map);
map = new HashMap<Object,Object>(); map.put("label", "February"); map.put("y", result2); listg.add(map);
map = new HashMap<Object,Object>(); map.put("label", "March"); map.put("y", result3); listg.add(map);
map = new HashMap<Object,Object>(); map.put("label", "April"); map.put("y", result4); listg.add(map);
map = new HashMap<Object,Object>(); map.put("label", "May"); map.put("y", result5); listg.add(map);
map = new HashMap<Object,Object>(); map.put("label", "June"); map.put("y", result6); listg.add(map);
map = new HashMap<Object,Object>(); map.put("label", "July"); map.put("y", result7); listg.add(map);
map = new HashMap<Object,Object>(); map.put("label", "August"); map.put("y", result8); listg.add(map);
map = new HashMap<Object,Object>(); map.put("label", "September"); map.put("y", result9); listg.add(map);
map = new HashMap<Object,Object>(); map.put("label", "October"); map.put("y", result10); listg.add(map);
map = new HashMap<Object,Object>(); map.put("label", "November"); map.put("y", result11); listg.add(map);
map = new HashMap<Object,Object>(); map.put("label", "December"); map.put("y", result12); listg.add(map);
 
String dataPoints = gsonObj.toJson(listg);
%>
<script type="text/javascript">
     function m1() { 
		  
		var chart = new CanvasJS.Chart("chartContainer", {
			theme: "light2",
			/* title: {
				text: "20Plus Growth Graph "
			}, */
			axisX: {
				title: "Month"
			},
			axisY: {
				title: "Growth"
			},
			data: [{
				type: "area",
				yValueFormatString: "#,##0 New Users",
				dataPoints : <%out.print(dataPoints);%>
			}]
		});
		chart.render();
		 
		}
</script>
  <table style="width:70%;">
		<tr>
			<th >Month</th>
			<th>New Users</th>
		</tr>
		    <tr>
			<td>January<%out.println(" - "+currentYear); %></td>
			<td><%out.println(result1); %></td>
		     </tr>
			<tr>
			<td>February<%out.println(" - "+currentYear); %></td>
			<td><%out.println(result2); %></td>
		    </tr>
			<tr>
			<td>March<%out.println(" - "+currentYear); %></td>
			<td><%out.println(result3); %></td>
		    </tr>
			<tr>
			<td>April<%out.println(" - "+currentYear); %></td>
			<td><%out.println(result4); %></td>
		    </tr>
			<tr>
			<td>May<%out.println(" - "+currentYear); %></td>
			<td><%out.println(result5); %></td>
		    </tr>
			<tr>
			<td>June<%out.println(" - "+currentYear); %></td>
			<td><%out.println(result6); %></td>
		    </tr>
			<tr>
			<td>July<%out.println(" - "+currentYear); %></td>
			<td><%out.println(result7); %></td>
		    </tr>
			<tr>
			<td>August<%out.println(" - "+currentYear); %></td>
			<td><%out.println(result8); %></td>
		    </tr>
			<tr>
			<td>September<%out.println(" - "+currentYear); %></td>
			<td><%out.println(result9); %></td>
		   </tr>
			<tr>
			<td>October<%out.println(" - "+currentYear); %></td>
			<td><%out.println(result10); %></td>
			<tr>
			<td>November<%out.println(" - "+currentYear); %></td>
			<td><%out.println(result11); %></td>
			<tr>
			<td>December<%out.println(" - "+currentYear); %></td>
			<td><%out.println(result12); %></td>
		</tr>
</table>
</div>

<div id="My Network" class="tabcontent" style="overflow-y:scroll">
<h3 style="margin-left:300px;">My Network</h3>



<% 
ArrayList<UserInfo> empList = new ArrayList<UserInfo>();
/* Employee empObj; */

int fromIndex, toIndex;

int tcount =0;

int perpage=4;

int tpage=0;

try {

Connection connection = null;

Statement statement = null;

ResultSet rs = null;

//Class.forName("com.mysql.jdbc.Driver");

//connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hpmc", "root", "root");

connection=DBConnection.getDBConnetion();

statement = connection.createStatement();

String QueryString = "Select user_id,user_name,Mobile_No,password,start_date,expire_date,parent,super_parent from user_information where Approval='"+1+"' OR Approval='"+3+"' AND user_id>=10000";
rs = statement.executeQuery(QueryString);
UserInfo u=null;
while (rs.next()) { 

tcount++;
u = new UserInfo();
u.setUser_id(rs.getLong("user_id"));
u.setUserName(rs.getString("user_name"));
u.setMobile_No(rs.getLong("Mobile_No"));
u.setPassword(rs.getString("password"));
u.setStartDate(rs.getTimestamp("start_date"));		
u.setExpireDate(rs.getTimestamp("expire_date"));
u.setParent(rs.getString("parent"));
u.setSuper_parent(rs.getString("super_parent"));
empList.add(u);
}
request.setAttribute("empList", empList);


rs.close();

statement.close();



} 
catch (Exception ex) {



}
%>


<table id="tablepaging" border="1" style="margin-left:300px;width:78%;" cellpadding="5" cellspacing="5">
     <thead>
<tr> 
            <th>User Id</th>
            <th>User Name</th>
            <th>Mobile No</th>
            <th>Password</th>
            <th>Start Date</th>		
            <th>Expire Date</th>
            <th>Parent</th>
            <th>Super Parent</th>
        </tr>
 </thead>




    <c:forEach items="${empList}" var="u">
            <tbody> <tr>
                <td>${u.user_id}</td>
                <td>${u.userName}</td>
                 <td>${u.mobile_No}</td>
                <td>${u.password}</td>
                <td>${u.startDate}</td>		
                <td>${u.expireDate}</td>
                <td>${u.parent}</td>
                <td>${u.super_parent}</td>
            </tr></tbody>
  </c:forEach>
	
</table>
 <div id="pageNavPosition"  style="padding-top: 20px;margin-left:300px;">
</div>
<script type="text/javascript">
 var pager = new Pager('tablepaging', 10);
pager.init();
pager.showPageNav('pager', 'pageNavPosition');
pager.showPage(1);
pagerHtml += '<span style="color:red;" class="active">'
</script>


</div>


<div id="Pending Approval Notification" class="tabcontent" >
  <h3 style="margin-left:300px">Pending Approval Notification</h3>
  <table style="border: 1px solid black;border-collapse: collapse;margin-left:300px;width:78%;">
  <th style="border: 1px solid black;border-collapse: collapse;">User Id</th>
  <th style="border: 1px solid black;border-collapse: collapse;">User Name</th>
   <th style="border: 1px solid black;border-collapse: collapse;">Mobile Number</th>
   <th style="border: 1px solid black;border-collapse: collapse;">Parent Name</th>
   <th style="border: 1px solid black;border-collapse: collapse;">Money Order 1</th>
   <th style="border: 1px solid black;border-collapse: collapse;">Money Order 2</th>
   <th style="border: 1px solid black;border-collapse: collapse;">Money Order 3</th>
   <th style="border: 1px solid black;border-collapse: collapse;">Form Download</th>
   <th style="border: 1px solid black;border-collapse: collapse;">User Form</th>
  <th style="border: 1px solid black;border-collapse: collapse;">Pending Approval</th>
   <% 
  Connection con = DBConnection.getDBConnetion();
  Statement st = con.createStatement();
  ResultSet rs = st.executeQuery("select user_id,user_name,Mobile_No,parent,Approval from user_information where (Approval='"+0+"' OR Approval='"+5+"') AND user_id>=10000");
  while(rs.next()){
	  int approvalStatus = rs.getInt("Approval");
	  %>
  		<%-- <input type="hidden" id="form_id" value="<% out.print(rs.getString("parent").split("-")[0].trim());%>"> --%>
         <tr style="border: 1px solid black;border-collapse: collapse;">
		     <td style="border: 1px solid black;border-collapse: collapse;"><% out.print(rs.getString("user_id"));%></td>
		     <td style="border: 1px solid black;border-collapse: collapse;"><% out.print(rs.getString("user_name"));%></td>
		     <td style="border: 1px solid black;border-collapse: collapse;"><% out.print(rs.getString("Mobile_No"));%></td>
		     <%if(rs.getString("parent")!=null && approvalStatus==0){ %>
			     <td style="border: 1px solid black;border-collapse: collapse;"><% out.print(rs.getString("parent").split("-")[1]);%></td>
			     <td style="border: 1px solid black;border-collapse: collapse;"><a href="DownloadFormService?form_id=<% out.print(rs.getString("parent").split("-")[0]);%>&&form_no=1"><b>Money Order1</b></a></td>
			     <td style="border: 1px solid black;border-collapse: collapse;"><a href="DownloadFormService?form_id=<% out.print(rs.getString("parent").split("-")[0]);%>&&form_no=2"><b>Money Order2</b></a></td>
			     <td style="border: 1px solid black;border-collapse: collapse;"><a href="DownloadFormService?form_id=<% out.print(rs.getString("parent").split("-")[0]);%>&&form_no=3"><b>Money Order3</b></a></td>
			     <td style="border: 1px solid black;border-collapse: collapse;">Form Uploaded</td>
			     <td style="border: 1px solid black;border-collapse: collapse;"><a href="DownloadScannedForm?form_id=<% out.print(rs.getString("parent").split("-")[0]);%>"><b>Form Download</b></a></td>
			     <td style="border: 1px solid black;border-collapse: collapse;">
		    <!--  <a href='approved?userid=<%=rs.getLong("user_id")%>'>
		     <button style="margin-left:0px;" class="button1">Approve</button></a>
 -->  		     <a href='pendingedit?userid=<%=rs.getLong("user_id")%>'><button style="margin-left:0px;background-color: #1E90FF;color:white" class="button1">Approve/Edit</button></a></td>
  		
		     <%
		     }else if(approvalStatus == 5){
		    	 %>
		    	 <td style="border: 1px solid black;border-collapse: collapse;">NOT AVAILABLE</td>
			     <td style="border: 1px solid black;border-collapse: collapse;">NOT AVAILABLE</td>
			     <td style="border: 1px solid black;border-collapse: collapse;">NOT AVAILABLE</td>
			     <td style="border: 1px solid black;border-collapse: collapse;">NOT AVAILABLE</td>
			     <td style="border: 1px solid black;border-collapse: collapse;">NOT AVAILABLE</td>
			     <td style="border: 1px solid black;border-collapse: collapse;"><a href="create_new_user_form.jsp?new_user_id=<%=rs.getLong("user_id")%>"><button style="margin-left:0px;background-color: #1E90FF;color:white" class="button1">Create Form</button></a></td>
			     <td style="border: 1px solid black;border-collapse: collapse;">In progress</td>
		 	<%    }
		     %>
		     
  		</tr>
 
	<%    }
  %>
  
  </table>
 
  <p></p> 
</div>



<div id="My Income" class="tabcontent" style="overflow: scroll;">
  <h3 style="margin-left:300px">My Income</h3>
    <%
 
//logic for level 1

String qry="SELECT COUNT(admin_added) FROM user_information WHERE user_id >=10000 AND Approval!=0 AND No_of_Children=80";
Connection con1 = DBConnection.getDBConnetion();
Statement st1 = con1.createStatement();
ResultSet rss=st1.executeQuery(qry);
long result=0;

if(rss.next()){
	result=(rss.getInt(1)*6000);
	

} 





//first user or admin added user
String qry1="SELECT COUNT(admin_added) FROM user_information WHERE user_id >=10000 AND admin_added IS NOT NULL AND parent IS NOT NULL AND Approval!=0";
Connection con2 = DBConnection.getDBConnetion();
Statement st2 = con2.createStatement();
ResultSet rss1=st2.executeQuery(qry1);
long resultNew=0;

if(rss1.next()){
	resultNew=(rss1.getInt(1)*2000);
	

}


//logic for level 2
String sp="SELECT user_id,super_parent,parent FROM user_information WHERE user_id >=10000 AND parent IS NOT NULL AND super_parent IS NOT NULL AND Approval!=0  AND No_of_Children=80";


Connection con3 = DBConnection.getDBConnetion();
Statement st3 = con3.createStatement();
ResultSet rss2=st3.executeQuery(sp);



long spid=0;
long pid=0;
long userId=0;
while( rss2.next()){
	spid = Long.parseLong(rss2.getString("super_parent").split("-")[0]);
	pid = Long.parseLong(rss2.getString("parent").split("-")[0]);
	userId = rss2.getLong("user_id");




	
	if(spid<10000 && pid>=10000){
		
		Connection con5 = DBConnection.getDBConnetion();
		Statement st5 = con5.createStatement();
		st5.executeUpdate("UPDATE user_information SET nosuper=1 where user_id='"+userId+"' AND maxlimit=1" );
		
		
		
	}
}

String qry3="SELECT COUNT(nosuper) FROM user_information WHERE user_id >=10000 AND nosuper IS NOT NULL  AND No_of_Children=80";
Connection con4 = DBConnection.getDBConnetion();
Statement st4 = con4.createStatement();
ResultSet rss3=st4.executeQuery(qry3);
long resultNew1=0;

if(rss3.next()){
	resultNew1=(rss3.getInt(1)*4000);
	

}

//logic for level 3
String la="SELECT user_id,super_parent,parent FROM user_information WHERE user_id >=10000 AND parent IS NOT NULL AND super_parent IS NOT NULL";


Connection con5 = DBConnection.getDBConnetion();
Statement st5 = con5.createStatement();
ResultSet rss5=st5.executeQuery(la);



long spid5=0;
long pid5=0;
long userId5=0;
while( rss5.next()){
	spid5=Long.parseLong(rss5.getString("super_parent").split("-")[0]);
	pid5 = Long.parseLong(rss5.getString("parent").split("-")[0]);
	userId5 = rss5.getLong("user_id");



	
	if(spid5>=10000 && pid>=10000){
		
		Connection con6 = DBConnection.getDBConnetion();
		Statement st6 = con6.createStatement();
		st6.executeUpdate("UPDATE user_information SET last=1 where user_id='"+userId5+"' AND maxlimit=1  AND No_of_Children=80" );
		
		
		
	}
}

 String qry7="SELECT COUNT(last) FROM user_information WHERE user_id >=10000 AND last IS NOT NULL";
Connection con7 = DBConnection.getDBConnetion();
Statement st7 = con7.createStatement();
ResultSet rss7=st7.executeQuery(qry7);
long resultNew2=0;

if(rss7.next()){
	resultNew2=(rss7.getInt(1)*2000);
}

//total income for admin
 long value=0;
 value=result+resultNew+resultNew1+resultNew2;
/* out.println("Total income: "+value); */


  
  
%> 
  
 <center>
    <h3 style="margin-left:300px">
    <%-- Total Income:&nbsp;<%out.println("Rs."+value); %>   --%>
    <img src="images/moneybag.png" width="180px" height="187px"><br>
    <% out.println("Hi ");%>${admin_name}<br/>
		<% out.println("Your total income is");%><p style="color: orange;"> &#8377;<%out.println(value);%></p><br/>
		
		
    </h3>
  </center>
  
    </div>

<div id="Expired User Approval" class="tabcontent" style="overflow: scroll;">
  <h3 style="margin-left:300px">Expired User Approval</h3>
  <table style="border: 1px solid black;border-collapse: collapse;margin-left:300px;width:78%;">
  <th style="border: 1px solid black;border-collapse: collapse;">User Id</th>
  <th style="border: 1px solid black;border-collapse: collapse;">User Name</th>
   <th style="border: 1px solid black;border-collapse: collapse;">Mobile Number</th>
<!--   <th style="border: 1px solid black;border-collapse: collapse;">Parent Name</th>
    <th style="border: 1px solid black;border-collapse: collapse;">Money Order 1</th>
   <th style="border: 1px solid black;border-collapse: collapse;">Money Order 2</th>
   <th style="border: 1px solid black;border-collapse: collapse;">Money Order 3</th>
   <th style="border: 1px solid black;border-collapse: collapse;">Form Download</th> -->
  <th style="border: 1px solid black;border-collapse: collapse;">Pending Approval</th>
   <% 
  Connection connex = DBConnection.getDBConnetion();
  Statement stex = connex.createStatement();
  ResultSet rsex = stex.executeQuery("select user_id,user_name,Mobile_No,parent from user_information where Approval='"+3+"' AND user_id>=10000");
  while(rsex.next()){
	  %>
  		<%-- <input type="hidden" id="form_id" value="<% out.print(rs.getString("parent").split("-")[0].trim());%>"> --%>
         <tr style="border: 1px solid black;border-collapse: collapse;">
		     <td style="border: 1px solid black;border-collapse: collapse;"><% out.print(rsex.getString("user_id"));%></td>
		     <td style="border: 1px solid black;border-collapse: collapse;"><% out.print(rsex.getString("user_name"));%></td>
		     <td style="border: 1px solid black;border-collapse: collapse;"><% out.print(rsex.getString("Mobile_No"));%></td>
		     
		     <td style="border: 1px solid black;border-collapse: collapse;">
		    <!--  <a href='approved?userid=<%=rsex.getLong("user_id")%>'>
		     <button style="margin-left:0px;" class="button1">Approve</button></a>
 -->  		     <a href='expireduserapproval?userid=<%=rsex.getLong("user_id")%>'><button style="margin-left:0px;background-color: #1E90FF;color:white" class="button1">Approve/Edit</button></a></td>
  		
  		</tr>
 
	<%    }
  %>
  
  </table>
  
 
  <p></p> 
</div>



<div id="Request Approval" class="tabcontent" style="overflow: scroll;">
  <h3 style="margin-left:300px">Request User Approval</h3>
  <table style="border: 1px solid black;border-collapse: collapse;margin-left:300px;width:78%;">
  <th style="border: 1px solid black;border-collapse: collapse;">User Id</th>
  <th style="border: 1px solid black;border-collapse: collapse;">User Name</th>
   <th style="border: 1px solid black;border-collapse: collapse;">Mobile Number</th>
  <th style="border: 1px solid black;border-collapse: collapse;">Pending Approval</th>
   <% 
   try{
  Connection requestConn = DBConnection.getDBConnetion();
  Statement stex1 = requestConn.createStatement();
  ResultSet rsex1 = stex1.executeQuery("select user_id,user_name,Mobile_No from user_information where Approval=4 AND user_id>=10000");
  while(rsex1.next()){
	  %>
  		
         <tr style="border: 1px solid black;border-collapse: collapse;">
		     <td style="border: 1px solid black;border-collapse: collapse;"><% out.print(rsex1.getString("user_id"));%></td>
		     <td style="border: 1px solid black;border-collapse: collapse;"><% out.print(rsex1.getString("user_name"));%></td>
		     <td style="border: 1px solid black;border-collapse: collapse;"><% out.print(rsex1.getString("Mobile_No"));%></td>
		     
		     <td style="border: 1px solid black;border-collapse: collapse;">
		     <a href='PendingRequest?new_user_id=<% out.print(rsex1.getLong("user_id"));%>'><button style="margin-left:0px;background-color: #1E90FF;color:white" class="button1">Approve/Edit</button></a></td>
  		
  		</tr>
 
	<%    }}
   catch(SQLException e){
	   
   }
  %>
  
  </table>
</div>



<div id="Add New User" class="tabcontent" style="overflow: scroll;">
<%--   <h2 style="text-align: center;">PNR Validation</h2><br/><br/><br/>
  <center>
 <form action="verifyOrder" method="post" onsubmit="return ValidateNo2(event);">
	<label  style="font-size: 1.17em; "><b>Enter PNR</b> </label>&nbsp;&nbsp;
	<input type="text" name="moneyorder" id="pnrValidationID"  onkeypress="checkNum2()" required min="0" max="999999999999999999" maxlength="18" placeholder="18 Digit PNR Number" style="font-size: 1.17em;">&nbsp&nbsp
	<input class="button" type="Submit" id="go" value="Verify"/>
<h2>${verify_msg}</h2>
</form> --%>
<center>
<div class="body-content">
<div class="module">
<br><br><br>
<img src="images/adduser.png" width="80px" height="70px" style="margin-top:-56px;margin-left:264px"/>
<h1 style="margin-left: 250px;color:black;margin-top:2px;font-family:serif">Add New User</h1>
<br/>
</center>
<div id="hid" style="margin-left:90px; margin-top:-60px">
<div class="wrapper">
<form class="login" action="addMember" style="margin-top:5px;margin-left:200px" method="post" onsubmit="return addnewuservalidations()">
<label class="tex" style="font-size: 18px;font-weight:500px;fant-family:serif">Name </label>
<input type="text" name="userName" required><br/>
<select required name="gender" id="gend">
<option style="font-family:none;font-size: 18px;font-weight:500px;">Select Gender</option>
<option style="font-family:serif;font-size: 18px">Male</option>
<option style="font-family:serif;font-size: 18px">Female</option>
<option style="font-family:serif;font-size: 18px">LGBT</option>
</select><br/><br/>
<label class="tex" style="font-size: 18px;fant-family:serif">Address </label>
<input type="text" name="userAddress" placeholder="" required> <br/>
<input type="text" onkeypress="checkNum3()" id="pinc" name="pinCode" min="0" max="999999" maxlength="6" placeholder="Pin Code" required><br/>
<label class="tex" style="font-size: 18px;fant-family:serif " required>Phone Number </label>
<input type="text" id="addUserMobileNo" name="phoneNo" onkeypress="checkNum1()" required min="0" max="9999999999" maxlength="10" placeholder="+91" required> 
<br/><input class="button" type="submit" style="margin-left: 100px;margin-top:30px" value="Submit"/>
</form>


</p>
</div>
</div>
</div>
<script>
function addnewadminvalidations(){
	 var phone1 = document.getElementById("addAdminMobileNo").value;
	var pin1 = document.getElementById("pinco").value;
	var ph11 = /^(([0-9]*)|0)?$/;
	if (!pin1.match(ph11)) {
		alert("Pincode should contain only numbers!!! Please enter a valid Pincode");
		document.getElementById("pinco").value='';
		 return false;
    }
    if (!phone1.match(ph11)) {
		alert("Mobile no should contain only numbers!!! Please enter a valid Mobile no");
		document.getElementById("addAdminMobileNo").value='';
		 return false;
    } 

  }
  
  
function addnewuservalidations(){
	var phon = document.getElementById("addUserMobileNo").value;
	var pin = document.getElementById("pinc").value;
	var gend = document.getElementById("gend").value;
	var ph1 = /^(([0-9]*)|0)?$/;
	 var gende = /^(Male|Female|LGBT)?$/;
	 if (!gend.match(gende)) {
			alert("Please select Gender!!!");
			document.getElementById("gend").value='';
			 return false;
	}
	 if (!pin.match(ph1)) {
			alert("Pincode should contain only numbers!!! Please enter a valid Pincode");
			document.getElementById("pinc").value='';
			 return false;
	}
	 if (!phon.match(ph1)) {
			alert("Mobile no should contain only numbers!!! Please enter a valid Mobile no");
			document.getElementById("addUserMobileNo").value='';
			 return false;
	    } 

	
}
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
function checkNum3(){
     var ch = String.fromCharCode(event.keyCode);
     var filter = /[0-9]/;   
     if(!filter.test(ch)){
          event.returnValue = false;
     }
}
</script>

<script>
function checkNum4(){
     var ch = String.fromCharCode(event.keyCode);
     var filter = /[0-9]/;   
     if(!filter.test(ch)){
          event.returnValue = false;
     }
}
</script>





<script>
function autocomplete(inp, arr) {
  /*the autocomplete function takes two arguments,
  the text field element and an array of possible autocompleted values:*/
  var currentFocus;
  /*execute a function when someone writes in the text field:*/
  inp.addEventListener("input", function(e) {
      var a, b, i, val = this.value;
      /*close any already open lists of autocompleted values*/
      closeAllLists();
      if (!val) { return false;}
      currentFocus = -1;
      /*create a DIV element that will contain the items (values):*/
      a = document.createElement("DIV");
      a.setAttribute("id", this.id + "autocomplete-list");
      a.setAttribute("class", "autocomplete-items");
      /*append the DIV element as a child of the autocomplete container:*/
      this.parentNode.appendChild(a);
      /*for each item in the array...*/
      for (i = 0; i < arr.length; i++) {
        /*check if the item starts with the same letters as the text field value:*/
        if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
          /*create a DIV element for each matching element:*/
          b = document.createElement("DIV");
          /*make the matching letters bold:*/
          b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
          b.innerHTML += arr[i].substr(val.length);
          /*insert a input field that will hold the current array item's value:*/
          b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
          /*execute a function when someone clicks on the item value (DIV element):*/
          b.addEventListener("click", function(e) {
              /*insert the value for the autocomplete text field:*/
              inp.value = this.getElementsByTagName("input")[0].value;
              /*close the list of autocompleted values,
              (or any other open lists of autocompleted values:*/
              closeAllLists();
          });
          a.appendChild(b);
        }
      }
  });
  /*execute a function presses a key on the keyboard:*/
  inp.addEventListener("keydown", function(e) {
      var x = document.getElementById(this.id + "autocomplete-list");
      if (x) x = x.getElementsByTagName("div");
      if (e.keyCode == 40) {
        /*If the arrow DOWN key is pressed,
        increase the currentFocus variable:*/
        currentFocus++;
        /*and and make the current item more visible:*/
        addActive(x);
      } else if (e.keyCode == 38) { //up
        /*If the arrow UP key is pressed,
        decrease the currentFocus variable:*/
        currentFocus--;
        /*and and make the current item more visible:*/
        addActive(x);
      } else if (e.keyCode == 13) {
        /*If the ENTER key is pressed, prevent the form from being submitted,*/
        e.preventDefault();
        if (currentFocus > -1) {
          /*and simulate a click on the "active" item:*/
          if (x) x[currentFocus].click();
        }
      }
  });
  function addActive(x) {
    /*a function to classify an item as "active":*/
    if (!x) return false;
    /*start by removing the "active" class on all items:*/
    removeActive(x);
    if (currentFocus >= x.length) currentFocus = 0;
    if (currentFocus < 0) currentFocus = (x.length - 1);
    /*add class "autocomplete-active":*/
    x[currentFocus].classList.add("autocomplete-active");
  }
  function removeActive(x) {
    /*a function to remove the "active" class from all autocomplete items:*/
    for (var i = 0; i < x.length; i++) {
      x[i].classList.remove("autocomplete-active");
    }
  }
  function closeAllLists(elmnt) {
    /*close all autocomplete lists in the document,
    except the one passed as an argument:*/
    var x = document.getElementsByClassName("autocomplete-items");
    for (var i = 0; i < x.length; i++) {
      if (elmnt != x[i] && elmnt != inp) {
        x[i].parentNode.removeChild(x[i]);
      }
    }
  }
  /*execute a function when someone clicks in the document:*/
  document.addEventListener("click", function (e) {
      closeAllLists(e.target);
  });
}

/*An array containing all the country names in the world:*/
var countries = [
"Anantapur",
"Chittoor",
"East Godavari",
"Guntur",
"Krishna",
"Kurnool",
"Prakasam",
"Srikakulam",
"Sri Potti Sriramulu Nellore",
"Visakhapatnam",
"Vizianagaram",
"West Godavari",
"Y.S.R.",
"Arunachal Pradesh",
"Anjaw",
"Changlang",
"Dibang Valley (Upper Dibang Valley)",
"East Kameng",
"East Siang",
"Kra Daadi ( Kurung Kumey)",
"Kurung Kumey",
"Lohit",
"Longding ( Tirap)",
"Lower Dibang Valley",
"Lower Siang (West Siang & East Siang)",
"Lower Subansiri",
"Namsai ( Lohit)",
"Papum Pare",
"Siang ( West Siang & East Siang)",
"Tawang",
"Tirap",
"Upper Siang",
"Upper Subansiri",
"West Kameng",
"West Siang",
"Assam",
"Baksa",
"Barpeta",
"Biswanath ( Sonitpur)",
"Bongaigaon",
"Cachar",
"Charaideo ( Sivasagar)",
"Chirang",
"Darrang",
"Dhemaji",
"Dhubri",
"Dibrugarh",
"Dima Hasao",
"Goalpara",
"Golaghat",
"Hailakandi",
"Hojai ( Nagaon)",
"Jorhat",
"Kamrup",
"Kamrup Metropolitan",
"Karbi Anglong",
"Karimganj",
"Kokrajhar",
"Lakhimpur",
"Majuli ( Jorhat)",
"Morigaon",
"Nagaon",
"Nalbari",
"Sivasagar",
"Sonitpur",
"South Salmara-Mankachar ( Dhubri)",
"Tinsukia",
"Udalguri",
"West Karbi Anglong ( Karbi Anglong)",
"Bihar",
"Araria",
"Arwal",
"Aurangabad",
"Banka",
"Begusarai",
"Bhagalpur",
"Bhojpur",
"Buxar",
"Darbhanga",
"Gaya",
"Gopalganj",
"Jamui",
"Jehanabad",
"Kaimur",
"Katihar",
"Khagaria",
"Kishanganj",
"Lakhisarai",
"Madhepura",
"Madhubani",
"Munger",
"Muzaffarpur",
"Nalanda",
"Nawada",
"Pashchim Champaran",
"Patna",
"Purba Champaran",
"Purnia",
"Rohtas",
"Saharsa",
"Samastipur",
"Saran",
"Sheikhpura",
"Sheohar",
"Sitamarhi",
"Siwan",
"Supaul",
"Vaishali",
"Chandigarh",
"Chandigarh",
"Chhattisgarh",
"Balod (← Durg)",
"Baloda Bazar ( Raipur)",
"Balrampur ( Surguja)",
"Bastar",
"Bemetara (Durg)",
"Bijapur",
"Bilaspur",
"Dakshin Bastar Dantewada",
"Dhamtari",
"Durg",
"Gariaband ( Raipur)",
"Janjgir-Champa",
"Jashpur",
"Kabirdham (Kabeerdham)",
"Kondagaon ( Bastar)",
"Korba",
"Koriya",
"Mahasamund",
"Mungeli ( Bilaspur)",
"Narayanpur",
"Raigarh",
"Raipur",
"Rajnandgaon",
"Sukma (← Dakshin Bastar Dantewada)",
"Surajpur (Surguja)",
"Surguja",
"Uttar Bastar Kanker",
"Dadra & Nagar Haveli",
"Dadra & Nagar Haveli",
"Daman & Diu",
"Daman",
"Diu",
"Delhi",
"Central",
"East",
"New Delhi",
"North",
"North East",
"North West",
"Shahdara ( East & North East)",
"South",
"South East (South)",
"South West",
"West",
"Goa",
"North Goa",
"South Goa",
"Gujarat",
"Ahmadabad",
"Amreli",
"Anand",
"Aravalli ",
"Banas Kantha",
"Bharuch",
"Bhavnagar",
"Botad ( Ahmadabad & Bhavnagar)",
"Chhota Udaipur ( Vadodara)",
"Devbhumi Dwarka (Jamnagar)",
"Dohad",
"Gandhinagar",
"Gir Somnath ( Junagadh)",
"Jamnagar",
"Junagadh",
"Kachchh",
"Kheda",
"Mahesana",
"Mahisagar ( Kheda & Panch Mahals)",
"Morbi ( Rajkot & Surendranagar)",
"Narmada",
"Navsari",
"Panch Mahals",
"Patan",
"Porbandar",
"Rajkot",
"Sabar Kantha",
"Surat",
"Surendranagar",
"Tapi",
"The Dangs",
"Vadodara",
"Valsad",
"Haryana",
"Ambala",
"Bhiwani",
"Charkhi Dadri (Bhiwani)",
"Faridabad",
"Fatehabad",
"Gurgaon",
"Hisar",
"Jhajjar",
"Jind",
"Kaithal",
"Karnal",
"Kurukshetra",
"Mahendragarh",
"Mewat",
"Palwal",
"Panchkula",
"Panipat",
"Rewari",
"Rohtak",
"Sirsa",
"Sonipat",
"Yamunanagar",
"Himachal Pradesh",
"Bilaspur",
"Chamba",
"Hamirpur",
"Kangra",
"Kinnaur",
"Kullu",
"Lahul & Spiti",
"Mandi",
"Shimla",
"Sirmaur",
"Solan",
"Una",
"Jammu & Kashmir",
"Anantnag",
"Badgam",
"Bandipore",
"Baramula",
"Doda",
"Ganderbal",
"Jammu",
"Kargil",
"Kathua",
"Kishtwar",
"Kulgam",
"Kupwara",
"Leh",
"Pulwama",
"Punch",
"Rajouri",
"Ramban",
"Reasi",
"Samba",
"Shupiyan",
"Srinagar",
"Udhampur",
"Jharkhand",
"Bokaro",
"Chatra",
"Deoghar",
"Dhanbad",
"Dumka",
"Garhwa",
"Giridih",
"Godda",
"Gumla",
"Hazaribagh",
"Jamtara",
"Khunti",
"Kodarma",
"Latehar",
"Lohardaga",
"Pakur",
"Palamu",
"Pashchimi Singhbhum",
"Purbi Singhbhum",
"Ramgarh",
"Ranchi",
"Sahibganj",
"Saraikela-kharsawan",
"Simdega",
"Karnataka",
"Bagalkot",
"Bangalore",
"Bangalore Rural",
"Belgaum",
"Bellary",
"Bidar",
"Bijapur",
"Chamarajanagar",
"Chikkaballapura",
"Chikmagalur",
"Chitradurga",
"Dakshina Kannada",
"Davanagere",
"Dharwad",
"Gadag",
"Gulbarga",
"Hassan",
"Haveri",
"Kodagu",
"Kolar",
"Koppal",
"Mandya",
"Mysore",
"Raichur",
"Ramanagara",
"Shimoga",
"Tumkur",
"Udupi",
"Uttara Kannada",
"Yadgir",
"Kerala",
"Alappuzha",
"Ernakulam",
"Idukki",
"Kannur",
"Kasaragod",
"Kollam",
"Kottayam",
"Kozhikode",
"Malappuram",
"Palakkad",
"Pathanamthitta",
"Thiruvananthapuram",
"Thrissur",
"Wayanad",
"Lakshadweep",
"Lakshadweep",
"Madhya Pradesh",
"Agar Malwa ( Shajapur)",
"Alirajpur",
"Anuppur",
"Ashoknagar",
"Balaghat",
"Barwani",
"Betul",
"Bhind",
"Bhopal",
"Burhanpur",
"Chhatarpur",
"Chhindwara",
"Damoh",
"Datia",
"Dewas",
"Dhar",
"Dindori",
"Guna",
"Gwalior",
"Harda",
"Hoshangabad",
"Indore",
"Jabalpur",
"Jhabua",
"Katni",
"Khandwa (East Nimar)",
"Khargone (West Nimar)",
"Mandla",
"Mandsaur",
"Morena",
"Narsimhapur",
"Neemuch",
"Panna",
"Raisen",
"Rajgarh",
"Ratlam",
"Rewa",
"Sagar",
"Satna",
"Sehore",
"Seoni",
"Shahdol",
"Shajapur",
"Sheopur",
"Shivpuri",
"Sidhi",
"Singrauli",
"Tikamgarh",
"Ujjain",
"Umaria",
"Vidisha",
"Maharashtra",
"Ahmadnagar",
"Akola",
"Amravati",
"Aurangabad",
"Bhandara",
"Bid",
"Buldana",
"Chandrapur",
"Dhule",
"Gadchiroli",
"Gondiya",
"Hingoli",
"Jalgaon",
"Jalna",
"Kolhapur",
"Latur",
"Mumbai",
"Mumbai Suburban",
"Nagpur",
"Nanded",
"Nandurbar",
"Nashik",
"Osmanabad",
"Palghar (Thane)",
"Parbhani",
"Pune",
"Raigad (Raigarh)",
"Ratnagiri",
"Sangli",
"Satara",
"Sindhudurg",
"Solapur",
"Thane",
"Wardha",
"Washim",
"Yavatmal",
"Manipur",
"Bishnupur",
"Chandel",
"Churachandpur",
"Imphal East",
"Imphal West",
"Jiribam ( Imphal East)",
"Kakching ( Thoubal)",
"Kamjong ( Ukhrul)",
"Kangpokpi ( Senapati)",
"Noney (Tamenglong)",
"Pherzawl ( Churachandpur)",
"Senapati",
"Tamenglong",
"Tengnoupal ( Chandel)",
"Thoubal",
"Ukhrul",
"Meghalaya",
"East Garo Hills",
"East Jaintia Hills ( Jaintia Hills)",
"East Khasi Hills",
"North Garo Hills ( East Garo Hills)",
"Ribhoi",
"South Garo Hills",
"South West Garo Hills ( West Garo Hills)",
"South West Khasi Hills ( West Khasi Hills)",
"West Garo Hills",
"West Jaintia Hills ( Jaintia Hills)",
"West Khasi Hills",
"Mizoram",
"Aizawl",
"Champhai",
"Kolasib",
"Lawngtlai",
"Lunglei",
"Mamit",
"Saiha",
"Serchhip",
"Nagaland",
"Dimapur",
"Kiphire",
"Kohima",
"Longleng",
"Mokokchung",
"Mon",
"Peren",
"Phek",
"Tuensang",
"Wokha",
"Zunheboto",
"Odisha (Orissa)",
"Anugul",
"Balangir",
"Baleshwar",
"Bargarh",
"Baudh",
"Bhadrak",
"Cuttack",
"Debagarh",
"Dhenkanal",
"Gajapati",
"Ganjam",
"Jagatsinghapur",
"Jajapur",
"Jharsuguda",
"Kalahandi",
"Kandhamal",
"Kendrapara",
"Kendujhar",
"Khordha",
"Koraput",
"Malkangiri",
"Mayurbhanj",
"Nabarangapur",
"Nayagarh",
"Nuapada",
"Puri",
"Rayagada",
"Sambalpur",
"Subarnapur",
"Sundargarh",
"Puducherry (Pondicherry)",
"Karaikal",
"Mahe",
"Puducherry",
"Yanam",
"Punjab",
"Amritsar",
"Barnala",
"Bathinda",
"Faridkot",
"Fatehgarh Sahib",
"Fazilka ( Firozpur)",
"Firozpur",
"Gurdaspur",
"Hoshiarpur",
"Jalandhar",
"Kapurthala",
"Ludhiana",
"Mansa",
"Moga",
"Muktsar",
"Pathankot ( Gurdaspur)",
"Patiala",
"Rupnagar",
"Sahibzada Ajit Singh Nagar",
"Sangrur",
"Shahid Bhagat Singh Nagar",
"Tarn Taran",
"Rajasthan",
"Ajmer",
"Alwar",
"Banswara",
"Baran",
"Barmer",
"Bharatpur",
"Bhilwara",
"Bikaner",
"Bundi",
"Chittaurgarh",
"Churu",
"Dausa",
"Dhaulpur",
"Dungarpur",
"Ganganagar",
"Hanumangarh",
"Jaipur",
"Jaisalmer",
"Jalor",
"Jhalawar",
"Jhunjhunu",
"Jodhpur",
"Karauli",
"Kota",
"Nagaur",
"Pali",
"Pratapgarh",
"Rajsamand",
"Sawai Madhopur",
"Sikar",
"Sirohi",
"Tonk",
"Udaipur",
"Sikkim",
"East District",
"North District",
"South District",
"West District",
"Tamil Nadu",
"Ariyalur",
"Chennai",
"Coimbatore",
"Cuddalore",
"Dharmapuri",
"Dindigul",
"Erode",
"Kanchipuram",
"Kanniyakumari",
"Karur",
"Krishnagiri",
"Madurai",
"Nagapattinam",
"Namakkal",
"Perambalur",
"Pudukkottai",
"Ramanathapuram",
"Salem",
"Sivaganga",
"Thanjavur",
"Theni",
"The Nilgiris",
"Thiruvallur",
"Thiruvarur",
"Thoothukkudi",
"Tiruchirappalli",
"Tirunelveli",
"Tiruppur",
"Tiruvannamalai",
"Vellore",
"Viluppuram",
"Virudhunagar",
"Telangana",
"Adilabad",
"Bhadradri Kothagudem ( Khammam)",
"Hyderabad",
"Jagtial ( Karimnagar)",
"Jangaon ( Warangal & Nalgonda)",
"Jayashankar Bhupalpally (Warangal, Karimnagar & Khammam)",
"Jogulamba Gadwal ( Mahabubnagar)",
"Kamareddy ( Nizamabad)",
"Karimnagar",
"Khammam",
"Kumaram Bheem Asifabad (Adilabad)",
"Mahabubabad ( Warangal & Khammam)",
"Mahabubnagar",
"Mancherial ( Adilabad)",
"Medak",
"Medchal Malkajgiri ( Rangareddy)",
"Nagarkurnool ( Mahabubnagar)",
"Nalgonda",
"Nirmal ( Adilabad)",
"Nizamabad",
"Peddapalli ( Karimnagar)",
"Rajanna Sircilla ( Karimnagar)",
"Rangareddy",
"Sangareddy ( Medak)",
"Siddipet ( Medak, Karimnagar & Warangal)",
"Suryapet ( Nalgonda)",
"Vikarabad ( Rangareddy & Mahabubnagar)",
"Wanaparthy ( Mahabubnagar)",
"Warangal Rural ( Warangal)",
"Warangal Urban ( Warangal & Karimnagar)",
"Yadadri Bhuvanagiri ( Nalgonda)",
"Tripura",
"Dhalai",
"Gomati ( South Tripura)",
"Khowai ( West Tripura)",
"North Tripura",
"Sipahijala ( West Tripura)",
"South Tripura",
"Unokoti ( North Tripura)",
"West Tripura",
"Uttarakhand (Uttaranchal)",
"Almora",
"Bageshwar",
"Chamoli",
"Champawat",
"Dehradun",
"Garhwal",
"Hardwar",
"Nainital",
"Pithoragarh",
"Rudraprayag",
"Tehri Garhwal",
"Udham Singh Nagar",
"Uttarkashi",
"Uttar Pradesh",
"Agra",
"Aligarh",
"Allahabad",
"Ambedkar Nagar",
"Amethi ( Sultanpur & Rae Bareli)",
"Amroha",
"Auraiya",
"Azamgarh",
"Baghpat",
"Bahraich",
"Ballia",
"Balrampur",
"Banda",
"Bara Banki",
"Bareilly",
"Basti",
"Bhadohi (Sant Ravidas Nagar)",
"Bijnor",
"Budaun",
"Bulandshahr",
"Chandauli",
"Chitrakoot",
"Deoria",
"Etah",
"Etawah",
"Faizabad",
"Farrukhabad",
"Fatehpur",
"Firozabad",
"Gautam Buddha Nagar",
"Ghaziabad",
"Ghazipur",
"Gonda",
"Gorakhpur",
"Hamirpur",
"Hapur ( Ghaziabad)",
"Hardoi",
"Hathras (Mahamaya Nagar)",
"Jalaun",
"Jaunpur",
"Jhansi",
"Kannauj",
"Kanpur Dehat",
"Kanpur Nagar",
"Kasganj",
"Kaushambi",
"Kheri",
"Kushinagar",
"Lalitpur",
"Lucknow",
"Mahoba",
"Mahrajganj",
"Mainpuri",
"Mathura",
"Mau",
"Meerut",
"Mirzapur",
"Moradabad",
"Muzaffarnagar",
"Pilibhit",
"Pratapgarh",
"Rae Bareli",
"Rampur",
"Saharanpur",
"Sambhal ( Moradabad & Budaun)",
"Sant Kabir Nagar",
"Shahjahanpur",
"Shamli (← Muzaffarnagar)",
"Shrawasti",
"Siddharthnagar",
"Sitapur",
"Sonbhadra",
"Sultanpur",
"Unnao",
"Varanasi",
"West Bengal",
"Alipurduar ( Jalpaiguri)",
"Bankura",
"Birbhum",
"Cooch Behar (Koch Bihar)",
"Dakshin Dinajpur",
"Darjiling",
"Hooghly (Hugli)",
"Howrah (Haora)",
"Jalpaiguri",
"Jhargram (Paschim Medinipur)",
"Kalimpong ( Darjiling)",
"Kolkata",
"Maldah",
"Murshidabad",
"Nadia",
"North Twenty Four Parganas",
"Paschim Bardhaman ( Bardhaman)",
"Paschim Medinipur",
"Purba Bardhaman ( Bardhaman)",
"Purba Medinipur",
"Puruliya",
"South Twenty Four Parganas",
"Uttar Dinajpur",];

/*initiate the autocomplete function on the "myInput" element, and pass along the countries array as possible autocomplete values:*/
autocomplete(document.getElementById("myInput"), countries);
</script>


</div>


<!--  -->


<!-- <label  style=" font-size: 1.17em; "><b>Enter PNR</b> </label>&nbsp;&nbsp;
<input type="text" onkeypress="checkNum2()" required min="0" max="999999999999999999" maxlength="18" placeholder="18 Digit PNR Number" style="font-size: 1.17em;">&nbsp&nbsp<button class="button" type="Submit" id="go" >Verify</button>
</br></br></br></br>




<label  style="font-size: 1.17em; font-family: sans-serif;"><b>Enter PNR</b> </label>&nbsp;&nbsp;
<input type="text" onkeypress="checkNum2()" required min="0" max="999999999999999999" maxlength="18" placeholder="18 Digit PNR Number" style="font-size: 1.17em;">&nbsp&nbsp<button class="button" type="Submit" id="go" >Verify</button></br></br></br></br>
 -->
<!-- <a href="adduserform.jsp"><button class="button1" type="Submit" id="go" >Add User</button></a>
 -->
 </center>
</div>
<div id="Add New Admin" class="tabcontent">
<div class="body-content">
<div class="module">
<br><br><br>
<img src="images/adduser.png" width="80px" height="80px" style="margin-top:-26px;margin-left:720px"/>
<h1 style="margin-left: 650px;color:black;margin-top:2px;font-family:serif">Add New Admin</h1>
 
<br/>

<div id="hid" style="margin-left:90px; margin-top:-60px">
<div class="wrapper">
<form class="login" action="addnewAdmin" style="margin-top:5px;margin-left:200px;height:419px" method="post" onsubmit="return addnewadminvalidations()">
<label class="tex" style="font-size: 18px;fant-family:serif">Name </label>
<input type="text" name="userName" required><br/>
<label class="tex" style="font-size: 18px;fant-family:serif">Address </label>
<input type="text" name="userAddress" placeholder="" required> <br/>
<input type="text" onkeypress="checkNum3()" id="pinco" name="pinCode" min="0" max="999999" maxlength="6" placeholder="Pin Code" required><br/>
<label class="tex" style="font-size: 18px;fant-family:serif " required>Phone Number </label>
<input type="text" id="addAdminMobileNo" name="phoneNo" onkeypress="checkNum1()" required min="0" max="9999999999" maxlength="10" placeholder="+91" required>
<br/><input class="button" type="submit" style="margin-left: 100px;margin-top:30px" value="Submit"/>
</form>
 
</div>
  <p></p>
</div>





 <script>
function checkNum2(){
     var ch = String.fromCharCode(event.keyCode);
     var filter = /[0-9]/;   
     if(!filter.test(ch)){
          event.returnValue = false;
     }
}
</script>



<div id="Upload Form For The User" class="tabcontent">

<div class="row">
  <div class="column left" >
    

<center><h3>Member Details</h3>
  
  <input type="text" id="position1" name="position1"></br>
 
  <input type="text" id="position2" name="position2" ></br>
  <input type="text" id="position3" name="position3"></br>
  <input type="text" id="position4" name="position4">
</center>
    
  </div>
  <div class= "column right" >
  

  
<center>
  <h3>PNR Status</h3>
  <input type="text" id="position1" name="position1"/></br>
  <input type="text" id="position2" name="position2" /></br>
  <input type="text" id="position3" name="position3"/></br>
  <input type="text" id="position4" name="position4"/>
</center>

 



  </div>
</div>
<div class="row" style="margin-left:300px">
 
<center>
        <h3>User Details</h3>
			  <input type="text1" id="position2" placeholder="Name" name="position2" >&nbsp
			 <input type="text1" id="position3" placeholder="Address" name="position3">&nbsp
			  <input type="text1" id="position2" placeholder="Pincode" name="position2" >&nbsp
			 <input type="text1" id="position3" placeholder="Phone Number" name="position3"></br>
			  <input type="text1" id="position4" placeholder="Name" name="position4">&nbsp
			  <input type="text1" id="position4" placeholder="Address" name="position4">&nbsp
			 <input type="text1" id="position4" placeholder="Pincode" name="position4">&nbsp
			  <input type="text1" id="position4" placeholder="Phone Number" name="position4"></br>
			  <input type="text1" id="position4" placeholder="Name" name="position4">&nbsp
			    <input type="text1" id="position4" placeholder="Address" name="position4">&nbsp
			     <input type="text1" id="position4" placeholder="Pincode" name="position4">&nbsp
			    <input type="text1" id="position4" placeholder="Phone Number" name="position4"></br>
			     <input type="text1" id="position4" placeholder="Name" name="position4">&nbsp
			  <input type="text1" id="position4" placeholder="Address" name="position4">&nbsp
			   <input type="text1" id="position4" placeholder="Pincode" name="position4">&nbsp
			  <input type="text1" id="position4" placeholder="Phone Number" name="position4">
			  <br/>
			<button class="button">Submit</button>
</center>



  </div>
<br/><br/>  
  <p></p>
</div>
</div>


<script>
function openCity(evt, cityName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(cityName).style.display = "block";
    evt.currentTarget.className += " active";
}

// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();
</script>

<script>
function ValidateNo2() {
var pnrno = document.getElementById('pnrValidationID');

if (pnrno.value == "" || pnrno.value == null) {
alert("Please enter your PNR");
return false;
}
if (pnrno.value.length < 18 || pnrno.value.length > 18) {
alert("Please Enter 18 Digit PNR");
return false;
}

return true;
}
</script>
<script>
function openCity(evt, cityName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(cityName).style.display = "block";
    evt.currentTarget.className += " active";
}

// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();
</script>
	</div>

	<script>
 /* begin offcanvas.js */

 /* ========================================================================
  * Bootstrap: offcanvas.js v3.1.3
  * http://jasny.github.io/bootstrap/javascript/#offcanvas
  * ========================================================================
  * Copyright 2013-2014 Arnold Daniels
  *
  * Licensed under the Apache License, Version 2.0 (the "License")
  * you may not use this file except in compliance with the License.
  * You may obtain a copy of the License at
  *
  * http://www.apache.org/licenses/LICENSE-2.0
  *
  * Unless required by applicable law or agreed to in writing, software
  * distributed under the License is distributed on an "AS IS" BASIS,
  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  * See the License for the specific language governing permissions and
  * limitations under the License.
  * ======================================================================== */

 +function ($) { "use strict";

   // OFFCANVAS PUBLIC CLASS DEFINITION
   // =================================

   var OffCanvas = function (element, options) {
     this.$element = $(element)
     this.options  = $.extend({}, OffCanvas.DEFAULTS, options)
     this.state    = null
     this.placement = null
     
     if (this.options.recalc) {
       this.calcClone()
       $(window).on('resize', $.proxy(this.recalc, this))
     }
     
     if (this.options.autohide)
       $(document).on('click', $.proxy(this.autohide, this))

     if (this.options.toggle) this.toggle()
     
     if (this.options.disablescrolling) {
         this.options.disableScrolling = this.options.disablescrolling
         delete this.options.disablescrolling
     }
   }

   OffCanvas.DEFAULTS = {
     toggle: true,
     placement: 'auto',
     autohide: true,
     recalc: true,
     disableScrolling: true
   }

   OffCanvas.prototype.offset = function () {
     switch (this.placement) {
       case 'left':
       case 'right':  return this.$element.outerWidth()
       case 'top':
       case 'bottom': return this.$element.outerHeight()
     }
   }
   
   OffCanvas.prototype.calcPlacement = function () {
     if (this.options.placement !== 'auto') {
         this.placement = this.options.placement
         return
     }
     
     if (!this.$element.hasClass('in')) {
       this.$element.css('visiblity', 'hidden !important').addClass('in')
     } 
     
     var horizontal = $(window).width() / this.$element.width()
     var vertical = $(window).height() / this.$element.height()
         
     var element = this.$element
     function ab(a, b) {
       if (element.css(b) === 'auto') return a
       if (element.css(a) === 'auto') return b
       
       var size_a = parseInt(element.css(a), 10)
       var size_b = parseInt(element.css(b), 10)
   
       return size_a > size_b ? b : a
     }
     
     this.placement = horizontal >= vertical ? ab('left', 'right') : ab('top', 'bottom')
       
     if (this.$element.css('visibility') === 'hidden !important') {
       this.$element.removeClass('in').css('visiblity', '')
     }
   }
   
   OffCanvas.prototype.opposite = function (placement) {
     switch (placement) {
       case 'top':    return 'bottom'
       case 'left':   return 'right'
       case 'bottom': return 'top'
       case 'right':  return 'left'
     }
   }
   
   OffCanvas.prototype.getCanvasElements = function() {
     // Return a set containing the canvas plus all fixed elements
     var canvas = this.options.canvas ? $(this.options.canvas) : this.$element
     
     var fixed_elements = canvas.find('*').filter(function() {
       return $(this).css('position') === 'fixed'
     }).not(this.options.exclude)
     
     return canvas.add(fixed_elements)
   }
   
   OffCanvas.prototype.slide = function (elements, offset, callback) {
     // Use jQuery animation if CSS transitions aren't supported
     if (!$.support.transition) {
       var anim = {}
       anim[this.placement] = "+=" + offset
       return elements.animate(anim, 350, callback)
     }

     var placement = this.placement
     var opposite = this.opposite(placement)
     
     elements.each(function() {
       if ($(this).css(placement) !== 'auto')
         $(this).css(placement, (parseInt($(this).css(placement), 10) || 0) + offset)
       
       if ($(this).css(opposite) !== 'auto')
         $(this).css(opposite, (parseInt($(this).css(opposite), 10) || 0) - offset)
     })
     
     this.$element
       .one($.support.transition.end, callback)
       .emulateTransitionEnd(350)
   }

   OffCanvas.prototype.disableScrolling = function() {
     var bodyWidth = $('body').width()
     var prop = 'padding-' + this.opposite(this.placement)

     if ($('body').data('offcanvas-style') === undefined) {
       $('body').data('offcanvas-style', $('body').attr('style') || '')
     }
       
     $('body').css('overflow', 'hidden')

     if ($('body').width() > bodyWidth) {
       var padding = parseInt($('body').css(prop), 10) + $('body').width() - bodyWidth
       
       setTimeout(function() {
         $('body').css(prop, padding)
       }, 1)
     }
   }

   OffCanvas.prototype.show = function () {
     if (this.state) return
     
     var startEvent = $.Event('show.bs.offcanvas')
     this.$element.trigger(startEvent)
     if (startEvent.isDefaultPrevented()) return

     this.state = 'slide-in'
     this.calcPlacement();
     
     var elements = this.getCanvasElements()
     var placement = this.placement
     var opposite = this.opposite(placement)
     var offset = this.offset()

     if (elements.index(this.$element) !== -1) {
       $(this.$element).data('offcanvas-style', $(this.$element).attr('style') || '')
       this.$element.css(placement, -1 * offset)
       this.$element.css(placement); // Workaround: Need to get the CSS property for it to be applied before the next line of code
     }

     elements.addClass('canvas-sliding').each(function() {
       if ($(this).data('offcanvas-style') === undefined) $(this).data('offcanvas-style', $(this).attr('style') || '')
       if ($(this).css('position') === 'static') $(this).css('position', 'relative')
       if (($(this).css(placement) === 'auto' || $(this).css(placement) === '0px') &&
           ($(this).css(opposite) === 'auto' || $(this).css(opposite) === '0px')) {
         $(this).css(placement, 0)
       }
     })
     
     if (this.options.disableScrolling) this.disableScrolling()
     
     var complete = function () {
       if (this.state != 'slide-in') return
       
       this.state = 'slid'

       elements.removeClass('canvas-sliding').addClass('canvas-slid')
       this.$element.trigger('shown.bs.offcanvas')
     }

     setTimeout($.proxy(function() {
       this.$element.addClass('in')
       this.slide(elements, offset, $.proxy(complete, this))
     }, this), 1)
   }

   OffCanvas.prototype.hide = function (fast) {
     if (this.state !== 'slid') return

     var startEvent = $.Event('hide.bs.offcanvas')
     this.$element.trigger(startEvent)
     if (startEvent.isDefaultPrevented()) return

     this.state = 'slide-out'

     var elements = $('.canvas-slid')
     var placement = this.placement
     var offset = -1 * this.offset()

     var complete = function () {
       if (this.state != 'slide-out') return
       
       this.state = null
       this.placement = null
       
       this.$element.removeClass('in')
       
       elements.removeClass('canvas-sliding')
       elements.add(this.$element).add('body').each(function() {
         $(this).attr('style', $(this).data('offcanvas-style')).removeData('offcanvas-style')
       })

       this.$element.trigger('hidden.bs.offcanvas')
     }

     elements.removeClass('canvas-slid').addClass('canvas-sliding')
     
     setTimeout($.proxy(function() {
       this.slide(elements, offset, $.proxy(complete, this))
     }, this), 1)
   }

   OffCanvas.prototype.toggle = function () {
     if (this.state === 'slide-in' || this.state === 'slide-out') return
     this[this.state === 'slid' ? 'hide' : 'show']()
   }

   OffCanvas.prototype.calcClone = function() {
     this.$calcClone = this.$element.clone()
       .html('')
       .addClass('offcanvas-clone').removeClass('in')
       .appendTo($('body'))
   }

   OffCanvas.prototype.recalc = function () {
     if (this.$calcClone.css('display') === 'none' || (this.state !== 'slid' && this.state !== 'slide-in')) return
     
     this.state = null
     this.placement = null
     var elements = this.getCanvasElements()
     
     this.$element.removeClass('in')
     
     elements.removeClass('canvas-slid')
     elements.add(this.$element).add('body').each(function() {
       $(this).attr('style', $(this).data('offcanvas-style')).removeData('offcanvas-style')
     })
   }
   
   OffCanvas.prototype.autohide = function (e) {
     if ($(e.target).closest(this.$element).length === 0) this.hide()
   }

   // OFFCANVAS PLUGIN DEFINITION
   // ==========================

   var old = $.fn.offcanvas

   $.fn.offcanvas = function (option) {
     return this.each(function () {
       var $this   = $(this)
       var data    = $this.data('bs.offcanvas')
       var options = $.extend({}, OffCanvas.DEFAULTS, $this.data(), typeof option === 'object' && option)

       if (!data) $this.data('bs.offcanvas', (data = new OffCanvas(this, options)))
       if (typeof option === 'string') data[option]()
     })
   }

   $.fn.offcanvas.Constructor = OffCanvas


   // OFFCANVAS NO CONFLICT
   // ====================

   $.fn.offcanvas.noConflict = function () {
     $.fn.offcanvas = old
     return this
   }


   // OFFCANVAS DATA-API
   // =================

   $(document).on('click.bs.offcanvas.data-api', '[data-toggle=offcanvas]', function (e) {
     var $this   = $(this), href
     var target  = $this.attr('data-target')
         || e.preventDefault()
         || (href = $this.attr('href')) && href.replace(/.*(?=#[^\s]+$)/, '') //strip for ie7
     var $canvas = $(target)
     var data    = $canvas.data('bs.offcanvas')
     var option  = data ? 'toggle' : $this.data()

     e.stopPropagation()

     if (data) data.toggle()
       else $canvas.offcanvas(option)
   })

 }(window.jQuery);

 /* end offcanvas.js */

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