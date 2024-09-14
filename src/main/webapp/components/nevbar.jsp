<nav class="navbar navbar-expand-lg navbar-light custom-bs shadow-sm">
	<div class="container">
		<!-- Brand Logo -->
		<a class="navbar-brand " href="index.jsp"> <img src="img/logo.jpg"
			alt="TanviMart" width="40" height="40"
			class="d-inline-block align-text-top img-logo"> TanviMart
		</a>

		<!-- Toggler for mobile view -->
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<!-- Navbar Links -->
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="index.jsp">Home</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Shop</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Offers</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-expanded="false">
						Categories </a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item" href="#">Electronics</a></li>
						<li><a class="dropdown-item" href="#">Fashion</a></li>
						<li><a class="dropdown-item" href="#">Home & Kitchen</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="#">More Categories</a></li>
					</ul></li>
			</ul>

			<!--        Search Form
      <form class="d-flex" role="search">
        <input class="form-control me-2" type="search" placeholder="Search products..." aria-label="Search">
        <button class="btn btn-outline-primary" type="submit">Search</button>
      </form> 
 -->

		</div class= "collapse navbar-collapse" id="navbarNav">
		<div>
			<!-- User and Cart Icons -->
			<ul class="navbar-nav ml-3">
				<li class="nav-item"><a class="nav-link" href="#"> <i
						class="bi bi-person-circle"></i> Account
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#"> <i
						class="bi bi-cart"></i> Cart (0)
				</a></li>
				<li class="nav-item"><a class="nav-link" href="login.jsp">
						<i class="bi bi-person-check-fill"></i> Login
				</a></li>
				<li class="nav-item"><a class="nav-link"
					href="registration.jsp"> <i class="bi bi-r-circle-fill"></i>
						Register
				</a></li>
			</ul>
		</div>
	</div>
</nav>

<!-- Bootstrap Icons CDN (add in the <head> section of your HTML) -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
	rel="stylesheet">
