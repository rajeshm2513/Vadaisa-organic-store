<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>View All Stores | Dashboard</title>
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

/* MAIN SECTION */
.main-container {
    flex: 1;
    padding: 25px 40px;
    overflow-y: auto;
}

h2 {
    font-size: 28px;
    color: #1e5631;
    font-weight: 700;
    margin-bottom: 25px;
}

/* STORE GRID */
.store-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(270px, 1fr));
    gap: 25px;
}

/* STORE CARD */
.store-card {
    position: relative;
    height: 300px;
    border-radius: 12px;
    cursor: pointer;
    overflow: hidden;
    background: white;
    box-shadow: 0 4px 18px rgba(0,0,0,0.12);
    transition: transform .25s;
}
.store-card:hover {
    transform: translateY(-6px) scale(1.01);
}

/* STORE IMAGE */
.store-card img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

/* HOVER DETAILS */
.store-details {
    position: absolute;
    bottom: -100%;
    left: 0;
    padding: 15px;
    width: 100%;
    background: rgba(30, 86, 49, 0.93);
    color: white;
    transition: bottom .35s ease-in-out;
}
.store-card:hover .store-details {
    bottom: 0;
}

.store-details p {
    margin: 4px 0;
}

/* ACTION BUTTONS */
.action-btns {
    display: flex;
    justify-content: space-between;
    margin-top: 10px;
}
button {
    padding: 7px;
    width: 48%;
    border-radius: 6px;
    border: none;
    cursor: pointer;
    font-weight: 600;
}
.update-btn {
    background: white;
    color: #1e5631;
}
.delete-btn {
    background: #d60000;
    color: white;
}
.delete-btn:hover {
    background: #a30000;
}
</style>
</head>

<body>

<!-- ✅ SIDEBAR -->
<aside class="sidebar">
    <img src="https://res.cloudinary.com/dpxrmf3vc/image/upload/v1761909191/Screenshot__71__copy-removebg-preview_1_ufupio.png" alt="Logo">
    <h2>Store Admin</h2>
    <a href="storeregister.jsp">New Store</a>
    <a href="updatestore.jsp">Update Store</a>
    <a href="deletestore.jsp">Delete Store</a>
    <a href="viewallstore.jsp" style="background:#2e7d47;">View All Stores</a>
</aside>

<!-- ✅ MAIN CONTENT -->
<div class="main-container">

    <h2>All Registered Stores</h2>

    <div class="store-grid">

        <%  
        try {
            Context ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/OracleDB");
            Connection con = ds.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "SELECT STORE_ID, FULL_NAME, STORE_NAME, EMAIL, PHONE, CITY, IMAGE_URL FROM store_registration ORDER BY STORE_ID DESC"
            );
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String img = rs.getString("IMAGE_URL");
                if (img == null || img.trim().equals("")) {
                    img = "https://via.placeholder.com/400x300?text=No+Image";
                }
        %>

        <!-- 🟢 STORE CARD -->
        <div class="store-card">
            <img src="<%= img %>" alt="Store Image">

            <div class="store-details">
                <h3><%= rs.getString("STORE_NAME") %></h3>
                <p><b>Owner:</b> <%= rs.getString("FULL_NAME") %></p>
                <p><b>Email:</b> <%= rs.getString("EMAIL") %></p>
                <p><b>Phone:</b> <%= rs.getString("PHONE") %></p>
                <p><b>City:</b> <%= rs.getString("CITY") %></p>

                <div class="action-btns">
                    <button class="update-btn"
                        onclick="window.location.href='updatestore.jsp?search_store=<%= rs.getString("STORE_NAME") %>'">
                        Update
                    </button>
                    <button class="delete-btn"
                        onclick="deleteStore(<%= rs.getInt("STORE_ID") %>)">
                        Delete
                    </button>
                </div>
            </div>
        </div>

        <%  }
           con.close();
        } catch(Exception e){
            out.println("Error: " + e.getMessage());
        }
        %>
    </div>
</div>

<script>
function deleteStore(id) {
    Swal.fire({
        title: "Are you sure?",
        text: "This store will be deleted permanently!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#d60000",
        cancelButtonColor: "#3085d6",
        confirmButtonText: "Yes, delete"
    }).then((result) => {
        if (result.isConfirmed) {
            window.location.href = "DeleteStore?store_id=" + id;
        }
    });
}

// ✅ SweetAlert Messages after Update/Delete
<% if ("deleted".equals(request.getParameter("status"))) { %>
Swal.fire("Deleted!", "Store deleted successfully.", "success");
<% } %>

<% if ("error".equals(request.getParameter("status"))) { %>
Swal.fire("Error!", "Something went wrong.", "error");
<% } %>
</script>

</body>
</html>
