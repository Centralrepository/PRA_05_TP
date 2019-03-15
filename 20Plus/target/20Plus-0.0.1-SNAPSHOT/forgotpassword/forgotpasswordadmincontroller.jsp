
<%@page import="com.sms.service.AdminMessageService"%>
<%@page import="com.db.template.JDBCAdminTemplate"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="forgotAdminPassword" class="com.bean.ForgotAdminPassword">
	<jsp:setProperty name="forgotAdminPassword" property="*" /> 
</jsp:useBean>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	if(session.getAttribute("isEnabled")!=null){
		response.sendRedirect("../adminhome.jsp");
	}
%>
<%
	JDBCAdminTemplate adminTemplate = new JDBCAdminTemplate();
	if(adminTemplate.validateAdminPassword(forgotAdminPassword)){
		AdminMessageService adminService = new AdminMessageService();
		adminService.sendPasswordToAdmin(forgotAdminPassword, adminTemplate.getAdminPassword(forgotAdminPassword));
		response.sendRedirect("../admin_login.jsp?login_msg="+"Please login here!");
	}
	else{
		response.sendRedirect("forgotpassword_admin.jsp?login_msg="+"Please enter valid user id and mobile no!");
	}
	
%>
</body>
</html>