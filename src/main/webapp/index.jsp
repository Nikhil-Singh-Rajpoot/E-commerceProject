<%@page import="Service.ServiceProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TanviMart - Home</title>
<%@include file="components/common_css_js.jsp" %>
</head>
<body>
<%@include file ="components/nevbar.jsp" %>
<h1>Hyy Nikhil Your Project is Running.....</h1>
<h1>Hibernate Configuration -------</h1>
<% out.println(ServiceProvider.getFactory()); %>
</body>
</html>