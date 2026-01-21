package project;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/storelogin")
public class StoreLogin extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // ✅ Oracle DB Credentials
    private static final String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
    private static final String DB_USER = "system";       // your username
    private static final String DB_PASSWORD = "rajesh";   // your password

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // ✅ Load Oracle Driver
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // ✅ Connect to DB
            con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String query = "SELECT store_id, store_username, password_hash FROM store_registration WHERE email = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, email);

            rs = ps.executeQuery();

            if (rs.next()) {
                String dbPassword = rs.getString("password_hash");

                // ✅ Compare plain text password (no hashing)
                if (password.equals(dbPassword)) {

                    HttpSession session = request.getSession();
                    session.setAttribute("store_id", rs.getInt("store_id"));
                    session.setAttribute("store_username", rs.getString("store_username"));

                    response.sendRedirect("storedashboard.jsp");
                } else {
                    response.sendRedirect("storelogin.jsp?error=wrongpassword");
                }

            } else {
                response.sendRedirect("storelogin.jsp?error=nouser");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("storelogin.jsp?error=exception");

        } finally {
            try { if (rs != null) rs.close(); } catch (Exception ignored) {}
            try { if (ps != null) ps.close(); } catch (Exception ignored) {}
            try { if (con != null) con.close(); } catch (Exception ignored) {}
        }
    }
}
