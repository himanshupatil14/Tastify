<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Success - Tastify</title>
<link rel="icon" href="images/titlelogo.png" type="image/png">
<link rel="icon" href="images/logo5.png" type="image/png">

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
    height: 100vh;
    background: linear-gradient(135deg, #121212, #1e1e1e);
    display: flex;
    justify-content: center;
    align-items: center;
    color: var(--text-primary);
}

.container {
    background: var(--card-bg);
    text-align: center;
    padding: 40px 60px;
    border-radius: 20px;
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.6);
    animation: fadeIn 0.8s ease-in-out;
    max-width: 500px;
    width: 90%;
}

.checkmark {
    font-size: 70px;
    color: var(--primary-color);
    margin-bottom: 20px;
    animation: pop 0.6s ease-out;
}

h1 {
    font-size: 32px;
    margin-bottom: 10px;
    color: var(--accent-color);
}

h3 {
    font-size: 20px;
    margin-bottom: 15px;
    color: #ddd;
}

p {
    font-size: 15px;
    margin-bottom: 25px;
    color: #bbb;
}

.payment-icons {
    justify-content: center;
    gap: 20px;
    margin: 20px 0;
}

.payment-icons img {
    width: 50px;
    height: 50px;
}

.btn {
    display: inline-block;
    background: var(--primary-color);
    color: #fff;
    padding: 12px 25px;
    font-size: 16px;
    border-radius: 30px;
    text-decoration: none;
    font-weight: bold;
    transition: background 0.3s ease, transform 0.2s ease;
    box-shadow: 0 4px 15px rgba(255, 107, 53, 0.5);
}

.btn:hover {
    background: var(--accent-color);
    transform: translateY(-3px);
}

@keyframes fadeIn {
    from { opacity: 0; transform: translateY(20px); }
    to { opacity: 1; transform: translateY(0); }
}

@keyframes pop {
    0% { transform: scale(0.5); opacity: 0; }
    100% { transform: scale(1); opacity: 1; }
}
</style>
</head>
<body>
    <div class="container">
        <div class="checkmark">✔</div>
        <h1>Order Placed!</h1>
        <h3>Thank you for your order 🎉</h3>
        <p>Your delicious food will be delivered soon 🍕🍔.</p>

        <div class="payment-icons">
            <img src="images/pm.png" alt="Paytm">
            <img src="images/pp.png" alt="PhonePe">
            <img src="images/gp.png" alt="Google Pay">
            <img src="images/cd.png" alt="Card">
        </div>

        <a href="GetAllRestaurants" id="homeBtn" class="btn">Back to Home</a>
    </div>

    <!-- Success Sound -->
    <audio id="orderAudio" autoplay>
        <source src="audio/orderPlace.mp3" type="audio/mpeg">
    </audio>

    <script>
        // Make sure audio plays after page load
        window.addEventListener("load", () => {
            const audio = document.getElementById("orderAudio");
            audio.play().catch(err => {
                console.log("Autoplay blocked by browser, playing manually...", err);
            });
        });
    </script>
</body>
</html>
