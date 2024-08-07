<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register new user</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<!-- Bootstrap JS -->
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
	integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
	integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
	crossorigin="anonymous"></script>

<style>
.red {
	color: red;
}
</style>
</head>
<body>
<% String error= request.getAttribute("error")+""; 
	error=(error.equals("null"))?"":error;
	
	String username=request.getAttribute("username")+"";
	String name=request.getAttribute("name")+"";
	String gender=request.getAttribute("gender")+"";
	String phone=request.getAttribute("phone")+"";
	String email=request.getAttribute("email")+"";
	String birth=request.getAttribute("birthDate")+"";
	String address=request.getAttribute("address")+"";
	String deliveryAddress=request.getAttribute("deliverAddress")+"";
	String buyerAddress=request.getAttribute("buyerAddress")+"";
	String subscribe=request.getAttribute("subcribeEmail")+"";
%>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-6">
				<h1 style="text-align: center; margin-top: 20px;">Sign Up</h1>
				<div class="red" id="error">
				<%=error %>
				</div>
				<form class="form" action="do-register" method=post">
					<div class="mb-3">
						<label for="InputUsername" class="form-label">Username<span
							class="red">*</span></label> <input type="text" class="form-control"
							id="InputUsername" aria-describedby="Help" name="Username"
							required="required" value=<%=username %>>
					</div>
					<div class="mb-3">
						<label for="InputPassword" class="form-label">Password<span
							class="red">*</span></label> <input type="password" class="form-control"
							id="Password" name="Password" onkeyup="checkPassword()"
							required="required">
						<div id="passwordHelpBlock" class="form-text">Your password
							must be 8-20 characters long, contain letters and numbers, and
							must not contain spaces, special characters, or emoji.</div>
					</div>
					<!-- confirm pass-->
					<label for="inputPassword" class="form-label">Confirm
						Password<span class="red">*</span><span class="red" id="msg"></span>
					</label> <input type="password" id="confirmPassword" class="form-control"
						aria-describedby="passwordHelpBlock" name="confirmPassword"
						onkeyup="checkPassword()" required="required">
					<div id="passwordHelpBlock" class="form-text">Please type
						your password again.</div>
					<hr>
			</div>

			<h4 style="text-align: center; color: olive; margin-top: 5px;">Your
				Information</h4>
			<div class="col-lg-6">
				<div class="input-group flex-nowrap">
					<span class="input-group-text" id="name">Full Name</span> <input
						type="text" class="form-control" placeholder="Your Fullname"
						aria-describedby="addon-wrapping" name="name" value=<%=name %>>
				</div>

				<div class="form-check form-check-inline mt-2">

					<input class="form-check-input" type="radio"
						name="gender" id="male" value="male"> <label
						class="form-check-label" for="male">Male</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio"
						name="gender" id="female" value="female"> <label
						class="form-check-label" for="female">female</label>
				</div>
				<div class="input-group flex-nowrap mt-2">
					<!--  <span class="input-group-text" id="gender">Gender</span> <input
						type="text" class="form-control" placeholder="Male/ Female"
						aria-describedby="addon-wrapping" name="gender"> -->
					<span class="input-group-text" id="phone">Phone Number</span> <input
						type="text" class="form-control" placeholder="+(84)..."
						aria-describedby="addon-wrapping" name="phone" value=<%=phone %>>
				</div>
				<div class="input-group flex-nowrap mt-2">
					<span class="input-group-text" id="email">Email</span> <input
						type="email" class="form-control" placeholder="example@gmail.com"
						aria-describedby="addon-wrapping" name="email" value=<%=email %>> <span
						class="input-group-text" id="birthDate">Date of birth</span> <input
						type="date" class="form-control" aria-describedby="addon-wrapping"
						name="birthDate" value=<%=birth %>>
				</div>
				<div class="input-group flex-nowrap mt-2">
					<span class="input-group-text" id="address">Now Address</span> <input
						type="text" class="form-control" aria-describedby="addon-wrapping"
						name="address" value=<%=address%>>

				</div>
				<div class="input-group flex-nowrap mt-2">
					<span class="input-group-text" id="deliveryAddress">Delivery
						Address</span> <input type="text" class="form-control"
						aria-describedby="addon-wrapping" name=<%=deliveryAddress %>>

				</div>
				<div class="input-group flex-nowrap mt-2">
					<span class="input-group-text" id="buyerAddress">Buyer's
						Address</span> <input type="text" class="form-control"
						aria-describedby="addon-wrapping" name="buyerAddress" value=<%=buyerAddress %>>

				</div>
				<div class="form-check mt-2 ">
					<input class="form-check-input" type="checkbox" value=""
						id="subscibeEmail"> <label class="form-check-label"
						for="subscibeEmail" name="subscibeEmail"> Subscribe to
						receive daily ads in your email.</label>
				</div>
				<hr>
				<div class="col text-center">
					<label class="form-label" for="acception">Agree to <a
						href="term.jsp">Terms and Conditions</a><span class="red">*</span>
					</label> <input type="checkbox" class="form-check-input " id="acception"
						name="acception" required="required" onclick="processTerm()">
				</div>

				<div class="col text-center">
					<button type="submit" class="btn btn-primary mt-3" id="submit"
						style="visibility: hidden;">Sign in</button>
				</div>
			</div>
			</form>

		</div>
	</div>
	</div>

	<!-- footer -->
