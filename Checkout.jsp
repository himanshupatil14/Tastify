<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.tap.models.User"%>
<% User user = (User) session.getAttribute("user"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkout - Tastify Food Delivery</title>
<link rel="icon" href="images/titlelogo.png" type="image/png">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
:root {
	--primary-color: #ff6b35;
	--accent-color: #ffa347;
	--card-bg: #1e1e1e;
	--text-primary: #ffffff;
}

body {
	font-family: 'Poppins', Arial, sans-serif;
	margin: 0;
	padding: 0;
	background: #121212; /* dark background for contrast */
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	color: var(--text-primary);
}

.checkout-wrapper {
	display: flex;
	flex-wrap: wrap;
	max-width: 1000px;
	width: 95%;
	background: var(--card-bg);
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.4);
	border-radius: 15px;
	overflow: hidden;
}

.image-section {
	flex: 1;
	min-width: 400px;
	background:
		url('images/CheckOuta.jpg')
		no-repeat center center/cover;
	background-color: #2c2c2c;
}

.form-section {
	flex: 1;
	padding: 35px;
}

h2 {
	text-align: center;
	color: var(--primary-color);
	margin-bottom: 25px;
	font-size: 26px;
}

h3 {
	color: var(--accent-color);
	margin-bottom: 12px;
	font-size: 20px;
}

p {
	font-size: 14px;
	margin: 5px 0;
	color: var(--text-primary);
}

.italic-note {
	font-style: italic;
	font-size: 13px;
	color: #aaa;
	margin-bottom: 20px;
}

form {
	display: flex;
	flex-direction: column;
}

label {
	margin-top: 12px;
	font-weight: 600;
	color: var(--accent-color);
}

textarea, select, input[type="text"], input[type="submit"] {
	margin-top: 6px;
	padding: 10px;
	border-radius: 8px;
	border: 1px solid #444;
	font-size: 14px;
	background: #2a2a2a;
	color: var(--text-primary);
}

textarea {
	resize: none;
	height: 80px;
}

select option {
	background: #2a2a2a;
	color: var(--text-primary);
}

input[type="submit"] {
	background: var(--primary-color);
	color: #fff;
	border: none;
	cursor: pointer;
	margin-top: 20px;
	font-size: 16px;
	font-weight: bold;
	transition: background 0.3s ease, transform 0.2s ease;
	box-shadow: 0 3px 10px rgba(0, 0, 0, 0.3);
}

input[type="submit"]:hover {
	background: var(--accent-color);
	transform: translateY(-2px);
}

@media ( max-width : 768px) {
	.checkout-wrapper {
		flex-direction: column;
	}
	.image-section {
		height: 220px;
	}
}
</style>
</head>
<body>
	<div class="checkout-wrapper">
		<div class="image-section" role="img"
			aria-label="Checkout payment illustration"></div>

		<div class="form-section">
			<h2>Checkout</h2>
			<div class="user-info" aria-label="User Information">
				<h3>Your Details</h3>
				<p>
					<strong>Name:</strong>
					<%= user != null ? user.getUsername() : "Guest" %></p>
				<p>
					<strong>Email:</strong>
					<%= user != null ? user.getEmail() : "Not provided" %></p>
				<p>
					<strong>Phone:</strong>
					<%= user != null ? user.getPhoneNumber() : "Not provided" %></p>
				<p class="italic-note">These details are from your profile and
					cannot be changed here...</p>

				<form action="CheckoutServlet" method="post">
					<label for="address">Delivery Address:</label>
					<textarea id="address" name="address" maxlength="250"
						placeholder="Enter your full delivery address..." required></textarea>

					<label for="paymentMethod">Payment Method:</label> <select
						name="paymentMethod" id="paymentMethod" required>
						<option value="" disabled selected>Select payment method</option>
						<option value="Cash">Cash</option>
						<option value="Card">Card</option>
						<option value="UPI">UPI</option>
					</select> <input type="submit" value="Place Order"
						aria-label="Place your order">
				</form>
			</div>
		</div>
	</div>
</body>
</html>
