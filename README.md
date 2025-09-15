# Tastify - Dynamic Food Delivery Web Application

**Description:**  
Tastify is a **dynamic web-based food delivery application** built using **HTML, CSS, JavaScript, Java, JSP, Servlet, and MySQL**. It allows users to browse restaurants, view menus, place orders, and track deliveries in real-time. Admins can manage restaurants, menus, and orders. The system features **role-based access**, **responsive UI**, and seamless database integration.

---------------------------------------------------------------------------------------------------------------------------------

## Technologies Used
- **Frontend:** HTML5, CSS3, JavaScript, Bootstrap, JSP
- **Backend:** Java, Servlet, JDBC
- **Database:** MySQL
- **Server:** Apache Tomcat
- **Tools/IDE:** Eclipse, IntelliJ IDEA, NetBeans
- **Others:** Git, GitHub

---------------------------------------------------------------------------------------------------------------------------------
## Key Features
- **User Module:**
  - Registration/Login with validation
  - Browse restaurants and their menus
  - Add items to cart
  - Place orders and choose payment method (Cash, Card, UPI)
  - View order history
  - Real-time order confirmation notifications

- **Admin Module (Restaurant/Admin):**
  - Add/Edit/Delete restaurants and menu items
  - View and manage all orders
  - Role-based access control
    
- **Dynamic Pages:**
  - **Home.jsp:** Shows list of restaurants
  - **Menu.jsp:** Displays items dynamically from DB
  - **Cart.jsp:** Shows selected items with total price
  - **Checkout.jsp:** Collects user payment method
  - **OrderConfirmation.jsp:** Displays order summary and plays sound
  - **AdminPanel.jsp:** For admin to manage restaurants and orders

----------------------------------------------------------------------------------------------------------------------------------

## Project Structure

Tastify/
├─ src/ # Java classes
│ ├─ com/tap/models/ # Java model classes (User, Orders, Menu, CartItem)
│ ├─ com/tap/dao/ # DAO interfaces
│ └─ com/tap/DAOImpl/ # DAO implementations for DB operations
│
├─ WebContent/ # JSP pages, HTML, CSS, JS, Images
│ ├─ index.jsp # Home page
│ ├─ login.jsp
│ ├─ register.jsp
│ ├─ menu.jsp
│ ├─ cart.jsp
│ ├─ checkout.jsp
│ ├─ orderConfirmation.jsp
│ ├─ adminPanel.jsp
│ ├─ css/
│ │ └─ style.css
│ ├─ js/
│ │ └─ script.js
│ └─ images/
│ └─ restaurant, food images
│
├─ lib/ # External JARs
│ └─ mysql-connector-java.jar
│
├─ database/ # SQL scripts
│ └─ schema.sql
│
├─ .gitignore # Git ignore file
└─ README.md


----------------------------------------------------------------------------------------------------------------------------------------



---

## Database Structure
**Key Tables:**
1. **User:** Stores user info (Customer, Admin)
2. **Restaurant:** Stores restaurant info
3. **Menu:** Stores menu items linked to restaurants
4. **Orders:** Stores order details linked to users
5. **OrderItem:** Stores items in each order
6. **Cart:** Temporary items before order placement

**Relationships:**
- `User (1) → Orders (many)`   
- `Orders (1) → OrderItem (many)`
- `Restaurant (1) → Menu (many)`

---

## Setup Instructions
1. **Clone Repository:**
   ```bash
   git clone https://github.com/himanshupatil14/Tastify.git

2. **Import Project:**
Open in Eclipse/IntelliJ/NetBeans as a Dynamic Web Project

3. **Database Setup:**
Create MySQL database tastify
Import database/schema.sql
Update DB credentials in config.properties

4.**Add Libraries:**
Add mysql-connector-java.jar from lib/

5.**Run Project:**
Deploy to Apache Tomcat
Open browser: http://localhost:8080/Tastify
