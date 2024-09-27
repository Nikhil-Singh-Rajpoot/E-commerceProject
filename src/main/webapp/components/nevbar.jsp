
<%@page import="com.esite.entites.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.esite.dao.CategoryDao"%>
<%@page import="com.esite.entites.User"%>
<%
User user1 =(User)session.getAttribute("current-user");

%>
<nav class="navbar navbar-expand-lg navbar-light custom-bs">
	<div class="container">
		<!-- Brand/Logo -->
		<a class="navbar-brand" href="index.jsp"> <img src="img/logo.jpg"
			alt="Brand Logo" width="40" height="40"
			class="d-inline-block align-text-top img-logo"> TanviMart
		</a>

		<!-- Toggler for mobile view -->
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		
	<!-- 	//fatching all category from database here  -->
		<% 
		//All Categories 
				List<Category> catList = CategoryDao.getCategory();
		%>

		<!-- Navbar Links and Icons -->
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="index.jsp">Home</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Shop</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Offers</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">
						Categories </a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						
						<%
						for (Category c : catList) {
						%>
						<li><a class="dropdown-item" href="index.jsp?category=<%=c.getCategoryId()%>"><%=c.getCategoryTitle() %></a></li>
						<%
						}
						%>
						
					</ul></li>
			</ul>

			<!-- User and Cart Icons (right-aligned) -->
			<ul class="navbar-nav ms-auto">
				<li class="nav-item"><a class="nav-link" href="#"><i
						class="bi bi-person-circle"></i> Account</a></li>
				<li class="nav-item"><a class="nav-link" data-toggle="modal" data-target="#cart" href="#"><i
						class="bi bi-cart cart-btn"></i>Cart <samp class="cart-item">(0)</samp></a></li>

				<%
 
                	if(user1==null){	
                		
                		%>

				<li class="nav-item"><a class="nav-link" href="login.jsp"><i
						class="bi bi-box-arrow-in-right"></i> Login</a></li>
				<li class="nav-item"><a class="nav-link"
					href="registration.jsp"> <i class="bi bi-r-circle-fill"></i>
						Register
				</a></li>

				<%                		
                	}else if(user1.getUserType().equals("admin")){
                		
                	%>

				<li class="nav-item"><a class="nav-link" href="admin.jsp">
						<i class="bi bi-person-vcard-fill"></i> <%= user1.getUserName() %>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="LogoutServlet"><i
						class="bi bi-box-arrow-right"></i> Logout </a></li>

				<%
                	} else {
                		
                %>
				<li class="nav-item"><a class="nav-link" href="normal.jsp">
						<i class="bi bi-person-vcard-fill"></i> <%= user1.getUserName() %>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="LogoutServlet"><i
						class="bi bi-box-arrow-right"></i> Logout </a></li>
				<%
                }
				%>
			</ul>
		</div>
	</div>
</nav>
