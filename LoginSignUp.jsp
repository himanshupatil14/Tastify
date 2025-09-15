<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login / SignUp - Tastify</title>
<link rel="icon" href="images/titlelogo.png" type="image/png">

<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
    :root {
        --primary-color: #ff6b35;
        --accent-color: #ffa347;
        --card-bg: #1e1e1e;
        --text-primary: #ffffff;
    }

    body {
        margin: 0;
        font-family: 'Poppins', sans-serif;
        background: linear-gradient(135deg, #1a1a1a, #2c2c2c);
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        overflow: hidden;
        color: var(--text-primary);
    }

    /* Floating Background Animation */
    .bg-animation {
        position: absolute;
        top: 0; left: 0;
        width: 100%; height: 100%;
        overflow: hidden;
        z-index: -1;
    }
    .food-item {
        position: absolute;
        font-size: 26px;
        color: rgba(255, 255, 255, 0.15);
        animation: float 14s linear infinite;
    }
    @keyframes float {
        0% { transform: translateY(-100px) rotate(0); opacity: 1; }
        100% { transform: translateY(110vh) rotate(360deg); opacity: 0; }
    }

    /* Auth Card */
    .auth-wrapper {
        background: var(--card-bg);
        padding: 40px 35px;
        border-radius: 18px;
        box-shadow: 0 10px 35px rgba(0,0,0,0.5);
        width: 380px;
        text-align: center;
        animation: popUp 0.6s ease;
    }
    @keyframes popUp {
        0% { transform: scale(0.9); opacity: 0; }
        100% { transform: scale(1); opacity: 1; }
    }

    .logo {
        font-size: 32px;
        color: var(--primary-color);
        display: flex;
        justify-content: center;
        align-items: center;
        margin-bottom: 10px;
    }
    .logo-text {
        margin-left: 10px;
        font-weight: bold;
        font-size: 26px;
        color: var(--text-primary);
    }

    h2 {
        margin: 15px 0 25px;
        color: var(--accent-color);
        font-weight: 600;
    }

    .error-msg {
        background: #3a1e1e;
        color: #ff6b6b;
        padding: 10px;
        border-radius: 8px;
        margin-bottom: 15px;
        font-size: 14px;
        animation: shake 0.3s ease;
    }
    @keyframes shake {
        0%, 100% { transform: translateX(0); }
        25% { transform: translateX(-5px); }
        75% { transform: translateX(5px); }
    }

    .form-group {
        text-align: left;
        margin-bottom: 18px;
    }
    label {
        font-weight: 600;
        font-size: 14px;
        color: var(--accent-color);
    }
    input, textarea, select {
        width: 100%;
        padding: 10px;
        margin-top: 6px;
        border-radius: 8px;
        border: 1px solid #444;
        font-size: 14px;
        background: #2a2a2a;
        color: var(--text-primary);
        transition: all 0.3s;
    }
    input:focus, textarea:focus, select:focus {
        border-color: var(--primary-color);
        box-shadow: 0 0 8px rgba(255,107,53,0.6);
        outline: none;
    }

    .submit-btn {
        width: 100%;
        padding: 12px;
        background: var(--primary-color);
        color: #fff;
        border: none;
        border-radius: 10px;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
        transition: all 0.3s;
    }
    .submit-btn:hover {
        background: var(--accent-color);
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(255,163,71,0.5);
    }

    .switch-link {
        margin-top: 18px;
        font-size: 14px;
        color: var(--text-primary);
    }
    .switch-link button {
        background: none;
        border: none;
        color: var(--primary-color);
        font-weight: bold;
        cursor: pointer;
        transition: 0.3s;
    }
    .switch-link button:hover {
        color: var(--accent-color);
    }

    .hidden { display: none; }
</style>
</head>
<body>

    <!-- Floating Food Icons -->
    <div class="bg-animation">
        <div class="food-item" style="left:12%"><i class="fas fa-pizza-slice"></i></div>
        <div class="food-item" style="left:28%"><i class="fas fa-hamburger"></i></div>
        <div class="food-item" style="left:45%"><i class="fas fa-ice-cream"></i></div>
        <div class="food-item" style="left:62%"><i class="fas fa-coffee"></i></div>
        <div class="food-item" style="left:78%"><i class="fas fa-cookie-bite"></i></div>
        <div class="food-item" style="left:90%"><i class="fas fa-drumstick-bite"></i></div>
    </div>

    <div class="auth-wrapper">
        <div class="logo">
            <i class="fas fa-utensils"></i>
            <div class="logo-text">Tastify</div>
        </div>
        <h2 id="form-title">Welcome Back</h2>

        <% if(request.getAttribute("errorMessage") != null){ %>
            <div class="error-msg"><%= request.getAttribute("errorMessage") %></div>
        <% } %>

        <!-- Login Form -->
        <form id="login-form" action="auth" method="post">
            <input type="hidden" name="action" value="login">
            <div class="form-group">
                <label>Username or Email</label>
                <input type="text" name="username" required maxlength="30" placeholder="Enter Username or Email">
            </div>
            <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" required maxlength="32" placeholder="Enter Password">
            </div>
            <input type="submit" value="Login" class="submit-btn">
        </form>

        <!-- Signup Form -->
        <form id="signup-form" class="hidden" action="auth" method="post">
            <input type="hidden" name="action" value="signup">
            <div class="form-group">
                <label>Username</label>
                <input type="text" name="username" required maxlength="40" placeholder="Choose a username">
            </div>
            <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" required maxlength="32" placeholder="Create a password">
            </div>
            <div class="form-group">
                <label>Email</label>
                <input type="email" name="email" required maxlength="80" placeholder="Enter your email">
            </div>
            <div class="form-group">
                <label>Phone</label>
                <input type="tel" name="phone" required maxlength="16" placeholder="Enter your phone number">
            </div>
            <div class="form-group">
                <label>Address</label>
                <textarea name="address" required maxlength="250" rows="1" placeholder="Enter your address"></textarea>
            </div>
            <div class="form-group">
                <label>Role</label>
                <select name="role" required>
                    <option value="" disabled selected>Select Role</option>
                    <option value="customer">Customer</option>
                    <option value="admin">Admin</option>
                </select>
            </div>
            <input type="submit" value="Create Account" class="submit-btn">
        </form>

        <!-- Switch -->
        <div class="switch-link">
            <span id="switchTextLogin">Don’t have an account? 
                <button onclick="showForm('signup')">Sign Up</button>
            </span>
            <span id="switchTextSignup" class="hidden">Already have an account? 
                <button onclick="showForm('login')">Login</button>
            </span>
        </div>
    </div>

<script>
    function showForm(type) {
        const loginForm = document.getElementById("login-form");
        const signupForm = document.getElementById("signup-form");
        const title = document.getElementById("form-title");
        const loginText = document.getElementById("switchTextLogin");
        const signupText = document.getElementById("switchTextSignup");

        if(type === "signup") {
            loginForm.classList.add("hidden");
            signupForm.classList.remove("hidden");
            title.innerText = "Create Account";
            loginText.classList.add("hidden");
            signupText.classList.remove("hidden");
        } else {
            signupForm.classList.add("hidden");
            loginForm.classList.remove("hidden");
            title.innerText = "Welcome Back";
            signupText.classList.add("hidden");
            loginText.classList.remove("hidden");
        }
    }
</script>

</body>
</html>
