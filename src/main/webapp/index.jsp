<%@page import="Service.ServiceProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home::Page</title>
</head>
<body>
<h1>Hyy Nikhil Your Project is Running.....</h1>
<h1>Hibernate Configuration -------</h1>
<% out.println(ServiceProvider.getFactory()); %>
</body>
</html>