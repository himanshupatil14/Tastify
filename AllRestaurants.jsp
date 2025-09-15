<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.tap.models.User, com.tap.models.Restaurant, java.util.List"%>
<%
User user = (User) session.getAttribute("user");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Restaurant - Tastify</title>
<link rel="icon" href="images/titlelogo.png" type="image/png">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<style>
:root {
	--primary-color: #ff6b35;
	--secondary-color: #f7931e;
	--accent-color: #ffd166;
	--dark-bg: #121212;
	--card-bg: #1e1e1e;
	--text-primary: #f1f1f1;
	--text-secondary: #b0b0b0;
	--success-color: #4caf50;
	--info-color: #2196f3;
	--purple: #9c27b0;
	--red: #f44336;
}

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	background-color: var(--dark-bg);
	color: var(--text-primary);
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	line-height: 1.6;
	padding-top: 70px;
}

/* Scrollbar Styling */
::-webkit-scrollbar {
	width: 10px;
}

::-webkit-scrollbar-track {
	background: #1e1e1e;
}

::-webkit-scrollbar-thumb {
	background: var(--primary-color);
	border-radius: 5px;
}

/* Navbar */
.navbar {
	background-color: var(--card-bg);
	padding: 15px 30px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.7);
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	z-index: 1000;
}

.navbar .brand {
	font-size: 24px;
	font-weight: bold;
	color: var(--primary-color);
	letter-spacing: 1px;
	display: flex;
	align-items: center;
}

.navbar .brand i {
	margin-right: 8px;
	font-size: 28px;
}

.navbar .search-container {
	flex-grow: 1;
	max-width: 500px;
	margin: 0 30px;
	position: relative;
}

.navbar .search-container input {
	width: 100%;
	padding: 10px 40px 10px 15px;
	border-radius: 25px;
	border: none;
	background-color: rgba(255, 255, 255, 0.1);
	color: var(--text-primary);
	font-size: 14px;
	transition: all 0.3s ease;
}

.navbar .search-container input:focus {
	outline: none;
	background-color: rgba(255, 255, 255, 0.15);
	box-shadow: 0 0 0 2px var(--primary-color);
}

.navbar .search-container button {
	position: absolute;
	right: 10px;
	top: 50%;
	transform: translateY(-50%);
	background: none;
	border: none;
	color: var(--text-secondary);
	cursor: pointer;
	font-size: 16px;
}

.navbar nav {
	display: flex;
	align-items: center;
}

.navbar nav a {
	color: var(--text-primary);
	text-decoration: none;
	margin-left: 20px;
	font-size: 14px;
	transition: color 0.3s;
	position: relative;
}

.navbar nav a:hover {
	color: var(--primary-color);
}

.navbar nav a i {
	font-size: 18px;
	margin-right: 5px;
}

.navbar .cart-badge {
	position: absolute;
	top: -8px;
	right: -8px;
	background-color: var(--primary-color);
	color: white;
	border-radius: 50%;
	width: 18px;
	height: 18px;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 10px;
	font-weight: bold;
}

.navbar .nav-item {
	position: relative;
}

/* Hero Section with Carousel */
.hero-section {
	position: relative;
	height: 500px;
	overflow: hidden;
	margin-top: 0; /* Removed margin-top */
}

.carousel-container {
	position: relative;
	width: 100%;
	height: 100%;
}

.carousel-slide {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	opacity: 0;
	transition: opacity 1s ease-in-out;
	background-size: cover;
	background-position: center;
}

.carousel-slide.active {
	opacity: 1;
}

.carousel-slide::before {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: linear-gradient(rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.7));
}

.hero-content {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	text-align: center;
	color: white;
	z-index: 2;
	max-width: 800px;
	padding: 0 20px;
}

.hero-content h1 {
	font-size: 48px;
	font-weight: bold;
	margin-bottom: 20px;
	text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
}

.hero-content p {
	font-size: 20px;
	margin-bottom: 30px;
	text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5);
}

