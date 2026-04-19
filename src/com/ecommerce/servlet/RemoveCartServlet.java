package com.ecommerce.servlet;
import java.io.IOException;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.ecommerce.dao.DBConnection;

@WebServlet("/RemoveCartServlet")
public class RemoveCartServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws IOException {
        HttpSession session = req.getSession();

        // 🔒 Safety check - get product_id instead of index
        String productId = req.getParameter("product_id");
        if (productId == null) {
            res.sendRedirect("ViewCartServlet");
            return;
        }

        Integer userId = (Integer) session.getAttribute("user_id");
        if (userId == null) {
            res.sendRedirect("login.jsp");
            return;
        }

        try {
            Connection con = DBConnection.getConnection();

            // ✅ Delete only this specific product for this user from DB
            PreparedStatement ps = con.prepareStatement(
                "DELETE FROM Cart WHERE user_id=? AND product_id=?"
            );
            ps.setInt(1, userId);
            ps.setString(2, productId);
            ps.executeUpdate();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        // ✅ Redirect to ViewCartServlet so cart reloads fresh from DB
        res.sendRedirect("ViewCartServlet");
    }
}