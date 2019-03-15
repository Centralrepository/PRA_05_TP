<%@page import="com.db.template.GetUserDetail"%>
<%@page import="com.model.UserInformationModel"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.db.conf.DBConnection"%>
<%@page import="com.model.AdminDetail"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="error/admin_error_page.jsp"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<%		
	if(session.getAttribute("isEnabled")==null){		
		response.sendRedirect("admin.jsp");		
		}		
%>
<html>
<head>
<title>AddNewUser</title>
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
<!-- <script src="https://code.jquery.com/jquery-1.10.2.js"
    type="text/javascript"></script> -->
<script src="js/validation.js" type="text/javascript"></script>
<script src="js/fetch_admin_details.js" type="text/javascript"></script>

<style type="text/css">

.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th,
    .table>thead>tr>td, .table>thead>tr>th {
    border: none;
}
.table tr th{
background: #1E90FF;
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

</head>
<body>
<nav class="navbar navbar-inverse" style="background-color:#1E90FF;">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#" style="color:white">TwentyPlus</a>
    </div>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="#"><span class="glyphicon glyphicon-user"></span> ${admin_name}</a></li>
      <li><a href="adminlogout.jsp"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
    </ul>
  </div>
</nav>
<%
    if(session.getAttribute("isEnabled")==null){
        response.sendRedirect("admin.jsp");
    }
%>
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
<%          
            UserInformationModel  informationModel=GetUserDetail.getDetails(Long.parseLong(request.getParameter("new_user_id")));
            request.setAttribute("current_user", informationModel);
        %>
    <h1 class="headingLevel1">Member Details</h1>
    <form action="CreateFormController" method="post">

        <!-- <div class="table-responsive"> -->
        <div class="table-responsive borderForm mgb30">
            <table class="table table-borderless">
                <thead>
                    <tr>
                        <th>Select Admin</th>
                        <th>Name</th>
                        <th>Address</th>
                        <th>Pincode</th>
                        <th>Phone Number</th>

                    </tr>
                </thead>
                <tbody>
                    <tr>
                    <td><select name="adminDetails1" id="select_admin1" class="form-control">
                            <option value="0">Select admin </option>
                            <c:forEach items="${listOfAdmins}" var="details">
                                <option value="${details.id}">${details.adminName}</option>
                            </c:forEach>
                        </select></td>
                        <td><input class="form-control" type="text1" id="admin_name1"
                            name="user_name_row0" readonly="readonly" required></td>
                        <td><input class="form-control" type="text4" id="admin_address1"
                            name="user_address_row0" readonly="readonly" required></td>
                        <td><input class="form-control" type="text5" id="admin_pincode1"
                            name="user_pincode_row0" readonly="readonly" onkeypress="checkNum3()" min="0" max="999999"
                            maxlength="6" required></td>
                        <td><input class="form-control" type="text6" id="admin_mobile_no1"
                            name="user_mobile_no_row0" readonly="readonly" onkeypress="checkNum1()" required min="0"
                            max="9999999999" maxlength="10" required></td>
                    </tr>

                    <tr>
                        <td><select name="adminDetails2" id="select_admin2" class="form-control">
                            <option value="0">Select admin </option>
                            <c:forEach items="${listOfAdmins}" var="details">
                                <option value="${details.id}">${details.adminName}</option>
                            </c:forEach>
                        </select></td>
                        <td><input class="form-control" type="text1" readonly="readonly" id="admin_name2"
                            name="user_name_row1" required></td>
                        <td><input class="form-control" type="text4" id="admin_address2" readonly="readonly"
                            name="user_address_row1" onkeypress="checkNum1()" required min="0"
                            max="9999999999" maxlength="10" required></td>
                        <td><input class="form-control" type="text5" readonly="readonly" id="admin_pincode2"
                            name="user_pincode_row1" onkeypress="checkNum3()" min="0" max="999999"
                            maxlength="6" required></td>
                        <td><input class="form-control" type="text6" readonly="readonly" id="admin_mobile_no2"
                            name="user_mobile_no_row1" onkeypress="checkNum1()" required min="0"
                            max="9999999999" maxlength="10" required></td>
                    </tr>

                    <tr>
                        <td><select name="adminDetails3" id="select_admin3" class="form-control">
                            <option value="0">Select admin </option>
                            <c:forEach items="${listOfAdmins}" var="details">
                                <option value="${details.id}">${details.adminName}</option>
                            </c:forEach>
                        </select></td>
                        <td><input class="form-control" type="text1" readonly="readonly" id="admin_name3"
                            name="user_name_row2" required></td>
                        <td><input class="form-control" type="text4" readonly="readonly" id="admin_address3"
                            name="user_address_row2" required></td>
                        <td><input class="form-control" type="text5"  readonly="readonly" id="admin_pincode3"
                            name="user_pincode_row2" onkeypress="checkNum3()" min="0" max="999999"
                            maxlength="6" required></td>
                        <td><input class="form-control" type="text6" readonly="readonly" id="admin_mobile_no3"
                            name="user_mobile_no_row2" onkeypress="checkNum1()" required min="0"
                            max="9999999999" maxlength="10" required></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input class="form-control" type="text1" id="position4"
                            name="name13" readonly="readonly" value="${current_user.userName}" required></td>
                        <td><input class="form-control" type="text4" id="position4"
                            name="name14" readonly="readonly" value="${current_user.address}" required></td>
                        <td><input class="form-control" type="text5" id="position4"
                            name="name15" readonly="readonly" onkeypress="checkNum3()" min="0" max="999999"
                            maxlength="6" value="${current_user.pincode}" required></td>
                        <td><input class="form-control" type="text6" id="position4" readonly="readonly"
                            name="name16" onkeypress="checkNum1()" min="0"
                            max="9999999999" maxlength="10" value="${current_user.mobileNo}" required></td>
                            
                            <td><input type="hidden" name="user_id" value="<%=request.getParameter("new_user_id")%>"></td>
                    </tr>

                </tbody>
            </table>
        </div>
        <div>
       <!--  </div> -->
        
        
        <div class="row">

                <div class="col-sm-0"></div>
                <div class="col-sm-5"></div>

                <div class="col-sm-4"><a href="usercontent2.jsp"></a> <input type="submit"
                    class="btn btn-default btn-primary btn-lg" style="background-color:#1E90FF;" value="Create Form"></div>

            </div>
            </div>
 
</form>
<script src="js/script_validation.js" type="text/javascript"> </script> 
        <script>
            function myFunction() {
                window.print();
            }
        </script>

        <script>
            function checkNum3() {
                var ch = String.fromCharCode(event.keyCode);
                var filter = /[0-9]/;
                if (!filter.test(ch)) {
                    event.returnValue = false;
                }
            }
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