.hero-btn {
	display: inline-block;
	padding: 12px 30px;
	background-color: var(--primary-color);
	color: white;
	text-decoration: none;
	border-radius: 30px;
	font-weight: bold;
	font-size: 16px;
	transition: all 0.3s ease;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
}

.hero-btn:hover {
	background-color: var(--secondary-color);
	transform: translateY(-2px);
	box-shadow: 0 6px 12px rgba(0, 0, 0, 0.4);
}

.carousel-nav {
	position: absolute;
	bottom: 20px;
	left: 50%;
	transform: translateX(-50%);
	display: flex;
	gap: 10px;
	z-index: 3;
}

.carousel-dot {
	width: 12px;
	height: 12px;
	border-radius: 50%;
	background-color: rgba(255, 255, 255, 0.5);
	cursor: pointer;
	transition: all 0.3s ease;
}

.carousel-dot.active {
	background-color: var(--primary-color);
	transform: scale(1.2);
}

.carousel-arrow {
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
	width: 40px;
	height: 40px;
	background-color: rgba(255, 255, 255, 0.2);
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	color: white;
	font-size: 18px;
	cursor: pointer;
	z-index: 3;
	transition: all 0.3s ease;
}

.carousel-arrow:hover {
	background-color: rgba(255, 255, 255, 0.3);
}

.carousel-prev {
	left: 20px;
}

.carousel-next {
	right: 20px;
}

/* About Section */
.about-section {
	padding: 60px 30px;
	background: linear-gradient(135deg, rgba(255, 107, 53, 0.05),
		rgba(247, 147, 30, 0.05));
	text-align: center;
}

.about-container {
	max-width: 1200px;
	margin: 0 auto;
	max-height: 1100px
}

.about-section h2 {
	font-size: 36px;
	color: var(--primary-color);
	margin-bottom: 20px;
}

.about-section p {
	font-size: 18px;
	color: var(--text-secondary);
	max-width: 800px;
	margin: 0 auto 40px;
	line-height: 1.8;
}

.features-grid {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
	gap: 30px;
	margin-top: 40px;
}

.feature-card {
	background-color: var(--card-bg);
	border-radius: 12px;
	padding: 15px;
	text-align: center;
	transition: all 0.3s ease;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
}

.feature-card:hover {
	transform: translateY(-10px);
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
}

.feature-icon {
	font-size: 48px;
	color: var(--primary-color);
	margin-bottom: 20px;
	transition: color 0.3s ease, transform 0.3s ease;
}

.feature-card:hover .feature-icon {
	color: var(--secondary-color);
	transform: scale(1.1);
}

.feature-card h3 {
	font-size: 22px;
	margin-bottom: 15px;
	color: var(--text-primary);
}

.feature-card p {
	color: var(--text-secondary);
	font-size: 16px;
}

/* Page Header*/
.page-header {
	padding: 50px 20px;
	text-align: center;
	margin-bottom: 40px;
	background: linear-gradient(135deg, rgba(255, 107, 53, 0.15),
		rgba(247, 147, 30, 0.15));
	border-radius: 12px;
	animation: fadeIn 1s ease-in-out;
}

.page-header h1 {
	font-size: 40px;
	font-weight: 700;
	color: var(--primary-color);
	margin-bottom: 12px;
	position: relative;
	display: inline-block;
}

.page-header h1::after {
	content: "";
	position: absolute;
	width: 60%;
	height: 3px;
	background: var(--secondary-color);
	left: 20%;
	bottom: -6px;
	border-radius: 2px;
	transition: width 0.3s ease;
}

.page-header h1:hover::after {
	width: 100%;
	left: 0;
}

.page-subtitle {
	color: var(--text-secondary);
	font-size: 18px;
	line-height: 1.6;
	max-width: 600px;
	margin: 0 auto;
	opacity: 0.9;
}

/* Restaurant grid */
/* Restaurant Grid */
.grid-container {
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
	gap: 25px;
	padding: 0 30px 30px;
}

