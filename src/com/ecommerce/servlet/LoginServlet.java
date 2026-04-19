package com.ecommerce.servlet;
import java.io.IOException;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.ecommerce.dao.DBConnection;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws IOException {
        res.sendRedirect("login.jsp");
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM users WHERE email=? AND password=?"
            );
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                HttpSession session = req.getSession();
                session.setAttribute("username", rs.getString("name"));
                session.setAttribute("user_id", rs.getInt("user_id"));
                System.out.println("LOGIN SUCCESS → user_id = " + rs.getInt("user_id"));
                res.sendRedirect("ProductServlet");
            } else {
                // ✅ Redirect back to login with error message
                res.sendRedirect("login.jsp?error=invalid");
            }
            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}