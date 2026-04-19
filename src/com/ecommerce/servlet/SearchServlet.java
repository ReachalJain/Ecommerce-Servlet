package com.ecommerce.servlet;

import java.io.IOException;
import java.sql.*;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.ecommerce.dao.DBConnection;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String query = req.getParameter("search");

        // ✅ Safety check
        if (query == null || query.trim().isEmpty()) {
            res.sendRedirect("index.jsp");
            return;
        }

        List<String[]> products = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM Products WHERE LOWER(name) LIKE ? OR LOWER(category) LIKE ?"
            );

            String searchTerm = "%" + query.toLowerCase().trim() + "%";

            ps.setString(1, searchTerm);
            ps.setString(2, searchTerm);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                String[] p = new String[4];
                p[0] = String.valueOf(rs.getInt("product_id"));
                p[1] = rs.getString("name");
                p[2] = String.valueOf(rs.getDouble("price"));
                p[3] = rs.getString("image_url");

                products.add(p);
            }

            req.setAttribute("products", products);
            req.getRequestDispatcher("index.jsp").forward(req, res);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}