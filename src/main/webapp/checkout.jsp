<%
User user = (User) session.getAttribute("current-user");

if (user == null) {
	session.setAttribute("message", "You are not login ! Login First ! To access checkout page !");
	response.sendRedirect("login.jsp");
	return;
}

%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="components/common_css_js.jsp"%>
<title>Checkout :: TanviMart</title>
</head>
<body>
	<%@include file="components/nevbar.jsp"%>

	<div class="container">
<div class="row mt-5">
<div  class="col-md-6">
<!-- Here Show cart items -->
<div class="card ">
<div class="card-body ">
<h3 class="text-center mb-5">Your Selected Items</h3>
		<div class="cart-body">
		</div>
	</div>
</div>

</div>

<div  class="col-md-6">
<!-- Here Show Form details -->
<div class="card ">
<div class="card-body ">
<h3 class="text-center mb-5">Your Details for Order</h3>
		<form action="#!">
		<div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" value="<%= user.getUserEmail() %>"  class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1"> Your Name</label>
    <input type="text" value="<%= user.getUserName() %>" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Name">
  </div>
  
    <div class='row'>
     <div class="col">
       <label for="exampleInputEmail1">Your Distric </label>
      <input type="text" class="form-control" placeholder="Enter Your Distric">
    </div>
    <div class="col">
      <label for="exampleInputEmail1">Pin Code </label>
      <input type="text" class="form-control" placeholder="Enter Your Pin code">
    </div>
    </div>
    
     <div class='row'>
     <div class="col">
       <label for="exampleInputEmail1">Contact Number </label>
      <input type="text" value="<%= user.getUserPhone() %>"  class="form-control" placeholder="Enter your Contact No">
    </div>
    <div class="col">
      <label for="exampleInputEmail1">Near By</label>
      <input type="text" class="form-control" placeholder="Enter Your Near by">
    </div>
    </div>
  
   <div class="form-group">
    <label for="exampleFormControlTextarea1">Your Address</label>
    <textarea value="<%= user.getUserAddress() %>" class="form-control" id="exampleFormControlTextarea1"rows="3" placeholder="Enter Your Full Address"></textarea>
  </div>
		
		<div class="container text-center">
		<button class="text-center btn btn-outline-success"> Order Now</button>
		<a href="index.jsp">
		<button class=" btn btn-outline-primary">Continue Shopping</button>
		</a>
		</div>
		</form>
	</div>
</div>

</div>
</div>		
	</div>
	<%@include file="components/common_modals.jsp" %>
</body>
</html>