<!--  
	<div class="bg-body-tertiary mt-5">
		<div class="container">
			<footer class="py-5 ">
				<div class="row">
					<div class="col-6 col-md-2 mb-3">
						<h5>Section</h5>
						<ul class="nav flex-column">
							<li class="nav-item mb-2"><a href="#"
								class="nav-link p-0 text-body-secondary">Home</a></li>
							<li class="nav-item mb-2"><a href="#"
								class="nav-link p-0 text-body-secondary">Features</a></li>
							<li class="nav-item mb-2"><a href="#"
								class="nav-link p-0 text-body-secondary">Pricing</a></li>
							<li class="nav-item mb-2"><a href="#"
								class="nav-link p-0 text-body-secondary">FAQs</a></li>
							<li class="nav-item mb-2"><a href="#"
								class="nav-link p-0 text-body-secondary">About</a></li>
						</ul>
					</div>

					<div class="col-6 col-md-2 mb-3">
						<h5>Section</h5>
						<ul class="nav flex-column">
							<li class="nav-item mb-2"><a href="#"
								class="nav-link p-0 text-body-secondary">Home</a></li>
							<li class="nav-item mb-2"><a href="#"
								class="nav-link p-0 text-body-secondary">Features</a></li>
							<li class="nav-item mb-2"><a href="#"
								class="nav-link p-0 text-body-secondary">Pricing</a></li>
							<li class="nav-item mb-2"><a href="#"
								class="nav-link p-0 text-body-secondary">FAQs</a></li>
							<li class="nav-item mb-2"><a href="#"
								class="nav-link p-0 text-body-secondary">About</a></li>
						</ul>
					</div>

					<div class="col-6 col-md-2 mb-3">
						<h5>Section</h5>
						<ul class="nav flex-column">
							<li class="nav-item mb-2"><a href="#"
								class="nav-link p-0 text-body-secondary">Home</a></li>
							<li class="nav-item mb-2"><a href="#"
								class="nav-link p-0 text-body-secondary">Features</a></li>
							<li class="nav-item mb-2"><a href="#"
								class="nav-link p-0 text-body-secondary">Pricing</a></li>
							<li class="nav-item mb-2"><a href="#"
								class="nav-link p-0 text-body-secondary">FAQs</a></li>
							<li class="nav-item mb-2"><a href="#"
								class="nav-link p-0 text-body-secondary">About</a></li>
						</ul>
					</div>

					<div class="col-md-5 offset-md-1 mb-3">
						<form>
							<h5>Subscribe to our newsletter</h5>
							<p>Monthly digest of what's new and exciting from us.</p>
							<div class="d-flex flex-column flex-sm-row w-100 gap-2">
								<label for="newsletter1" class="visually-hidden">Email
									address</label> <input id="newsletter1" type="text"
									class="form-control" placeholder="Email address">
								<button class="btn btn-primary" type="button">Subscribe</button>
							</div>
						</form>

					</div>

				</div>

				<div
					class="d-flex flex-column flex-sm-row justify-content-between py-4 my-4 border-top">
					<p>© 2024 Company, Inc. All rights reserved.</p>
					<ul class="list-unstyled d-flex">

						<li class="ms-3"><a class="link-body-emphasis" href="#">
								<img
								src="https://www.svgrepo.com/show/47722/twitter-black-shape.svg"
								width="34" height="34">
						</a></li>
						<li class="ms-3"><a class="link-body-emphasis" href="#">
								<img
								src="https://www.iconpacks.net/icons/2/free-instagram-logo-icon-3497-thumb.png"
								width="34" height="34">
						</a></li>
						<li class="ms-3"><a class="link-body-emphasis" href="#">
								<img
								src="https://cdn3.iconfinder.com/data/icons/social-media-2527/24/glyph_facebook_facebook_logo_logo_logotype_letter_f_social_media_social_media-512.png"
								width="34" height="34">
						</a></li>
					</ul>
				</div>
			</footer>
		</div>
	</div>
  -->

	<!-- Javascript -->
	<script lang="Javascript">
		function checkPassword() {
			pass = document.getElementById("Password").value;
			confirmPass = document.getElementById("confirmPassword").value;
			if (pass != confirmPass) {
				document.getElementById("msg").innerHTML = "Confirm password do not match";
				return false;
			} else if (pass == "" && confirmPass == "") {
				document.getElementById("msg").innerHTML = "Please do not allow null";
				return false;
			} else {
				document.getElementById("msg").innerHTML = "Confirm password match";
				return true;
			}
		}
		
		function processTerm(){
			okTerm=document.getElementById("acception");
			if(okTerm.checked==true){
				document.getElementById("submit").style.visibility="visible";
			}else{
				document.getElementById("submit").style.visibility="hidden";
			}
		}
		
		
	</script>

</body>
</html>