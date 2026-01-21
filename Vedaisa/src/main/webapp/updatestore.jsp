<%@ page import="java.sql.*, javax.naming.*, javax.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Update Store | Dashboard</title>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>
* { margin: 0; padding: 0; box-sizing: border-box; }

body {
    font-family: 'Inter', sans-serif;
    background: #f5f7f4;
    display: flex;
    height: 100vh;
}

/* SIDEBAR */
.sidebar {
    width: 240px;
    background: #1e5631;
    color: white;
    padding: 20px;
    display: flex;
    flex-direction: column;
    align-items: center;
}
.sidebar img {
    width: 160px;
    margin-bottom: 25px;
}
.sidebar h2 {
    font-size: 22px;
    font-weight: 700;
    margin-bottom: 25px;
}
.sidebar a {
    color: white;
    width: 100%;
    padding: 14px 10px;
    text-decoration: none;
    border-radius: 6px;
    display: block;
    margin-bottom: 12px;
    font-size: 15px;
    font-weight: 500;
}
.sidebar a:hover {
    background: #2e7d47;
}

/* Highlight current page */
.active {
    background: #2e7d47;
}

/* MAIN */
.main-container {
    flex: 1;
    padding: 25px 40px;
}

h2 {
    font-size: 28px;
    color: #1e5631;
    font-weight: 700;
    margin-bottom: 20px;
}

/* Form container */
.container {
    width: 500px;
    background: white;
    padding: 25px;
    border-radius: 12px;
    box-shadow: 0 4px 20px rgba(0,0,0,0.08);
}

label {
    font-weight: 600;
    color: #1e5631;
}
input {
    width: 100%;
    padding: 10px;
    border-radius: 7px;
    border: 1px solid #ccc;
    margin-top: 8px;
}

button {
    width: 100%;
    padding: 10px;
    margin-top: 12px;
    border-radius: 7px;
    font-weight: 600;
    border: none;
    cursor: pointer;
}

.search-btn {
    background: #1e5631;
    color: white;
}
.search-btn:hover {
    background: #2e7d47;
}

.update-btn {
    background: #0B63CE;
    color: white;
}
.update-btn:hover {
    background: #0E75F0;
}

.store-preview {
    margin-top: 15px;
}

.store-preview p {
    margin: 6px 0;
    color: #1e5631;
    font-size: 15px;
}

.store-preview img {
    width: 100%;
    border-radius: 10px;
    margin-top: 10px;
}
</style>

</head>
<body>

<!-- SIDEBAR -->
<aside class="sidebar">
    <img src="https://res.cloudinary.com/dpxrmf3vc/image/upload/v1761909191/Screenshot__71__copy-removebg-preview_1_ufupio.png" alt="Logo">
    <h2>Store Admin</h2>

    <a href="storeregister.jsp">New Store</a>
    <a href="updatestore.jsp" class="active">Update Store</a>
    <a href="deletestore.jsp">Delete Store</a>
    <a href="viewallstore.jsp">View All Stores</a>
</aside>

<!-- MAIN CONTENT -->
<div class="main-container">

    <h2>Update Store</h2>

    <div class="container">

        <!-- Search Store -->
        <form method="post">
            <label>Enter Store Name</label>
            <input type="text" name="search_store"
                   placeholder="Ex: Green Fresh Mart"
                   value="<%= request.getParameter("search_store") != null ? request.getParameter("search_store") : "" %>"
                   required>
            <button type="submit" class="search-btn">Search</button>
        </form>

        <%
        String storeName = request.getParameter("search_store");

        if (storeName != null) {
            try {
                Context ctx = new InitialContext();
                DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/OracleDB");
                Connection con = ds.getConnection();

                PreparedStatement ps = con.prepareStatement(
                    "SELECT STORE_ID, FULL_NAME, STORE_NAME, EMAIL, PHONE, CITY, ADDRESS, IMAGE_URL FROM store_registration WHERE STORE_NAME=?"
                );
                ps.setString(1, storeName);
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
        %>

        <!-- SHOW STORE DATA -->
        <div class="store-preview">
            <form id="updateForm" action="UpdateStore" method="post">

                <input type="hidden" name="store_id" value="<%= rs.getInt("STORE_ID") %>">

                <p><b>Full Name:</b></p>
                <input type="text" name="fullname" value="<%= rs.getString("FULL_NAME") %>" required>

                <p><b>Store Name:</b></p>
                <input type="text" name="storename" value="<%= rs.getString("STORE_NAME") %>" required>

                <p><b>Email:</b></p>
                <input type="email" name="email" value="<%= rs.getString("EMAIL") %>" required>

                <p><b>Phone:</b></p>
                <input type="text" name="phone" value="<%= rs.getString("PHONE") %>" required>

                <p><b>City:</b></p>
                <input type="text" name="city" value="<%= rs.getString("CITY") %>">

                <p><b>Address:</b></p>
                <input type="text" name="address" value="<%= rs.getString("ADDRESS") %>">

                <p><b>Image URL (optional):</b></p>
                <input type="text" name="image" value="<%= rs.getString("IMAGE_URL") %>">

                <% if (rs.getString("IMAGE_URL") != null) { %>
                    <img src="<%= rs.getString("IMAGE_URL") %>" alt="Store Image">
                <% } %>

                <button type="submit" class="update-btn">Update Store</button>
            </form>
        </div>

        <script>
        document.getElementById("updateForm").addEventListener("submit", function(e){
            e.preventDefault();
            Swal.fire({
                title: "Confirm Update",
                text: "Are you sure you want to update this store?",
                icon: "question",
                showCancelButton: true,
                confirmButtonColor: "#0B63CE",
                cancelButtonColor: "#d33",
                confirmButtonText: "Yes, Update"
            }).then((result) => {
                if (result.isConfirmed) {
                    e.target.submit();
                }
            });
        });
        </script>

        <%      } else {
                    out.println("<p style='color:#b00020; margin-top:15px; font-weight:600;'>Store Not Found</p>");
                }
                con.close();
            } catch (Exception ex) {
                out.println("<p style='color:#b00020;'>Error: " + ex.getMessage() + "</p>");
            }
        }
        %>

    </div>
</div>

<!-- STATUS POPUPS -->
<script>
<% if ("success".equals(request.getParameter("status"))) { %>
Swal.fire("Updated!", "Store updated successfully.", "success")
.then(() => window.location.href = "viewallstore.jsp");
<% } %>

<% if ("error".equals(request.getParameter("status"))) { %>
Swal.fire("Error", "Failed to update the store. Try again.", "error");
<% } %>

<% if ("duplicate".equals(request.getParameter("status"))) { %>
Swal.fire("Duplicate!", "Store name already exists. Try another one.", "warning");
<% } %>
</script>

</body>
</html>
