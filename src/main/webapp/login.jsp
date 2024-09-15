<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@include file="components/common_css_js.jsp"%>
    <title>Login - TanviMart</title>
</head>
<body>
	<%@include file="components/nevbar.jsp"%>
	<div class="container">
    <div class="row mt-5">
        <!-- Left Column with Image -->
        <div class="col-md-5 d-none d-md-block">
           <div class="image-container" style="height: 100%; width: 100%; background-size: contain; background-position: center; background-image: url(img/login.png); background-repeat: no-repeat;">
            </div>
        </div>
        <!-- Mobile image (Visible only on smaller devices) -->
            <div class="col-12 d-block d-md-none text-center mb-3">
                <img src="img/login.png" alt="Login Image" style="max-width: 100%; height: auto;">
            </div>

        <!-- Right Column with Login Form -->
        <div class="col-md-5 offset-md-2">
            <div class="card mt-4 transparent-div p-3">
                <div class="card-header custom-bs text-center">
                    <h2>Login here !!</h2>
                </div>
                <div class="card-body">
                	<%@include file="components/message.jsp" %>
                    <form action="Login" method="post">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Email address</label> 
                            <input type="email" name="user_email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" required>
                            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Password</label> 
                            <input type="password" name="user_password" class="form-control" id="exampleInputPassword1" placeholder="Password" required>
                        </div>
                        <a href="registration.jsp" class="d-block mb-3">If not Registered Click Here </a>
                        <div class="container text-center">
                            <button type="submit" class="btn btn-primary custom-bs">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>