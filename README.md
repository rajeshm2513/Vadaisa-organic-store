🌿 Vadaisa – Full-Stack Organic E-Commerce Platform

Vadaisa is a complete end-to-end organic e-commerce web application developed using Java-based web technologies. It provides a seamless online shopping experience for customers along with a powerful admin panel for managing products, stores, and categories.

The platform includes everything from landing page to checkout, integrating both client-side and server-side technologies to deliver a production-style e-commerce system.

## 🚀 Key Features

### 🛍️ User Side
- Landing page and home page
- Browse organic products
- Add to cart and remove from cart
- Real-time cart total calculation
- Secure checkout flow
- UPI QR-based digital payment
- Order confirmation page

### 🛠️ Admin Panel
- Secure admin login
- Product CRUD (Add, Update, Delete)
- Store and category management
- Inventory and image management

---

## 💳 Payment System
- Checkout page transfers total amount to server
- QR code generated dynamically using Java Servlets and JSP
- Supports Google Pay, PhonePe, Paytm and all UPI apps
- Payment success page for order confirmation

---

## 🛠️ Technologies Used

### Frontend
- HTML5  
- CSS3  
- Bootstrap 5  
- JavaScript  

### Backend
- Java Servlets  
- JSP (Java Server Pages)  
- JDBC (for database connectivity, if used)

### Storage & APIs
- LocalStorage  
- UPI QR Code API  

---

## 🔁 Application Flow

1. User opens the landing page  
2. Browses organic products  
3. Adds products to cart  
4. Cart calculates total amount  
5. Checkout page sends amount to server  
6. Servlet generates QR code  
7. User completes payment via UPI  
8. Order confirmation is displayed  

---

## 📁 Project Structure

vadasi-organic-store
│
├── landing.html
├── home.html
├── products.html
├── amount.html
├── generateQR.jsp
├── success.html
├── addproduct.html
├── updateproduct.html
├── deleteproduct.html
├── servlets/
│ ├── ProductServlet.java
│ ├── CartServlet.java
│ └── PaymentServlet.java
└── README.md


---

## 🎯 Purpose of the Project

This project demonstrates real-world full-stack Java web development including:
- E-commerce workflows
- CRUD operations using Servlets
- Admin panel management
- Cart and checkout system
- Digital payments with UPI QR
- Responsive and modern UI

It can be used as a final-year project, portfolio project, or base for building a commercial organic e-commerce platform.

---

$$ 👩‍💻 Developed By  
Mudavath Rajesh Naik
Github:
