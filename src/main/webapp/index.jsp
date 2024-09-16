<%@page import="Service.ServiceProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta  charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1.0">
  <%@include file="components/common_css_js.jsp" %>
<title>TanviMart - Home</title>
</head>
<body>
<%@include file ="components/nevbar.jsp" %>
<h1>Hyy Nikhil Your Project is Running.....</h1>
<h1> Sorry !! Under Development Phase</h1>
<p>In this time you can only use Login and Registration module. <b>Thank you !!</b></p>
<% out.println(ServiceProvider.getFactory()); %>
</body>
</html>