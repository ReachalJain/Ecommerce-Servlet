<%@ page import="java.util.*" %>

<%
if(session.getAttribute("user") == null){
    response.sendRedirect("login.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checkout</title>

<!-- ✅ Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>

<%@ include file="navbar.jsp" %>

<div class="container mt-4">

    <h2 class="mb-4"> Your Cart</h2>

    <%
    List<String> cart = (List<String>) request.getAttribute("cart");

    if(cart != null && !cart.isEmpty()){
        for(String item : cart){
    %>

        <div class="card p-2 mb-2">
            <%= item %>
        </div>

    <%
        }
    } else {
    %>
        <p>No items in cart ❌</p>
    <%
    }
    %>

    <hr>

    <!-- ✅ PLACE ORDER BUTTON -->
    <form action="OrderServlet" method="post">
        <button class="btn btn-success">Place Order</button>
    </form>

</div>

</body>
</html>