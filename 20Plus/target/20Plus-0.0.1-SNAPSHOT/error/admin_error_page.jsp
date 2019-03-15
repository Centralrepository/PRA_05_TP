<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isErrorPage="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String path = request.getContextPath();
String getProtocol=request.getScheme();
String getDomain=request.getServerName();
String getPort=Integer.toString(request.getServerPort());

String getPath = getProtocol+"://"+getDomain+":"+getPort+path+"/"; 
String getURI=request.getRequestURI();
%>
Hi There, error code is <%=response.getStatus() %><br>
<font color="red">Error: <%=exception.getStackTrace().toString() %></font><br>
<font color="red"><%=getURI.split(".jsp")[0] %></font><br>
<a href='<%=getPath%>admin.jsp'>Go Homepage</a>

</body>
</html>