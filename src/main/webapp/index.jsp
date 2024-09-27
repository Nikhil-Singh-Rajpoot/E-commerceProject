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

	<div class="row mt-3 mx-2">
		<!-- Get all categories and Products  -->
		<%
		//All Products 
		List<Product> pList;
		//All Categories 
		List<Category> cList = CategoryDao.getCategory();
		
		//get category id 
		String catId="9312";
         catId=request.getParameter("category");
		
		if(catId==null || catId.trim().equals("9312")){
			pList  = ProductDao.getProducts();
		}else{
			
			pList = ProductDao.getProductsByCatId(Integer.parseInt(catId));
		}
		
		%>
		<!-- This col for All Categories -->
		<div class="col-md-2 ">
			<div class="list-group ">
			
		<%
		 	try
		 	{
		 	String tag="a";
		 	if(catId==null||catId.equals("9312")){
		 		tag="active";
		 	}
		 	%>
		 	<a href="index.jsp?category=9312" class="list-group-item list-group-item-action <%=tag %>  transparent-div custom-bs">
					All Products </a>
					<%
					tag="a";
				for (Category c : cList) {
					
					if(catId==null){
						
					} else if(c.getCategoryId()==Integer.parseInt(catId)){
						tag="active";
					}
					
				%>
				<a href="index.jsp?category=<%=c.getCategoryId()%>"
					class="list-group-item list-group-item-action <%=tag%>  transparent-div custom-bs"><%=c.getCategoryTitle()%>
				</a>
				<%
				tag=null;
				}
				}catch(Exception e){
				e.printStackTrace();
				}
				%> 
			</div>
		</div>

<!-- Show all products   -->
		<div class="col-md-10">
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
						<div class="card" style="width: 21rem;">
							<div class="card-header container text-center">
							<img class="card-img-top" style="max-height:250px; mx-width:100%; width: auto;" src="img\products\<%= p.getProductPhoto()%>" alt="Card image cap">
							</div>
							<div class="card-body">
								<h5 class="card-title"> <%= p.getProductName() %></h5>
								<p class="card-text"><%= Helper.get10Words(p.getProductDesc()) %></p>
								<div class="card-footer text-center">
								<a href="#" class="btn btn-primary custom-bs" onclick="add_to_cart(<%= p.getProductId()%> , '<%=p.getProductName() %>' , <%=p.getProductPrice() %>)">Add to Cart </a>
								<a href="#" class="btn btn-outline-success main-price-bottom"> &#8377;  <%=p.getDiscountPrice(p.getProductPrice()) %>/- <span class=" discount-lebal"><label class="label-price text-secondary"><%=p.getProductPrice() %> &#8377; </label>  <%= p.getProductDiscount() %>% off</span></a>
								</div>
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
	<%@include file="components/common_modals.jsp"%>
</body>
</html>