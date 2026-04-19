package com.ecommerce.servlet;
import java.io.IOException;
import java.sql.*;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.ecommerce.dao.DBConnection;

@WebServlet("/ViewCartServlet")
public class ViewCartServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        HttpSession session = req.getSession();
        Integer userId = (Integer) session.getAttribute("user_id");
        if (userId == null) {
            res.sendRedirect("login.jsp");
            return;
        }
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "SELECT p.* FROM Cart c JOIN Products p ON c.product_id = p.product_id WHERE c.user_id=?"
            );
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            List<String[]> cart = new ArrayList<>();
            while (rs.next()) {
                String[] p = new String[5];
                p[0] = rs.getString("product_id");
                p[1] = rs.getString("name");
                p[2] = rs.getString("price");
                p[3] = rs.getString("image_url");
                p[4] = rs.getString("description");
                cart.add(p);
            }
            req.setAttribute("cart", cart);
            req.getRequestDispatcher("cart.jsp").forward(req, res);
            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}