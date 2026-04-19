package com.ecommerce.servlet;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.ecommerce.dao.DBConnection;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {

    // ✅ doGet handles direct URL access
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("signup.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Connection conn = DBConnection.getConnection();

            // ✅ Check if email already exists
            PreparedStatement check = conn.prepareStatement(
                "SELECT * FROM users WHERE email=?"
            );
            check.setString(1, email);
            ResultSet rs = check.executeQuery();

            if (rs.next()) {
                // ✅ Email already registered
                response.sendRedirect("signup.jsp?error=exists");
                rs.close();
                check.close();
                conn.close();
                return;
            }
            rs.close();
            check.close();

            // ✅ Insert new user
            PreparedStatement ps = conn.prepareStatement(
                "INSERT INTO users(name, email, password) VALUES (?, ?, ?)"
            );
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, password);
            int result = ps.executeUpdate();

            if (result > 0) {
                // ✅ Signup success → go to login with success message
                response.sendRedirect("login.jsp?success=registered");
            } else {
                response.sendRedirect("signup.jsp?error=failed");
            }
            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("signup.jsp?error=failed");
        }
    }
}