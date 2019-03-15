<%@page import="com.sms.service.UserMessageService"%>
<%@page import="com.db.template.JDBCUserTemplate"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="forgotUserPassword" class="com.bean.ForgotUserPassword">
	<jsp:setProperty name="forgotUserPassword" property="*" /> 
</jsp:useBean>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	if(session.getAttribute("enabled")!=null){
		response.sendRedirect("../user.jsp");
	}
%>
<%
	JDBCUserTemplate userTemplate = new JDBCUserTemplate();
	if(userTemplate.validateUserPassword(forgotUserPassword)){
		UserMessageService userService = new UserMessageService();
		userService.sendPasswordToUser(forgotUserPassword, userTemplate.getUserPassword(forgotUserPassword));
		response.sendRedirect("../user_login.jsp?login_msg="+"Please login here!");
	}
	else{
		response.sendRedirect("forgotpassword_user.jsp?login_msg="+"Please enter valid user id & mobile no!");
	}
	
%>
</body>
</html>