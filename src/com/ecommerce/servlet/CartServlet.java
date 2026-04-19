package com.ecommerce.servlet;
import java.io.IOException;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.ecommerce.dao.DBConnection;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws IOException {
        HttpSession session = req.getSession();
        String productId = req.getParameter("product_id");
        if (productId == null) {
            res.sendRedirect("ProductServlet");
            return;
        }
        Integer userId = (Integer) session.getAttribute("user_id");
        if (userId == null) {
            res.sendRedirect("login.jsp");
            return;
        }
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement check = con.prepareStatement(
                "SELECT * FROM Cart WHERE user_id=? AND product_id=?"
            );
            check.setInt(1, userId);
            check.setString(2, productId);
            ResultSet rs = check.executeQuery();
            if (!rs.next()) {
                PreparedStatement insert = con.prepareStatement(
                    "INSERT INTO Cart(user_id, product_id) VALUES (?, ?)"
                );
                insert.setInt(1, userId);
                insert.setString(2, productId);
                insert.executeUpdate();
                insert.close();
            }
            rs.close();
            check.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        res.sendRedirect("ViewCartServlet");
    }
}