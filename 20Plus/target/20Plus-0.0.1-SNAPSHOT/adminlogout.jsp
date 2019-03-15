<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="error/admin_error_page.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv=[COLOR=red]"cache-control"[/COLOR] content=[COLOR=red]"max-age=0, must-revalidate, no-cache, no-store, private"[/COLOR]>
<meta http-equiv=[COLOR=red]"expires"[/COLOR] content=[COLOR=red]"-1"[/COLOR]>
 
<meta http-equiv=[COLOR=red]"pragma"[/COLOR] content=[COLOR=red]"no-cache"[/COLOR]>
<title>Insert title here</title>

</head>
<body>
<%
session.removeAttribute("admin_name");
session.removeAttribute("isEnabled");

session.invalidate();
response.setHeader("Cache-Control","no-cache"); 
response.setHeader("Cache-Control","no-store"); 
response.setDateHeader("Expires", 0); 

response.sendRedirect("admin.jsp");
%>


</body>
</html>