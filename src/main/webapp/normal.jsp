
<%@page import="com.esite.entites.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
 User user =(User)session.getAttribute("current-user");

if(user == null){
	session.setAttribute("message", "You are not login ! Login First !");
	response.sendRedirect("login.jsp");
	return;
}else if(user.getUserType().equals("admin")){
				session.setAttribute("message", "You are not Registred User ! Registration First. !");
				response.sendRedirect("login.jsp");
				return;
			}
%>

<!DOCTYPE html>
<html>
<head>
 <meta  charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home - TanviMart</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
	<%@include file="components/nevbar.jsp"%>
	<h1>This is Normal User-----</h1>
</body>
</html>