/* Card styling */
.restaurant-card {
	background-color: var(--card-bg);
	border-radius: 15px;
	overflow: hidden;
	text-decoration: none;
	color: inherit;
	transition: all 0.4s ease;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.5);
	display: flex;
	flex-direction: column;
	height: 100%;
	position: relative;
	cursor: pointer;
}

.restaurant-card:hover {
	transform: translateY(-10px) scale(1.02);
	box-shadow: 0 12px 25px rgba(0, 0, 0, 0.7);
}

/* Image container */
.restaurant-img-container {
	position: relative;
	height: 220px;
	overflow: hidden;
	border-bottom: 1px solid rgba(255, 255, 255, 0.1);
}

.restaurant-img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	transition: transform 0.5s ease, filter 0.5s ease;
}

.restaurant-card:hover .restaurant-img {
	transform: scale(1.1);
	filter: brightness(0.85);
}

/* Offer badge */
.restaurant-offer {
	position: absolute;
	top: 15px;
	left: 15px;
	background: linear-gradient(45deg, var(--primary-color),
		var(--secondary-color));
	color: white;
	padding: 6px 12px;
	border-radius: 6px;
	font-size: 13px;
	font-weight: 700;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
	letter-spacing: 0.5px;
}

/* Rating badge */
.restaurant-rating-badge {
	position: absolute;
	bottom: 15px;
	right: 15px;
	background-color: rgba(0, 0, 0, 0.8);
	color: white;
	padding: 6px 10px;
	border-radius: 6px;
	font-size: 14px;
	font-weight: 600;
	display: flex;
	align-items: center;
	backdrop-filter: blur(5px);
}

.restaurant-rating-badge i {
	color: var(--accent-color);
	margin-right: 5px;
	font-size: 16px;
}

/* Details section */
.restaurant-details {
	padding: 18px 20px;
	flex-grow: 1;
	display: flex;
	flex-direction: column;
	transition: all 0.3s ease;
}

.restaurant-name {
	font-size: 22px;
	font-weight: 700;
	color: var(--text-primary);
	margin-bottom: 8px;
	text-transform: capitalize;
}

.restaurant-meta {
	display: flex;
	justify-content: space-between;
	margin-bottom: 12px;
	font-size: 15px;
}

.restaurant-cuisine-type {
	color: var(--info-color);
	font-weight: 500;
}

.restaurant-price {
	color: var(--success-color);
	font-weight: 500;
}

.restaurant-location {
	font-size: 14px;
	color: var(--text-secondary);
	display: flex;
	align-items: center;
	margin-bottom: 12px;
}

.restaurant-location i {
	margin-right: 6px;
	font-size: 14px;
	color: var(--primary-color);
}

/* Info section */
.restaurant-info {
	display: flex;
	justify-content: space-between;
	margin-top: auto;
	padding-top: 12px;
	border-top: 1px solid rgba(255, 255, 255, 0.1);
}

.restaurant-delivery-time, .restaurant-delivery-fee {
	font-size: 14px;
	color: var(--text-secondary);
	display: flex;
	align-items: center;
	font-weight: 500;
}

.restaurant-delivery-time i, .restaurant-delivery-fee i {
	margin-right: 6px;
	font-size: 14px;
	color: var(--primary-color);
}

/* Hover effects */
.restaurant-card:hover .restaurant-details {
	transform: translateY(-5px);
}

.restaurant-card:hover .restaurant-info {
	color: var(--accent-color);
}

/* Footer */
.footer {
	background-color: var(--card-bg);
	color: var(--text-secondary);
	padding: 30px 20px 15px;
	font-size: 14px;
	border-top: 3px solid var(--primary-color);
}

.footer-content {
	max-width: 1200px;
	margin: 0 auto;
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
	gap: 20px;
	align-items: start;
}

/* Section Headings */
.footer-section h3 {
	color: var(--primary-color);
	margin-bottom: 10px;
	font-size: 16px;
	text-transform: uppercase;
}

