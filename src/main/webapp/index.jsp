<%@page import="model.KhachHang"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Book store</title>
	<!-- Bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

	<!-- Bootstrap JS -->
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
		integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
		crossorigin="anonymous"></script>
</head>
<body>
<!-- Navbar -->
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">
				<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/625px-Apple_logo_black.svg.png"
					alt="Logo" width="65" height="65">
			</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
				data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item">
						<a class="nav-link active" aria-current="page" href="#">Home</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#">Stores</a>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
							aria-expanded="false">
							Products
						</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#">iPhone</a></li>
							<li><a class="dropdown-item" href="#">iPad</a></li>
							<li><a class="dropdown-item" href="#">Mac</a></li>
							<li><a class="dropdown-item" href="#">Watch</a></li>
							<li><a class="dropdown-item" href="#">Airpod</a></li>
							<li><a class="dropdown-item" href="#">TV-Home</a></li>
							<li><a class="dropdown-item" href="#">Entertainment</a></li>
							<li><a class="dropdown-item" href="#">Accessories</a></li>
							<li>
								<hr class="dropdown-divider">
							</li>
							<li><a class="dropdown-item" href="#">More -></a></li>
						</ul>
					</li>
					<li class="nav-item">
						<a class="nav-link disabled" aria-disabled="true">Sold out</a>
					</li>
				</ul>
				<form class="d-flex" role="search">
					<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Search</button>
					<%
					Object obj=session.getAttribute("khachHang");
					KhachHang kh=null;
					if(obj!=null){
						kh=(KhachHang)obj;
					}
					if(kh==null){
					%>
					<a class="btn btn-primary" style="margin-left: 2px; white-space: nowrap;" href="login.jsp">Login</a>
					<%
					}else{ %>
					<div class="row text-center" style="margin-left: 5px">
					<div class="row" style="white-space: nowrap;"><b><%=kh.getHoVaTen() %></b></div>
					<div class="row"><a style="white-space: nowrap;" href="log_out">Log out</a></div>
					</div>
						<!--   <Span style="white-space: nowrap;">Hello, <b><%=kh.getHoVaTen() %></b></Span></br>
						 <a style="white-space: nowrap;" href="log_out">Log out</a>
						 -->
					<%  } %>
					
				
				</form>
			</div>
		</div>
	</nav>
	<!-- End Navbar -->

	<!-- Page Contaner -->
	<div class="container">
		<div class="row">
			<!-- Menu Left -->
			<div class="col-lg-2 ">
				<div class="list-group">
					<a href="#" class="list-group-item list-group-item-action" aria-current="true">
						iPhone
					</a>
					<a href="#" class="list-group-item list-group-item-action">iPad</a>
					<a href="#" class="list-group-item list-group-item-action">Mac</a>
					<a href="#" class="list-group-item list-group-item-action">TV and Home</a>
					<a href="#" class="list-group-item list-group-item-action">Watch</a>
					<a href="#" class="list-group-item list-group-item-action">Airpod</a>
					<a href="#" class="list-group-item list-group-item-action">Accessories</a>
					<a href="#" class="list-group-item list-group-item-action">More</a>
					<a class="list-group-item list-group-item-action disabled" aria-disabled="true">Sold Out</a>
				</div>
			</div>
			<!-- Slider Product -->
			<div class="col-lg-10 ">
				<!--Slider -->
				<div id="carouselExampleFade" class="carousel slide carousel-fade">
					<div class="carousel-inner">
						<div class="carousel-item active ">
							<img src="https://www.apple.com/v/macbook-air/s/images/overview/design/lifestyle-gallery/design_portability_1__gfw34rh367u6_large.jpg"
								class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img src="https://istyle.com.lb/media/oander/multislider/i/p/iphone_15_web_banner_pre_avail_600x800_lb.jpg"
								class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img src="https://istyle.com.lb/media/oander/multislider/a/p/apple_watch_ultra_2_lte_pre-avail_web_banner_600x800_lb.jpg"
								class="d-block w-100" alt="...">
						</div>
					</div>
					<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade"
						data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade"
						data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
				<!-- End Slider -->

				<!-- Products -->
				<div class="row">
					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card border-light" style="width: 18rem;">
							<img src="https://www.apple.com/v/iphone/home/bu/images/overview/select/iphone_15_pro__bpnjhcrxofqu_xlarge.png"
								class="card-img-top" alt="iphone 15 pro" height="400px">
							<div class="card-body">
								<h5 class="card-title">iPhone 15 Pro</h5>
								<p class="card-text">The ultimate iPhone</p>
								<strong class="card-text">From A$1,849</strong></br>
								<a href="#" class="btn btn-primary">Learn more</a>
								<a href="#" class="	card-link float-end">Buy ></a>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card border-light" style="width: 18rem;">
							<img src="https://www.apple.com/v/iphone/home/bu/images/overview/select/iphone_15__fm75iyqlkjau_xlarge.png"
								class="card-img-top" alt="iphone 15 " height="400px">
							<div class="card-body">
								<h5 class="card-title">iPhone 15 </h5>
								<p class="card-text">A total powerhouse.</p>
								<strong class="card-text">From A$1,499</strong></br>
								<a href="#" class="btn btn-primary">Learn more</a>
								<a href="#" class="	card-link float-end">Buy ></a>
							</div>

						</div>
					</div>

					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card border-light" style="width: 18rem;">
							<img src="https://www.apple.com/v/iphone/home/bu/images/overview/select/iphone_14__cjgvgyn9cquu_xlarge.png"
								class="card-img-top" alt="iphone 14 " height="400px">
							<div class="card-body">
								<h5 class="card-title">iPhone 14 </h5>
								<p class="card-text">As amazing as ever.</p>
								<strong class="card-text">From A$1,299</strong></br>
								<a href="#" class="btn btn-primary">Learn more</a>
								<a href="#" class="	card-link float-end">Buy ></a>
							</div>

						</div>
					</div>
				</div>
				<!-- End Products -->
			</div>
		</div>
		<!-- End Page Contaner -->
	</div>

	<!-- Footer -->
	<div class="bg-body-tertiary">
		<div class="container">
			<footer class="py-5 ">
				<div class="row">
					<div class="col-6 col-md-2 mb-3">
						<h5>Section</h5>
						<ul class="nav flex-column">
							<li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">Home</a></li>
							<li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">Features</a>
							</li>
							<li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">Pricing</a>
							</li>
							<li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">FAQs</a></li>
							<li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">About</a>
							</li>
						</ul>
					</div>

					<div class="col-6 col-md-2 mb-3">
						<h5>Section</h5>
						<ul class="nav flex-column">
							<li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">Home</a></li>
							<li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">Features</a>
							</li>
							<li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">Pricing</a>
							</li>
							<li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">FAQs</a></li>
							<li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">About</a>
							</li>
						</ul>
					</div>

					<div class="col-6 col-md-2 mb-3">
						<h5>Section</h5>
						<ul class="nav flex-column">
							<li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">Home</a></li>
							<li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">Features</a>
							</li>
							<li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">Pricing</a>
							</li>
							<li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">FAQs</a></li>
							<li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">About</a>
							</li>
						</ul>
					</div>

					<div class="col-md-5 offset-md-1 mb-3">
						<form>
							<h5>Subscribe to our newsletter</h5>
							<p>Monthly digest of what's new and exciting from us.</p>
							<div class="d-flex flex-column flex-sm-row w-100 gap-2">
								<label for="newsletter1" class="visually-hidden">Email address</label>
								<input id="newsletter1" type="text" class="form-control" placeholder="Email address">
								<button class="btn btn-primary" type="button">Subscribe</button>
							</div>
						</form>
						
					</div>
				
				</div>

				<div class="d-flex flex-column flex-sm-row justify-content-between py-4 my-4 border-top">
					<p>© 2024 Company, Inc. All rights reserved.</p>
					<ul class="list-unstyled d-flex">

						<li class="ms-3"><a class="link-body-emphasis" href="#"> <img
									src="https://www.svgrepo.com/show/47722/twitter-black-shape.svg" width="34"
									height="34">
							</a></li>
						<li class="ms-3">
							<a class="link-body-emphasis" href="#">
								<img src="https://www.iconpacks.net/icons/2/free-instagram-logo-icon-3497-thumb.png"
									width="34" height="34">
							</a>
						</li>
						<li class="ms-3"><a class="link-body-emphasis" href="#"> <img
									src="https://cdn3.iconfinder.com/data/icons/social-media-2527/24/glyph_facebook_facebook_logo_logo_logotype_letter_f_social_media_social_media-512.png"
									width="34" height="34">
							</a></li>
					</ul>
				</div>
			</footer>
		</div>
	</div>
	<!-- End Footer -->
</body>
</html>