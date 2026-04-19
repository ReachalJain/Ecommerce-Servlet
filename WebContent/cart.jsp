<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ include file="navbar.jsp"%>
<h2>Your Cart</h2>
<%
    List<String[]> cart = (List<String[]>) request.getAttribute("cart");
    if (cart == null || cart.isEmpty()) {
%>
<p>Cart is empty</p>
<%
    } else {
        for (int i = 0; i < cart.size(); i++) {
            String[] p = cart.get(i);
%>
<div style="border: 1px solid #ccc; padding: 10px; margin: 10px;">

    <!-- IMAGE -->
    <img src="images/<%=p[3]%>" width="100">

    <!-- NAME -->
    <h4><%=p[1]%></h4>

    <!-- PRICE -->
    <p>₹<%=p[2]%></p>

    <!-- DESCRIPTION -->
    <p><%=p[4]%></p>

    <!-- 🔍 VIEW DETAILS BUTTON -->
    <a href="<%=request.getContextPath()%>/ProductDetailsServlet?id=<%=p[0]%>"
       class="btn btn-primary btn-sm">View Details</a>

    <!-- ❌ REMOVE BUTTON - now passes product_id instead of index -->
    <a href="<%=request.getContextPath()%>/RemoveCartServlet?product_id=<%=p[0]%>"
       class="btn btn-danger btn-sm ms-2">Remove ❌</a>

</div>
<%
        }
    }
%>