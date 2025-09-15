<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List, com.tap.models.CartItem" %>
<%@ page import="com.tap.util.Cart" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Your Cart | Tastify</title>
  <link rel="icon" href="images/titlelogo.png" type="image/png">

  <!-- Font Awesome for icons -->
  <link rel="stylesheet" 
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

  <style>
    :root {
      --primary-color: #ff6b35;
      --accent-color: #ffa347;
      --card-bg: #1e1e1e;
      --text-primary: #ffffff;
      --text-secondary: #aaaaaa;
      --bg-dark: #121212;
    }

    body {
      margin: 0;
      font-family: "Segoe UI", sans-serif;
      background: var(--bg-dark);
      color: var(--text-primary);
    }

    /* Header */
    .header {
      background: var(--card-bg);
      padding: 15px 25px;
      display: flex;
      align-items: center;
      justify-content: center;
      border-bottom: 2px solid var(--primary-color);
    }
    .header .logo {
      font-size: 1.5rem;
      font-weight: bold;
      color: var(--primary-color);
    }
    .header .logo i {
      margin-right: 8px;
    }

    /* Cart Container */
    .cart-container {
      max-width: 1200px;
      margin: 30px auto;
      padding: 20px;
    }

    .cart-header {
      text-align: center;
      margin-bottom: 30px;
    }
    .cart-header h1 {
      color: var(--primary-color);
      margin-bottom: 5px;
    }
    .cart-subtitle {
      color: var(--text-secondary);
      font-size: 0.95rem;
    }

    /* Empty cart */
    .empty-cart {
      text-align: center;
      padding: 40px;
      background: var(--card-bg);
      border-radius: 12px;
    }
    .empty-cart i {
      font-size: 3rem;
      color: var(--primary-color);
      margin-bottom: 10px;
    }
    .empty-cart p {
      margin: 6px 0;
    }

    /* Cart Main Layout */
    .cart-main {
      display: grid;
      grid-template-columns: 2fr 1fr;
      gap: 20px;
    }

    /* Cart list */
    .cart-list {
      background: var(--card-bg);
      padding: 15px;
      border-radius: 12px;
    }
    .cart-item {
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 12px;
      border-bottom: 1px solid #333;
    }
    .cart-item:last-child {
      border-bottom: none;
    }

    .item-info .item-title {
      font-weight: bold;
      font-size: 1.1rem;
    }
    .item-meta {
      color: var(--text-secondary);
      font-size: 0.9rem;
    }

    .qty-control-group {
      display: flex;
      align-items: center;
      gap: 8px;
    }
    .qty-btn {
      background: var(--primary-color);
      border: none;
      color: #fff;
      font-size: 1.1rem;
      width: 28px;
      height: 28px;
      border-radius: 50%;
      cursor: pointer;
      transition: 0.2s;
    }
    .qty-btn:hover:not(:disabled) {
      background: var(--accent-color);
      transform: scale(1.1);
    }
    .qty-btn:disabled {
      opacity: 0.5;
      cursor: not-allowed;
    }
    .qty-label {
      min-width: 20px;
      text-align: center;
    }

    .item-subtotal {
      font-weight: bold;
      color: var(--accent-color);
      margin-left: 15px;
    }

    .remove-btn {
      background: transparent;
      border: 1px solid var(--primary-color);
      padding: 4px 8px;
      color: var(--primary-color);
      border-radius: 6px;
      cursor: pointer;
      font-size: 0.85rem;
      transition: 0.3s;
    }
    .remove-btn:hover {
      background: var(--primary-color);
      color: #fff;
    }

    /* Summary panel */
    .summary-panel {
      background: var(--card-bg);
      padding: 20px;
      border-radius: 12px;
    }
    .summary-title {
      font-size: 1.2rem;
      font-weight: bold;
      margin-bottom: 15px;
      display: flex;
      align-items: center;
      gap: 8px;
      color: var(--primary-color);
    }
    .summary-items {
      margin-bottom: 15px;
    }
    .summary-item {
      display: flex;
      justify-content: space-between;
      margin-bottom: 8px;
    }
    .summary-item-name {
      font-weight: bold;
    }
    .summary-divider {
      border-top: 1px solid #333;
      margin: 12px 0;
    }
    .total-label {
      font-size: 1rem;
      color: var(--text-secondary);
    }
    .total-price {
      font-size: 1.4rem;
      font-weight: bold;
      color: var(--accent-color);
      margin-bottom: 15px;
    }

    /* Buttons */
    .action-btn {
      display: block;
      width: 100%;
      padding: 10px;
      margin-top: 10px;
      background: var(--primary-color);
      border: none;
      border-radius: 8px;
      color: #fff;
      font-size: 1rem;
      font-weight: bold;
      cursor: pointer;
      transition: 0.3s;
    }
    .action-btn:hover {
      background: var(--accent-color);
    }

    /* Footer */
    .footer {
      background: var(--card-bg);
      padding: 20px;
      text-align: center;
      color: var(--text-secondary);
      margin-top: 40px;
    }
    .footer a {
      color: var(--primary-color);
      text-decoration: none;
    }
    .footer a:hover {
      text-decoration: underline;
    }
  </style>