/* Paragraphs and links */
.footer-section p, .footer-section a {
	color: var(--text-secondary);
	text-decoration: none;
	margin: 4px 0;
	line-height: 1.5;
	font-size: 13px;
}

.footer-section a:hover {
	color: var(--primary-color);
}

/* Creator section */
.center-section {
	text-align: center;
}

.creator-img {
	width: 60px;
	height: 60px;
	border-radius: 50%;
	object-fit: cover;
	border: 2px solid var(--primary-color);
	margin-bottom: 6px;
}

.creator-name {
	font-weight: 600;
	color: var(--text-primary);
	margin-bottom: 4px;
}

.creator-email a {
	color: var(--text-secondary);
	font-size: 13px;
}

.creator-social {
	justify-content: center;
}

/* Popular cuisines */
.footer-links {
	list-style: none;
	padding: 0;
}

.footer-links li {
	margin-bottom: 6px;
}

/* Social Links */
.social-links {
	display: flex;
	gap: 10px;
	margin-top: 8px;
}

.social-links a {
	width: 30px;
	height: 30px;
	display: flex;
	align-items: center;
	justify-content: center;
	border-radius: 50%;
	background-color: rgba(255, 255, 255, 0.1);
	color: var(--text-primary);
	transition: all 0.3s ease;
}

.social-links a:hover {
	background-color: var(--primary-color);
	color: white;
	transform: translateY(-2px) scale(1.1);
}

/* Footer bottom */
.footer-bottom {
	text-align: center;
	margin-top: 15px;
	border-top: 1px solid rgba(255, 255, 255, 0.1);
	padding-top: 10px;
	font-size: 12px;
	color: var(--text-secondary);
}
/* Back to top button */
.back-to-top {
	position: fixed;
	bottom: 20px;
	right: 20px;
	width: 40px;
	height: 40px;
	border-radius: 50%;
	background-color: var(--primary-color);
	color: white;
	display: flex;
	align-item: center;
	justify-content: center;
	cursor: pointer;
	opacity: 0;
	visibility: hidden;
	transition: all 0.3s ease;
	z-index: 1000;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
}

.back-to-top.visible {
	opacity: 1;
	visibility: visible;
}

.back-to-top:hover {
	background-color: var(--secondary-color);
}

/* Responsive */
@media ( max-width : 768px) {
	.footer-content {
		grid-template-columns: 1fr 1fr;
		gap: 15px;
	}
}

@media ( max-width : 500px) {
	.footer-content {
		grid-template-columns: 1fr;
		text-align: center;
	}
	.footer-section {
		margin-bottom: 15px;
	}
}

