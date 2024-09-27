<%@page import="java.util.Map"%>
<%@page import="Service.ServiceProvider"%>
<%@page import="Service.Helper"%>
<%@page import="com.esite.entites.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.esite.dao.CategoryDao"%>
<%@page import="com.esite.entites.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
User user = (User) session.getAttribute("current-user");

if (user == null) {
	session.setAttribute("message", "You are not login ! Login First !");
	response.sendRedirect("login.jsp");
	return;
} else if (user.getUserType().equals("normal")) {
	session.setAttribute("message", "You are not Admin ! Do not access this page.");
	response.sendRedirect("login.jsp");
	return;
}
%>


	<%
			
		 List<Category> list= CategoryDao.getCategory();
		 
		 //Getting count of Products and Users 
		Map<String, Long> m =Helper.getCount(ServiceProvider.getFactory());
	%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport"
	content="width=device-width, initial-scale=1.0">
<%@include file="components/common_css_js.jsp"%>
<title>Admin - Panel</title>
</head>
<body>
	<%@include file="components/nevbar.jsp"%>
	<div class="container admin">
	<div class="container-fluid mt-3">
	<%@include file="components/message.jsp"%>
	</div>
		<!-- first row -->
		<div class="row mt-3">
			<!-- First col -->
			<div class="col-md-4">
				<div class="card  text-center transparent-div">
					<div class="card-body">
						<!-- img here -->
						<div class="container">
							<img class="img-fluid" style="max-width: 120px" alt="img"
								src="img/user.png">
						</div>
						<h4><%=m.get("user") %>+</h4>
						<h4 class="text-uppercase text-muted">Users</h4>
					</div>
				</div>
			</div>
			<!-- Second col -->
			<div class="col-md-4">
				<div class="card  text-center transparent-div">
					<div class="card-body">
						<div class="container">
							<img class="img-fluid" style="max-width: 120px" alt="img"
								src="img/categores.png">
						</div>
						<h4><%=list.size() %>+</h4>
						<h4 class="text-uppercase text-muted">Categories</h4>
					</div>
				</div>
			</div>

			<!-- Thrid col -->
			<div class="col-md-4">
				<div class="card  text-center transparent-div">
					<div class="card-body">
						<div class="container">
							<img class="img-fluid" style="max-width: 120px" alt="img"
								src="img/product.png">
						</div>
						<h4><%=m.get("product") %>+</h4>
						<h4 class="text-uppercase text-muted">Products</h4>
					</div>
				</div>
			</div>
		</div>
		<!-- Second Row -->
		<div class="row mt-5">

			<!-- Second row: first-col -->
			<div class="col-md-6">

				<div class="card text-center transparent-div" data-toggle="modal"
					data-target="#add-category-model">

					<div class="card-body">
						<div class="container">
							<img class="img-fluid" style="max-width: 120px" alt="img"
								src="img/add_pro.png">
						</div>
						<p>Click here to add other categories</p>
						<h4 class="text-uppercase text-muted">Add Categories</h4>
					</div>
				</div>
			</div>

			<!-- Second row : second-col -->
			<div class="col-md-6">
				<div class="card  text-center transparent-div" data-toggle="modal" data-target="#add-product-model">

					<div class="card-body">
						<div class="container">
							<img class="img-fluid" style="max-width: 120px" alt="img"
								src="img/add-product.png">
						</div>
						<p>Click here to add other products</p>
						<h4 class="text-uppercase text-muted">Add Products</h4>
					</div>
				</div>


			</div>

		</div>
	</div>

	<!-- Add-Category-model -->

	<!-- Modal -->
	<div class="modal fade transparent-div" id="add-category-model" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content ">
				<div class="modal-header custom-bs">
					<h5 class="modal-title" id="exampleModalLabel">Fill Category
						details !!</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="ProductOperationServlet" method="post">
						<input class="form-control" type="hidden" name="operation" value="addCat">
						<div class="form-group">
							<input class="form-control" type="text" name="catName"
								placeholder="Enter Category Name " required>
						</div>
						<div class="form-group">
							<textarea class="form-control" style="height: 200px;"
								name="catDesc" placeholder="Enter Category Descriprtion"
								required></textarea>
						</div>
						<div class="container  text-center">
							<button class="btn btn-outline-success">Add Category</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- End-Category-model -->
	
	<!-- Add Product-model -->
	<!-- Modal -->
	<div class="modal fade transparent-div" id="add-product-model" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content transparent-div">
				<div class="modal-header custom-bs">
					<h5 class="modal-title" id="exampleModalLabel">Fill Products
						details !!</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="ProductOperationServlet" method="post" enctype="multipart/form-data" >
						<input class="form-control" type="hidden" name="operation" value="addPro">
						<div class="form-group">
							<input class="form-control" type="text" name="proName"
								placeholder="Enter Product Name " required>
						</div>
						<div class="form-group">
							<textarea class="form-control" style="height: 120px;"
								name="proDesc" placeholder="Enter Product Descriprtion"
								required></textarea>
						</div>
						<div class="form-group">
							<input class="form-control" type="number" name="proPrice"
								placeholder="Enter Product Price " required>
						</div>
						<div class="form-group">
							<input class="form-control" type="number" name="proDiscount"
								placeholder="Enter Product Discount " required>
						</div>
						<div class="form-group">
							<input class="form-control" type="number" name="proQuntity"
								placeholder="Enter Product Quntity " required>
						</div>
						
						<div class="form-group">
							<select name="catId" class="form-control" id="">
							
							<%
							for(Category c: list){
								%>
								<option value="<%= c.getCategoryId() %>" > <%= c.getCategoryTitle() %></option>
								<%
							}
								%>
							</select>
						</div>
						<div class="form-group">
						<label for="proPic">Enter Picture of Product </label> <br>
							<input class="form-control" type="file" name="proPic" id="proPic"
							 required>
						</div>
						<div class="container  text-center">
							<button class="btn btn-outline-success">Add Product</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- End Product-model -->
<%@include file="components/common_modals.jsp" %>
</body>
</html>