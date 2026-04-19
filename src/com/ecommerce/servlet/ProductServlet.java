package com.ecommerce.servlet;

import java.io.IOException;
import java.sql.*;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.ecommerce.dao.DBConnection;

@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {
            Connection con = DBConnection.getConnection();

            String category = req.getParameter("category");
            String search = req.getParameter("search");

           
            String query = "SELECT * FROM Products WHERE 1=1";
            List<String> params = new ArrayList<>();

            // ✅ CATEGORY
            if (category != null && !category.trim().isEmpty()) {
                query += " AND LOWER(category)=?";
                params.add(category.toLowerCase().trim());
            }

            // ✅ SEARCH
            if (search != null && !search.trim().isEmpty()) {
                query += " AND LOWER(name) LIKE ?";
                params.add("%" + search.toLowerCase().trim() + "%");
            }

            PreparedStatement ps = con.prepareStatement(query);

            // set parameters
            for (int i = 0; i < params.size(); i++) {
                ps.setString(i + 1, params.get(i));
            }

            ResultSet rs = ps.executeQuery();

            List<String[]> list = new ArrayList<>();

            while (rs.next()) {
                String[] p = new String[3];
                p[0] = rs.getString("product_id");
                p[1] = rs.getString("name");
                p[2] = rs.getString("price");
                list.add(p);
            }

            req.setAttribute("products", list);
            req.getRequestDispatcher("products.jsp").forward(req, res);

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}