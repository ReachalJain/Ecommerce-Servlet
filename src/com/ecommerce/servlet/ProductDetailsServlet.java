package com.ecommerce.servlet;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.ecommerce.dao.DBConnection;

@WebServlet("/ProductDetailsServlet")
public class ProductDetailsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String id = req.getParameter("id");

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM Products WHERE product_id=?"
            );

            ps.setString(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                req.setAttribute("id", rs.getInt("product_id"));
                req.setAttribute("name", rs.getString("name"));
                req.setAttribute("price", rs.getDouble("price"));
                req.setAttribute("description", rs.getString("description"));
                req.setAttribute("category", rs.getString("category"));
                req.setAttribute("image", rs.getString("image_url"));
                req.setAttribute("specs", rs.getString("specs"));
            }

            req.getRequestDispatcher("productdetails.jsp").forward(req, res);

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}