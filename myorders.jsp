<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.tap.models.Orders,com.tap.models.User" %>
<%
    User user = (User) session.getAttribute("user");
    List<Orders> orderList = (List<Orders>) request.getAttribute("orderList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tastify - Orders</title>
<link rel="icon" href="images/titlelogo.png" type="image/png">

<!-- Font Awesome -->
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

<style>
:root {
    --primary-color: #ff6b35;
    --accent-color: #ffa347;
    --card-bg: #1e1e1e;
    --text-primary: #ffffff;
    --text-secondary: #ccc;
}

/* Body & Fonts */
body {
    margin: 0;
    font-family: Arial, sans-serif;
    background-color: #121212;
    color: var(--text-primary);
}

/* Navbar */
.navbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 15px 30px;
    background-color: var(--card-bg);
    box-shadow: 0 2px 12px rgba(0,0,0,0.3);
    position: sticky;
    top: 0;
    z-index: 1000;
}

.navbar .brand {
    font-size: 24px;
    font-weight: 700;
    color: var(--primary-color);
}

.navbar nav a {
    margin-left: 20px;
    color: var(--text-primary);
    text-decoration: none;
    font-weight: 500;
    transition: color 0.3s ease;
}

.navbar nav a:hover {
    color: var(--primary-color);
}

/* Container */
.container {
    max-width: 1200px;
    margin: 20px auto;
    padding: 0 20px;
}

/* Back Button */
.back-btn {
    background-color: var(--card-bg);
    color: var(--text-primary);
    border: none;
    padding: 8px 18px;
    border-radius: 8px;
    cursor: pointer;
    font-weight: 600;
    margin-bottom: 20px;
    transition: all 0.3s ease;
}

.back-btn:hover {
    background-color: var(--primary-color);
    color: #fff;
}

/* Orders Header */
.orders-header h1 {
    margin: 0;
    font-size: 28px;
    color: var(--primary-color);
}

.orders-header p {
    margin: 5px 0 20px 0;
    color: var(--text-secondary);
    font-size: 16px;
}

/* Empty Orders Section */
.no-orders {
    text-align: center;
    padding: 50px 20px;
}

.no-orders i {
    font-size: 50px;
    color: #ffd166;
    margin-bottom: 10px;
}

.no-orders h3 {
    font-size: 22px;
    color: var(--primary-color);
    margin-bottom: 10px;
}

.no-orders p {
    font-size: 16px;
    color: var(--text-secondary);
}

/* Order Card */
.order-card {
    background-color: var(--card-bg);
    border-radius: 12px;
    box-shadow: 0 6px 20px rgba(0,0,0,0.3);
    padding: 20px;
    margin-bottom: 20px;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.order-card:hover {
    transform: translateY(-3px) scale(1.01);
    box-shadow: 0 12px 25px rgba(0,0,0,0.4);
}

.order-top-row {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 10px;
}

.order-status {
    padding: 4px 12px;
    border-radius: 8px;
    font-weight: 600;
    text-transform: capitalize;
    font-size: 14px;
}

.order-status.Pending {
    background-color: #ffb703;
    color: #000;
}

.order-status.Completed {
    background-color: #06d6a0;
    color: #000;
}

.order-status.Cancelled {
    background-color: #ef233c;
    color: #fff;
}

.order-details {
    margin: 6px 0;
    font-size: 15px;
    color: var(--text-secondary);
}

/* Profile Modal */
#profileModal {
    display: none;
    position: fixed;
    top: 20%;
    right: 20px;
    background: var(--card-bg);
    color: var(--text-primary);
    padding: 30px;
    border-radius: 12px;
    z-index: 2000;
    min-width: 320px;
    max-height: 60vh;
    overflow-y: auto;
    box-shadow: 0 4px 20px rgba(0,0,0,0.3);
}

#profileModal h2 {
    margin-top: 0;
    color: var(--primary-color);
}

#profileModal hr {
    border-color: var(--primary-color);
    margin-bottom: 18px;
}

#profileModal p {
    margin: 8px 0;
}

#profileModal .back-btn {
    margin-top: 15px;
    width: 100%;
}

/* Responsive */
@media screen and (max-width: 768px) {
    .navbar {
        flex-direction: column;
        align-items: flex-start;
    }
    .navbar nav {
        margin-top: 10px;
    }
}
</style>
</head>
<body>
    <!-- Navbar -->
    <div class="navbar">
        <div class="brand"><i class="fas fa-utensils"></i> Tastify</div>
        <nav>
            <a href="GetAllRestaurants"><i class="fas fa-store"></i> All Restaurants</a>
            <a href="myorders"><i class="fas fa-box"></i> My Orders</a>
            <a href="#" onclick="document.getElementById('profileModal').style.display='block';"><i class="fas fa-user"></i> Profile</a>
        </nav>
    </div>

    <div class="container">
        <!-- Back Button -->
        <button class="back-btn" onclick="window.location.href='GetAllRestaurants'"><i class="fas fa-arrow-left"></i> Back to All Restaurants</button>

        <!-- Orders Header -->
        <div class="orders-header">
            <h1>My Orders</h1>
            <p>All orders placed using Tastify</p>
        </div>

        <!-- Orders -->
        <%
        if (orderList == null || orderList.isEmpty()) {
        %>
            <div class="no-orders">
                <i class="fas fa-box-open"></i>
                <h3>No orders found yet.</h3>
                <p>Start exploring restaurants and place your first order!</p>
            </div>
        <%
        } else {
            for (Orders order : orderList) {
        %>
            <div class="order-card">
                <div class="order-top-row">
                    <span>Order <%= order.getOrderId() %></span>
                    <span class="order-status <%= order.getStatus() %>"><%= order.getStatus() %></span>
                </div>
                <div class="order-details">Order Date: <%= order.getOrderDate() %></div>
                <div class="order-details">Total Amount: ₹ <strong><%= order.getTotalAmount() %></strong></div>
                <div class="order-details">Payment Mode: <%= order.getPaymentMode() %></div>
                <div class="order-details">Delivery Address: <%= order.getDeliveryAddress() %></div>

            </div>
        <%
            }
        }
        %>
    </div>

    <!-- Profile Modal -->
    <div id="profileModal">
        <h2>My Profile</h2>
        <hr>
        <p><strong>Name:</strong> <%= user != null ? user.getUsername() : "" %></p>
        <p><strong>Phone:</strong> <%= user != null ? user.getPhoneNumber() : "" %></p>
        <p><strong>Email:</strong> <%= user != null ? user.getEmail() : "" %></p>
        <p><strong>Address:</strong> <%= user != null ? user.getAddress() : "" %></p>
        <p><strong>Role:</strong> <%= user != null ? user.getRole() : "" %></p>
        <button onclick="document.getElementById('profileModal').style.display='none'" class="back-btn" style="background: var(--primary-color);">Close</button>
    </div>
</body>
</html>