</head>

<body>
	<div class="header">
    <div class="header-content">
      <div class="logo">
        <i class="fas fa-utensils"></i>
        Tastify
      </div>
    </div>
  </div>
    <!-- Main Content -->
  <div class="cart-container">
    <div class="cart-header">
      <h1>Your Cart</h1>
      <p class="cart-subtitle">Review your selected items before proceeding to checkout</p>
    </div>
    
    <%
      Cart cart = (Cart) session.getAttribute("cart");
      List<CartItem> items = (cart != null) ? cart.getCartItems() : null;
      if (items == null || items.isEmpty()) {
    %>
      <div class="empty-cart">
        <i class="fas fa-shopping-cart"></i>
        <p>Your cart is empty.</p>
        <p>Looks like you haven't added any delicious items yet!</p>
        <a href="GetAllRestaurants"><button class="action-btn">Browse Restaurants</button></a>
      </div>
    <%
      } else {
    %>
      <div class="cart-main">
        <!-- Left: Items list -->
        <div class="cart-list">
          <% for (CartItem item : items) { %>
            <div class="cart-item">
              <div class="item-info">
                <div class="item-title"><%= item.getName() %></div>
                <div class="item-meta">Price: ₹<%= String.format("%.2f", item.getPrice()) %></div>
              </div>
              <div class="qty-control-group">
                <form action="CartServlet" method="post" style="margin:0;">
                  <input type="hidden" name="itemId" value="<%= item.getId() %>">
                  <input type="hidden" name="action" value="update">
                  <input type="hidden" name="quantity" value="<%= item.getQuantity() - 1 %>">
                  <button class="qty-btn" type="submit" <% if (item.getQuantity() <= 1) { %>disabled<% } %>>−</button>
                </form>
                <span class="qty-label"><%= item.getQuantity() %></span>
                <form action="CartServlet" method="post" style="margin:0;">
                  <input type="hidden" name="itemId" value="<%= item.getId() %>">
                  <input type="hidden" name="action" value="update">
                  <input type="hidden" name="quantity" value="<%= item.getQuantity() + 1 %>">
                  <button class="qty-btn" type="submit">+</button>
                </form>
              </div>
              <div class="item-subtotal">
                ₹<%= String.format("%.2f", item.getPrice() * item.getQuantity()) %>
              </div>
              <form action="CartServlet" method="post" style="margin-left:10px;">
                <input type="hidden" name="itemId" value="<%= item.getId() %>">
                <input type="hidden" name="action" value="remove">
                <button class="remove-btn" type="submit">Remove</button>
              </form>
            </div>
          <% } %>
        </div>
<!-- Right: Order Summary -->
        <div class="summary-panel">
          <div class="summary-title">
            <i class="fas fa-receipt"></i>
            Order Summary
          </div>
          <div class="summary-items">
            <% for (CartItem item : items) { %>
              <div class="summary-item">
                <div class="summary-item-info">
                  <div class="summary-item-name"><%= item.getName() %></div>
                  <div class="summary-item-qty"><%= item.getQuantity() %> x ₹<%= String.format("%.2f", item.getPrice()) %></div>
                </div>
                <div class="summary-item-price">₹<%= String.format("%.2f", item.getPrice() * item.getQuantity()) %></div>
              </div>
            <% } %>
          </div>
          <div class="summary-divider"></div>
          <div class="total-label">Total Amount</div>
          <div class="total-price">₹<%= String.format("%.2f", cart.getTotalPrice()) %></div>
          <a href="menu?restaurantId=<%=session.getAttribute("restaurantId") %>">
            <button class="action-btn">Add More Items</button>
          </a>
          <form action="Checkout.jsp" method="post" style="margin-bottom:0;">
            <button type="submit" class="action-btn" style="margin-top:8px;">Proceed to Checkout</button>
          </form>
        </div>
      </div>
    <%
      }
    %>
  </div>
  
  <!-- Footer -->
  <div class="footer">
    <p>Need help? Contact our support at <a href="tel:+919876543210">+91 98765 43210</a></p>
    <p>© 2023 FoodExpress. All rights reserved.</p>
  </div>
</body>
</html>