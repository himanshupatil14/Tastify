<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Special Offers - Tastify</title>
<link rel="icon" href="images/titlelogo.png" type="image/png">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap"
	rel="stylesheet">
<style>
:root {
	--primary-color: #ff6b35;
	--accent-color: #ffa347;
	--card-bg: #1e1e1e;
	--text-primary: #ffffff;
	--bg-light: #f9f9f9;
}

/* Reset */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}

body {
	background: var(--bg-light);
	color: #333;
}

/* Hero Section */
.hero {
	height: 100vh;
	background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)),
		url('images/SpecialOffer.jpg') no-repeat center/cover;
	display: flex;
	justify-content: center;
	align-items: center;
	text-align: center;
	color: var(--text-primary);
	padding: 20px;
	animation: fadeIn 1.5s ease-in-out;
}

.hero-content {
	max-width: 650px;
	animation: slideUp 1.5s ease-in-out;
}

.hero-content h1 {
	font-size: 3.5rem;
	margin-bottom: 15px;
	text-transform: uppercase;
	letter-spacing: 3px;
	color: var(--primary-color);
	text-shadow: 0 4px 6px rgba(0, 0, 0, 0.5);
}

.hero-content p {
	font-size: 1.3rem;
	margin-bottom: 25px;
	color: #fff;
}

.hero-btn {
	display: inline-block;
	padding: 14px 35px;
	font-size: 1.1rem;
	font-weight: bold;
	background: linear-gradient(45deg, var(--primary-color),
		var(--accent-color));
	color: var(--text-primary);
	border-radius: 50px;
	text-decoration: none;
	transition: all 0.3s ease-in-out;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
}

.hero-btn:hover {
	background: linear-gradient(45deg, var(--accent-color),
		var(--primary-color));
	transform: scale(1.05);
}

/* Offers Section */
.offers {
	padding: 60px 20px;
	text-align: center;
}

.offers h2 {
	font-size: 2.5rem;
	margin-bottom: 25px;
	color: #222;
	position: relative;
	display: inline-block;
}

.offers h2::after {
	content: "";
	width: 60%;
	height: 4px;
	background: linear-gradient(45deg, var(--primary-color),
		var(--accent-color));
	position: absolute;
	bottom: -10px;
	left: 20%;
	border-radius: 2px;
}

/* Offer Cards */
.offer-cards {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
	gap: 25px;
	margin-top: 40px;
}

.card {
	background: var(--card-bg);
	color: var(--text-primary);
	border-radius: 20px;
	padding: 20px;
	box-shadow: 0 6px 18px rgba(0, 0, 0, 0.2);
	transition: transform 0.3s ease, box-shadow 0.3s ease;
	position: relative;
	overflow: hidden;
}

.card img {
    width: 100%;
    max-height: 450px;  /* limits image height */
    object-fit: cover;  /* crops image nicely without stretching */
    border-radius: 15px;
    margin-bottom: 15px;
    transition: transform 0.3s ease;
}

.card:hover img {
    transform: scale(1.05);
}

.card h3 {
	margin-bottom: 12px;
	font-size: 1.6rem;
	color: var(--primary-color);
}

.card p {
	font-size: 1rem;
	color: #ddd;
}

.card:hover {
	transform: translateY(-8px) scale(1.02);
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
}

/* Animations */
@
keyframes fadeIn {from { opacity:0;
	
}

to {
	opacity: 1;
}

}
@
keyframes slideUp {from { transform:translateY(40px);
	opacity: 0;
}

to {
	transform: translateY(0);
	opacity: 1;
}
}
</style>
</head>
<body>

	<!-- Hero Section -->
	<section class="hero">
		<div class="hero-content">
			<h1>Special Offers Today</h1>
			<p>Get up to 50% off on your first order</p>
			<a href="#offers" class="hero-btn">View Offers</a>
			<button class="hero-btn" onclick="window.location.href='GetAllRestaurants'"><i class="fas fa-arrow-left"></i> Back to All Restaurants</button>
		</div>
	</section>

	<!-- Offers Section -->
	<section class="offers" id="offers">
		<h2>🔥 Hot Deals for You</h2>
		<div class="offer-cards">
			<div class="card">
				<img src="images/Offeritem.jpg" alt="Pizza Offer">
				<h3>🍕 Pizza Mania</h3>
				<p>Flat 40% off on all medium pizzas</p>
			</div>
			<div class="card">
				<img src="images/Offeritem1.png" alt="Burger Offer">
				<h3>🍔 Burger Combo</h3>
				<p>Buy 1 Get 1 Free on selected burgers</p>
			</div>
			<div class="card">
				<img src="images/Offeritem2.png" alt="Beverage Offer">
				<h3>🍹 Happy Hour</h3>
				<p>Buy 2 drinks, get 1 free (5PM-7PM)</p>
			</div>
		</div>
	</section>

</body>
</html>
