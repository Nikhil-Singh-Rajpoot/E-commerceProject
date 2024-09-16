<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta  charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1.0">
   <%@include file="components/common_css_js.jsp"%>
    <title>Registration - TanviMart</title> 
</head>
<body>
	<%@include file="components/nevbar.jsp"%>
	<div class="container-fluid">
		<div class="row mt-5">
			<!-- Left side with the image -->
			<div
				class="col-md-6 d-flex justify-content-center align-items-center">
				<img src="img/reg.png" alt="Registration Image"
					style="width: 700px; height: auto;">
			</div>
			<!-- Right side registration form -->
			<div class="col-md-5 offset-md-1">
				<div class="card transparent-div p-2">
				<%@include file="components/message.jsp" %>
					<div class="card-body ">
						<h2 class="text-center my-3 custom-bs pb-2 pt-2">Sign up here !!</h2>
						<form action="RegisterServlet" method="post">
							<div class="form-group">
								<label for="name" class="form-label">User Name</label> <input
									type="text" name="user_name" class="form-control" id="name"
									placeholder="Enter User Name">
							</div>
							<div class="form-group">
								<label for="email" class="form-label">User Email</label> <input
									type="email" name="user_email" class="form-control" id="email"
									placeholder="Enter User Email">
							</div>
							<div class="form-group">
								<label for="password" class="form-label">User Password</label> <input
									type="password" name="user_password" class="form-control" id="password"
									placeholder="Enter User password">
							</div>
							<div class="form-group">
								<label for="number" class="form-label">User Mobile
									Number</label>
									 <input type="number" name ="user_phone" class="form-control" id="number"
									placeholder="Enter Mobile Number">
							</div>
							<div class="form-group">
								<label for="address" class="form-label">User Address</label>
								<textarea style="height: 200px;" class="form-control"
									placeholder="Enter User Address" name="user_address"></textarea>
							</div>
							<div class="container text-center">
								<button class="btn btn-outline-success">Register</button>
								<button class="btn btn-outline-warning" type="reset">Reset</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>