package com.ecommerce.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import com.ecommerce.dao.DBConnection;;

public class OrderServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String product = request.getParameter("product");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double price = Double.parseDouble(request.getParameter("price"));

        HttpSession session = request.getSession();
        String user = (String) session.getAttribute("user");

        try {
            Connection conn = DBConnection.getConnection();

            String query = "INSERT INTO orders(user_email, product_name, quantity, price) VALUES(?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(query);

            ps.setString(1, user);
            ps.setString(2, product);
            ps.setInt(3, quantity);
            ps.setDouble(4, price);

            ps.executeUpdate();

            response.sendRedirect("success.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}