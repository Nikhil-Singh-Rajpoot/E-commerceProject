<%@page import="Service.Helper"%>
<%@page import="com.esite.entites.Category"%>
<%@page import="com.esite.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.esite.entites.Product"%>
<%@page import="com.esite.dao.ProductDao"%>
<%@page import="Service.ServiceProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport"
	content="width=device-width, initial-scale=1.0">
<%@include file="components/common_css_js.jsp"%>
<title>TanviMart - Home</title>
</head>
<body>
	<%@include file="components/nevbar.jsp"%>

	<div class="row mt-4 mx-2">
		<!-- Get all categories and Products  -->
		<%
		//All Products 
		List<Product> pList = ProductDao.getProducts();
		//All Categories 
		List<Category> cList = CategoryDao.getCategory();
		%>
		<!-- This col for All Categories -->
		<div class="col-md-2 ">
			<div class="list-group ">
				<a href="#"
					class="list-group-item list-group-item-action active transparent-div custom-bs">
					All Products </a>

				<%
				for (Category c : cList) {
				%>
				<a href="#"
					class="list-group-item list-group-item-action transparent-div custom-bs"><%=c.getCategoryTitle()%>
				</a>
				<%
				}
				%>
			</div>
		</div>

		<div class="col-md-8">
			<!-- row -->
			<div class="row mt-4">

				<!-- col:12 -->
				<div class="col-md-12">

					<div class="card-columns">

						<!-- traversing products -->
						<%
						for (Product p : pList) {
						%>
				<!-- All Products print by card -->
						<div class="card" style="width: 18rem;">
							<img class="card-img-top" src="img/products/<%= p.getProductPhoto()%>" alt="Card image cap">
							<div class="card-body">
								<h5 class="card-title"> <%= p.getProductName() %></h5>
								<p class="card-text"><%= Helper.get10Words(p.getProductDesc()) %></p>
								<a href="#" class="btn btn-primary custom-bs">Add to Cart </a>
								<a href="#" class="btn btn-outline-success">&#8377 <%=p.getProductPrice() %></a>
							</div>
						</div>


						<%
						}
						%>



					</div>

				</div>
			</div>
		</div>
	</div>
	<%
	out.println(ServiceProvider.getFactory());
	%>
</body>
</html>