/* Fade-in animation */
@
keyframes fadeIn {from { opacity:0;
	transform: translateY(-20px);
}

to {
	opacity: 1;
	transform: translateY(0);
}
}
</style>
</head>
<body>
	<!-- Navbar -->
	<!-- Navbar -->
	<div class="navbar">
		<div class="brand">
			<i class="fas fa-utensils"></i> Tastify
		</div>

		<%
		if (user != null) {
		%>
		<div
			style="position: absolute; left: 50%; transform: translateX(-50%); color: var(--primary-color); font-weight: 700; font-size: 22px; line-height: 1; white-space: nowrap;">
			Hello,
			<%=user.getUsername()%>
		</div>
		<%
		}
		%>

		<nav>
			<a href="#" title="Home"><i class="fas fa-home"></i> Home</a> <a
				href="myorders" title="My orders"><i class="fas fa-receipt"></i>
				My Orders</a> <a href="#" title="Profile"
				onclick="document.getElementById('profileModal').style.display='block'">
				<i class="fas fa-user"></i> Profile
			</a>
			<div class="nav-item">
				<a href="#footersection" title="Contact"> <i
					class="fas fa-envelope"></i> Contact
				</a>
			</div>
		</nav>
	</div>

	<!-- Hero Section with Carousel -->
	<div class="hero-section">
		<div class="carousel-container">
			<div class="carousel-slide active"
				style="background-image: url('images/froent1.jpg');">
				<div class="hero-content">
					<h1>Your Cravings, Our Priority</h1>
					<p>Discover top restaurants and enjoy speedy delivery</p>
					<a href="offers.jsp" class="hero-btn">Order Now</a>
				</div>
			</div>

			<div class="carousel-slide"
				style="background-image: url('images/froent2.jpg');">
				<div class="hero-content">
					<h1>Special Offers Today</h1>
					<p>Get up to 50% off on your first order</p>
					<a href="offers.jsp" class="hero-btn">View Offers</a>
				</div>
			</div>

			<div class="carousel-slide"
				style="background-image: url('images/froent3.jpg');">
				<div class="hero-content">
					<h1>Sweet Treats Just a Click Away</h1>
					<p>Explore a wide variety of desserts delivered to your
						doorstep.</p>
					<a href="offers.jsp" class="hero-btn">Order Desserts</a>
				</div>
			</div>
		</div>

		<div class="carousel-nav">
			<div class="carousel-dot active" data-slide="0"></div>
			<div class="carousel-dot" data-slide="1"></div>
			<div class="carousel-dot" data-slide="2"></div>
		</div>

		<div class="carousel-arrow carousel-prev">
			<i class="fas fa-chevron-left"></i>
		</div>
		<div class="carousel-arrow carousel-next">
			<i class="fas fa-chevron-right"></i>
		</div>
	</div>

	<!-- About Section -->
	<div class="about-section">
		<div class="about-container">
			<h2>Welcome to Tatify</h2>
			<p>From comfort food to gourmet dishes, explore an endless
				variety of cuisines and satisfy every craving without stepping out
				of your home.</p>

			<div class="features-grid">
				<div class="feature-card">
					<div class="feature-icon">
						<i class="fas fa-clock"></i>
					</div>
					<h3>Lightning-Fast Delivery</h3>
					<p>Hot, fresh and right on time — because cravings can’t wait.</p>
				</div>

				<div class="feature-card">
					<div class="feature-icon">
						<i class="fas fa-utensils"></i>
					</div>
					<h3>Endless Options</h3>
					<p>From local favorites to global cuisines, explore endless
						food choices in one place.</p>
				</div>

				<div class="feature-card">
					<div class="feature-icon">
						<i class="fas fa-tag"></i>
					</div>
					<h3>Save While You Feast</h3>
					<p>Big discounts and exciting combos that make every meal more
						rewarding.</p>
				</div>

				<div class="feature-card">
					<div class="feature-icon">
						<i class="fas fa-heart"></i>
					</div>
					<h3>Quality Guaranteed</h3>
					<p>We partner only with the best restaurants to ensure you get
						the highest quality food.</p>
				</div>
			</div>
		</div>
	</div>


	<!-- Page Header -->
	<div class="page-header">
		<h1>Explore Restaurant</h1>
		<p class="page-subtitle">From local bites to global delights, we
			bring the city’s best to your plates.</p>
	</div>

	<!-- Restaurant Grid -->
	<div class="grid-container">
		<%
		List<Restaurant> restaurants = (List<Restaurant>) request.getAttribute("restaurantList");
		if (restaurants != null && !restaurants.isEmpty()) {
			for (Restaurant restaurant : restaurants) {
		%>
		<a href="menu?restaurantId=<%=restaurant.getRestaurantId()%>"
			class="restaurant-card-link">
			<div class="restaurant-card">
				<img src="<%=restaurant.getImagePath()%>" alt="Restaurant Image"
					class="restaurant-img">

				<div class="restaurant-offer">20% OFF</div>
				<div class="restaurant-rating-badge">
					<i class="fas fa-star"></i>
					<%=restaurant.getRating()%>
				</div>

				<div class="restaurant-details">
					<div class="restaurant-name"><%=restaurant.getName()%></div>

					<div class="restaurant-meta">
						<div class="restaurant-cuisine-type"><%=restaurant.getCastingType()%></div>
						<%-- Removed restaurant.getEta() since it's not in model --%>
					</div>

					<div class="restaurant-location">
						<i class="fas fa-map-marker-alt"></i>
						<%=restaurant.getAddress()%>
					</div>

					<div class="restaurant-info">
						<%-- Removed delivery time ETA --%>
						<div class="restaurant-delivery-fee">
							<i class="fas fa-bicycle"></i> Free Delivery
						</div>
					</div>
				</div>
			</div>
		</a>
		<%
		} // end for loop
		} else {
		%>
		<div style="grid-column: 1/-1; text-align: center; padding: 40px;">
			<i class="fas fa-store-slash"
				style="font-size: 48px; color: var(--text-secondary); margin-bottom: 15px;"></i>
			<h3 style="color: var(--text-primary); margin-bottom: 10px;">No
				restaurants available</h3>
			<p style="color: var(--text-secondary);">We couldn't find any
				restaurants matching your criteria.</p>
		</div>
		<%
		}
		%>
	</div>


	<!-- Footer -->
	<div class="footer" id="footersection">
		<div class="footer-content">
			<!-- About Section -->
			<div class="footer-section">
				<h3>About Tatify</h3>
				<p>From local favorites to global delights, Tastify brings your
					cravings to your doorstep with fast delivery and top quality!</p>
				<div class="social-links">
					<a href="#" title="Facebook"><i class="fab fa-facebook-f"></i></a>
					<a href="#" title="Twitter"><i class="fab fa-twitter"></i></a> <a
						href="#" title="Instagram"><i class="fab fa-instagram"></i></a> <a
						href="https://www.linkedin.com/in/himanshu-patil-744576312"
						title="LinkedIn"><i class="fab fa-linkedin-in"></i></a>
				</div>
			</div>

			<!-- Creator Section -->
			<div class="footer-section center-section">
				<h3>Website Created By</h3>
				<img alt="Himanshu Patil" src="images/HimanshuPatil.jpg"
					class="creator-img">
				<p class="creator-name">Himanshu Patil</p>
				<p class="creator-email">
					<i class="fas fa-envelope"></i> <a
						href="mailto:himanshu.patil7549@gmail.com">himanshu.patil7549@gmail.com</a>
				</p>
				<div class="social-links creator-social">
					<a href="https://www.linkedin.com/in/himanshu-patil-744576312"
						target="_blank"><i class="fab fa-linkedin-in"></i></a> <a
						href="https://github.com/himanshupatil14" target="_blank"><i
						class="fab fa-github"></i></a> <a href="mailto:himanshu.patil7549@gmail.com"
						target="_blank"> <i class="fas fa-envelope"></i>
					</a>
				</div>
			</div>

			<!-- Popular Cuisines -->
			<div class="footer-section">
				<h3>Popular Cuisines</h3>
				<ul class="footer-links">
					<li><a href="#">Indian</a></li>
					<li><a href="#">Chinese</a></li>
					<li><a href="#">Italian</a></li>
					<li><a href="#">Mexican</a></li>
					<li><a href="#">Thai</a></li>
				</ul>
			</div>

			<!-- Contact Section -->
			<div class="footer-section">
				<h3>Contact Us</h3>
				<p>
					<i class="fas fa-phone-alt"></i> +91 83908701175
				</p>
				<p>
					<i class="fas fa-envelope"></i> <a
						href="mailto:support@Tastify.com">support@Tastify.com</a>
				</p>
				<p>
					<i class="fas fa-map-marker-alt"></i> Tastify Office, Amrut Road,
					Pune 12345
				</p>
			</div>
		</div>

		<div class="footer-bottom">
			<p>© 2025 Tastify. All rights reserved.</p>
		</div>
	</div>
	<!-- Back to top button -->
	<div class="back-to-top" id="backToTop">
		<i class="fas fa-arrow-up"></i>
	</div>

	<script>
	//Carousel functionality
	// Select all the carousel slides
	const slides = document.querySelectorAll('.carousel-slide');
	const dots = document.querySelectorAll('.carousel-dot');  // NOTE: fix typo "queryDelectorAll" -> "querySelectorAll"
	const prevBtn = document.querySelector('.carousel-prev');
	const nextBtn = document.querySelector('.carousel-next');

	// Keep track of which slide is currently visible
	let currentSlide = 0;

	// Function to show a specific slide based on index
	function showSlide(index) {
	    // Hide all slides
	    slides.forEach(slide => slide.classList.remove('active'));
	    
	    // Deactivate all dots
	    dots.forEach(dot => dot.classList.remove('active'));
	    
	    // Show the chosen slide and activate the corresponding dot
	    slides[index].classList.add('active');
	    dots[index].classList.add('active');
	    
	    // Update current slide index
	    currentSlide = index;
	}
	
		// Function to go to the next slide
	function nextSlide() {
	    currentSlide = (currentSlide + 1) % slides.length; // Wraps around to first slide after last
	    showSlide(currentSlide);
	}

	// Function to go to the previous slide
	function prevSlide() {
	    currentSlide = (currentSlide - 1 + slides.length) % slides.length; // Wraps around to last slide if current is 0
	    showSlide(currentSlide);
	}

	// Automatically advance the carousel every 5 seconds
	setInterval(nextSlide, 5000);
	
	//Navigation controls
	nextBtn.addEventListener('click', nextSlide);
	prevBtn.addEventListener('click', prevSlide);
	
	
	//Dot navigation
	dots.forEach((dot, index) => {
		dot.addEventListener('click',() => {
			showSlider(index);
		})
	})
	
	// Back to top button functionality
    const backToTopButton = document.getElementById('backToTop');
	
	 window.addEventListener('scroll', () => {
         if (window.pageYOffset > 300) {
             backToTopButton.classList.add('visible');
         } else {
             backToTopButton.classList.remove('visible');
         }
     });
	 
	 backToTopButton.addEventListener('click', () => {
         window.scrollTo({
             top: 0,
             behavior: 'smooth'
         });
     });
	 
	// Image loading error handling
     const restaurantImages = document.querySelectorAll('.restaurant-img');
     
     restaurantImages.forEach(img => {
         img.addEventListener('error', function() {
             this.src = 'https://picsum.photos/seed/restaurant/400/300.jpg';
         });
     });
 </script>
	<div id="profileModal"
		style="display: none; position: fixed; top: 20%; right: 20px; transform: none; background: var(--card-bg); color: var(--text-primary); padding: 30px; border-radius: 12px; z-index: 2000; min-width: 320px; max-height: 60vh; overflow-y: auto; box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3); text-align: center;">

		<img src="images/avtar.png" alt="Profile Avatar"
			style="width: 80px; height: 80px; border-radius: 50%; border: 2px solid #ff6b35;">

		<h2>My Profile</h2>
		<hr style="border-color: #ff6b35; margin-bottom: 18px;">
		<p>
			<strong>Name:</strong>
			<%= user != null ? user.getUsername() : "" %></p>
		<p>
			<strong>Phone:</strong>
			<%= user != null ? user.getPhoneNumber() : "" %></p>
		<p>
			<strong>Email:</strong>
			<%= user != null ? user.getEmail() : "" %></p>
		<p>
			<strong>Address:</strong>
			<%= user != null ? user.getAddress() : "" %></p>
		<p>
			<strong>Role:</strong>
			<%= user != null ? user.getRole() : "" %></p>
		<button
			onclick="document.getElementById('profileModal').style.display='none'"
			style="margin-top: 16px; padding: 7px 20px; border: none; border-radius: 6px; background: var(--primary-color); color: #fff; font-weight: 600; cursor: pointer;">Close</button>
	</div>




</body>
</html>