<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Store Dashboard | Vedaisa</title>
    <link rel="stylesheet" href="../css/dashboard.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #f6f8f7;
            margin: 0;
            display: flex;
            height: 100vh;
        }
        /* Sidebar */
        .sidebar {
            width: 250px;
            background: #1b5e20;
            color: white;
            display: flex;
            flex-direction: column;
            padding: 20px;
        }
        .sidebar h2 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 24px;
        }
        .sidebar a {
            text-decoration: none;
            color: white;
            padding: 12px 10px;
            margin: 6px 0;
            border-radius: 8px;
            display: flex;
            align-items: center;
            transition: 0.3s;
        }
        .sidebar a:hover, .sidebar a.active {
            background: #2e7d32;
        }
        .sidebar i {
            margin-right: 10px;
        }
        /* Main content */
        .main-content {
            flex: 1;
            padding: 20px 40px;
            overflow-y: auto;
        }
        .topbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .topbar h1 {
            font-size: 28px;
            color: #2e7d32;
        }
        .logout-btn {
            background: #1b5e20;
            color: white;
            border: none;
            padding: 10px 18px;
            border-radius: 6px;
            cursor: pointer;
            font-weight: 600;
            transition: 0.3s;
        }
        .logout-btn:hover {
            background: #2e7d32;
        }
        /* Dashboard cards */
        .cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-top: 30px;
        }
        .card {
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0px 4px 12px rgba(0,0,0,0.1);
            transition: 0.3s;
        }
        .card:hover {
            transform: translateY(-5px);
        }
        .card h3 {
            color: #1b5e20;
            margin: 0;
        }
        .card p {
            color: #555;
            margin-top: 10px;
        }
        /* Table section */
        .table-section {
            margin-top: 40px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            box-shadow: 0px 4px 12px rgba(0,0,0,0.1);
            border-radius: 10px;
            overflow: hidden;
        }
        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #e5e5e5;
        }
        th {
            background: #1b5e20;
            color: white;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
    </style>
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <h2>🌿 Vedaisa</h2>
        <a href="#" class="active"><i class="fas fa-home"></i>Dashboard</a>
        <a href="#"><i class="fas fa-user-circle"></i>Profile</a>
        <a href="products.html"><i class="fas fa-box-open"></i>My Products</a>
        <a href="addproduct.html"><i class="fas fa-plus-square"></i>Add Product</a>
        <a href="updateproduct.html"><i class="fas fa-shopping-cart"></i>Update Product</a>
        <a href="deleteproduct.html"><i class="fas fa-file-alt"></i>Delete Products</a>
        <a href="#"><i class="fas fa-cog"></i>Settings</a>
        <a href="#"><i class="fas fa-sign-out-alt"></i>Logout</a>
    </div>

    <!-- Main content -->
    <div class="main-content">
        <div class="topbar">
            <h1>Welcome, <%= "Store Name" %> 👋</h1>
            <form action="LogoutServlet" method="post">
                <button class="logout-btn">Logout</button>
            </form>
        </div>

        <!-- Dashboard Cards -->
        <div class="cards">
            <div class="card">
                <h3>Active Products</h3>
                <p>25</p>
            </div>
            <div class="card">
                <h3>Pending Orders</h3>
                <p>8</p>
            </div>
            <div class="card">
                <h3>Completed Sales</h3>
                <p>124</p>
            </div>
            <div class="card">
                <h3>Total Revenue</h3>
                <p>₹56,800</p>
            </div>
        </div>

        <!-- Recent Orders Table -->
        <div class="table-section">
            <h2>Recent Orders</h2>
            <table>
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Customer</th>
                        <th>Product</th>
                        <th>Quantity</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>#ORD1021</td>
                        <td>Anusha</td>
                        <td>Organic Rice</td>
                        <td>2 Kg</td>
                        <td><span style="color:#2e7d32;">Delivered</span></td>
                    </tr>
                    <tr>
                        <td>#ORD1020</td>
                        <td>Rajesh</td>
                        <td>Cold Pressed Oil</td>
                        <td>1 L</td>
                        <td><span style="color:#ff9800;">Pending</span></td>
                    </tr>
                    <tr>
                        <td>#ORD1019</td>
                        <td>Priya</td>
                        <td>Organic Tomato</td>
                        <td>5 Kg</td>
                        <td><span style="color:#f44336;">Cancelled</span></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

</body>
</html>