<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.tap.models.Menu"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tastify - Menu</title>
<link rel="icon" href="images/titlelogo.png" type="image/png">


<!-- Font Awesome for icons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

<style>
:root {
	--primary-color: #ff6b35;
	--accent-color: #ffa347;
	--card-bg: #1e1e1e;
	--text-primary: #ffffff;
}

body {
	margin: 0;
	font-family: Arial, sans-serif;
	background-color: #121212;
	color: var(--text-primary);
}

/* Header */
.header {
	background-color: var(--card-bg);
	padding: 15px 30px;
	box-shadow: 0 2px 12px rgba(0, 0, 0, 0.3);
	position: sticky;
	top: 0;
	z-index: 1000;
}

.header-content {
	display: flex;
	justify-content: space-between;
	align-items: center;
	max-width: 1200px;
	margin: 0 auto;
}

/* Logo */
.logo {
	font-size: 24px;
	font-weight: 700;
	display: flex;
	align-items: center;
	color: var(--primary-color);
}

.logo i {
	margin-right: 10px;
	color: var(--accent-color);
	transition: transform 0.3s ease;
}

.logo i:hover {
	transform: rotate(20deg);
}

/* Cart Info */
.cart-info {
	display: flex;
	align-items: center;
	gap: 12px;
	font-weight: 600;
	font-size: 16px;
	color: var(--text-primary);
	position: relative;
}

/* Cart icon with badge */
.cart-icon {
	position: relative;
	font-size: 22px;
	cursor: pointer;
	transition: transform 0.3s ease;
}

.cart-icon:hover {
	transform: scale(1.1);
}

.cart-count {
	position: absolute;
	top: -8px;
	right: -10px;
	background-color: var(--primary-color);
	color: #fff;
	font-size: 12px;
	font-weight: 700;
	border-radius: 50%;
	width: 18px;
	height: 18px;
	display: flex;
	justify-content: center;
	align-items: center;
}

/* Cart total */
.cart-total {
	background-color: rgba(255, 255, 255, 0.1);
	padding: 4px 12px;
	border-radius: 6px;
	transition: background 0.3s ease, color 0.3s ease;
}

.cart-total:hover {
	background-color: var(--primary-color);
	color: #fff;
}

/* Dropdown cart preview */
.cart-dropdown {
	display: none;
	position: absolute;
	top: 40px;
	right: 0;
	background-color: var(--card-bg);
	width: 250px;
	padding: 15px;
	border-radius: 10px;
	box-shadow: 0 6px 20px rgba(0, 0, 0, 0.5);
}

.cart-info:hover .cart-dropdown {
	display: block;
}

.cart-dropdown p {
	margin: 8px 0;
	font-size: 14px;
	border-bottom: 1px solid rgba(255, 255, 255, 0.2);
	padding-bottom: 6px;
}

.cart-dropdown p:last-child {
	border-bottom: none;
}
/* Page Title & Subtitle */
.page-title {
	font-size: 32px;
	font-weight: 700;
	color: var(--primary-color, #ff6b35);
	text-align: center;
	margin-bottom: 10px;
}

.subtitle {
	font-size: 16px;
	color: var(--text-secondary, #ccc);
	text-align: center;
	margin-bottom: 30px;
}

/* Menu Container */
.menu-container {
	max-width: 1200px;
	margin: 0 auto;
	padding: 20px;
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
	/* 3–4 per row */
	gap: 20px;
}

.menu-item:hover {
	transform: translateY(-5px);
}

/* Menu Item Image */
.menu-image-container {
	width: 100%;
	height: 180px;
	overflow: hidden;
}

.menu-image-container img, .menu-image {
	width: 100%;
	height: 100%;
	object-fit: cover;
	display: block;
}

/* Menu Content */
.menu-content {
	padding: 12px;
}

.menu-title {
	font-size: 18px;
	font-weight: 600;
	margin-bottom: 6px;
	color: var(--primary-color);
}

.menu-description {
	font-size: 14px;
	color: #bbb;
	margin-bottom: 10px;
}

.menu-meta {
	display: flex;
	justify-content: space-between;
	font-size: 14px;
	margin-bottom: 10px;
	color: #ddd;
}

.price {
	font-size: 16px;
	font-weight: bold;
	color: var(--accent-color);
}

.add-to-cart {
	background: var(--primary-color);
	color: #fff;
	border: none;
	padding: 8px 14px;
	border-radius: 6px;
	cursor: pointer;
	transition: background 0.3s ease;
}

.add-to-cart:hover {
	background: var(--accent-color);
}



/* Banner Content */
.featured-banner {
	display: flex;
	flex-wrap: wrap;          /* allows content to wrap on smaller screens */
	align-items: center;
	justify-content: space-between;
	width: 100%;
	max-width: 1200px;
	margin: 0 auto 30px auto;
	background: linear-gradient(135deg, #ff7a3c, #ffc169);
	border-radius: 16px;
	padding: 25px 30px;
	color: #fff;
	position: relative;
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.4);
}

.banner-content {
	flex: 1;
	display: flex;
	flex-direction: column;
	justify-content: center;   /* vertically center text + button */
	max-width: 600px;          /* limits content width so button stays inside */
}

.banner-content h3 {
	font-size: 26px;
	font-weight: 800;
	margin-bottom: 12px;
}

.banner-content p {
	font-size: 16px;
	font-weight: 500;
	line-height: 1.6;
	color: #fefefe;
}

.banner-content button {
	margin-top: 15px;
	padding: 12px 24px;
	border: none;
	border-radius: 10px;
	background-color: #1e1e1e;
	color: #fff;
	font-weight: 700;
	cursor: pointer;
	align-self: flex-start;    /* keeps button aligned with text */
	transition: all 0.3s ease;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
}

.banner-content button:hover {
	background-color: #ff6b35;
	transform: scale(1.07);
	box-shadow: 0 6px 18px rgba(0, 0, 0, 0.4);
}

.featured-banner img {
	border-radius: 16px;
	object-fit: cover;
	width: 180px;
	height: 180px;
	margin-left: 25px;
	box-shadow: 0 6px 25px rgba(0, 0, 0, 0.4);
	transition: transform 0.5s ease;
}

.featured-banner:hover img {
	transform: scale(1.05) rotate(1deg);
}

/* Responsive */
@media screen and (max-width: 768px) {
	.featured-banner {
		flex-direction: column;
		text-align: center;
		padding: 20px;
	}
	.banner-content {
		max-width: 100%;
	}
	.banner-content button {
		align-self: center;   /* centers button on mobile */
	}
	.featured-banner img {
		margin-left: 0;
		margin-top: 15px;
	}
}




/* Responsive */
@media screen and (max-width: 768px) {
	.featured-banner {
		flex-direction: column;
		text-align: center;
		padding: 20px;
		width: 90%; /* almost full width on mobile */
	}
	.featured-banner img {
		margin-left: 0;
		margin-top: 15px;
		width: 180px;
		height: 180px;
	}
}


/* Responsive */
@media screen and (max-width: 768px) {
	.featured-banner {
		flex-direction: column;
		text-align: center;
	}
	.banner-image {
		margin-left: 0;
		margin-top: 15px;
	}
}

.no-menu {
	text-align: center;
	padding: 50px 20px;
	background-color: #1e1e1e;
	border-radius: 16px;
	box-shadow: 0 6px 20px rgba(0, 0, 0, 0.3);
	margin: 30px 0;
	transition: transform 0.3s ease, background 0.3s ease;
}

.no-menu:hover {
	transform: scale(1.02);
	background-color: #292929;
}

.no-menu p {
	font-size: 18px;
	color: #ccc;
	margin: 10px 0;
}

.no-menu p:first-child {
	font-weight: 600;
	color: var(--primary-color);
	font-size: 20px;
}
</style>
</head>
<body>
	<div class="header">
		<div class="header-content">
			<!-- Logo -->
			<div class="logo">
				<i class="fas fa-utensils"></i> Tastify
			</div>

			<!-- Cart Info -->
			<div class="cart-info">
				<div class="cart-icon">
					🛒 <span class="cart-count">0</span>

					<!-- Dropdown items -->
					<div class="cart-dropdown">
						<p>No items in cart</p>
					</div>
				</div>
				<div class="cart-total">₹0.00</div>
			</div>
		</div>
	</div>
	

	<h1 class="page-title">🍽 DELICIOUS MENU</h1>
	<p class="subtitle">Discover a variety of mouth-watering dishes
		made from the freshest ingredients. Fresh, fast, and delivered
		straight to your doorstep!</p>



	<div class="featured-banner">
		<div class="banner-content">
			<h3>🔥 Today's Special</h3>
			<p>
				Indulge in our chef’s masterpiece of the day! Freshly prepared,
				bursting with flavor, and yours at <strong>20% off</strong>. Order
				now before it’s gone!
			</p>
			<button>Order Now</button>
			<button class="back-btn" onclick="window.location.href='GetAllRestaurants'"><i class="fas fa-arrow-left"></i> Back to All Restaurants</button>
		</div>
		<img src="images/Offer.jpg" alt="Today's Special">
	</div>
	<div class="menu-container">
		<!-- Featured Banner / Today's Special -->

		<%
		List<Menu> menus = (List<Menu>) request.getAttribute("menus");

		if (menus != null && !menus.isEmpty()) {
			for (Menu menu : menus) {
		%>
		<div class="menu-item">
			<div class="menu-image-container">
				<img src="<%=menu.getImagePath()%>" alt="Dish Image"
					class="menu-image">
			</div>
			<div class="menu-content">
				<div class="menu-title"><%=menu.getItemName()%></div>
				<div class="menu-description"><%=menu.getDescription()%></div>
				<div class="menu-meta">
					<div class="rating">
						⭐
						<%=menu.getRating()%></div>
					<div class="delivery-time">⏱ 20 min</div>
					<div class="price">
						₹
						<%=menu.getPrice()%></div>
				</div>
				<div class="menu-actions">
					<form action="CartServlet" method="post" style="margin: 0;">
						<input type="hidden" name="itemId" value="<%=menu.getMenuId()%>">
						<input type="hidden" name="quantity" value="1"> <input
							type="hidden" name="restaurantId"
							value="<%=menu.getRestaurantId()%>"> <input
							type="hidden" name="action" value="add"><br>
						<button class="add-to-cart">Add to Cart</button>
					</form>
				</div>
			</div>
		</div>
		<%
		}
		} else {
		%>
		<div class="no-menu">
			<p>😔 No menu items available at the moment.</p>
			<p>Please check back later or explore our other restaurants!</p>
		</div>
		<%
		}
		%>
	</div>
</body>
</html>