<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
.container-box {
    max-width: 400px;
    margin: 80px auto;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 0 15px rgba(0,0,0,0.1);
    background: #fff;
}
h2 {
    text-align: center;
    margin-bottom: 20px;
}
</style>
</head>
<body>
<%@ include file="navbar.jsp" %>
<div class="container">
    <div class="container-box">
        <h2>Sign Up</h2>

        <!-- ✅ Show error if email already exists -->
        <% if ("exists".equals(request.getParameter("error"))) { %>
            <div class="alert alert-danger">Email already registered! Please login ❌</div>
        <% } %>

        <!-- ✅ Show error if signup failed -->
        <% if ("failed".equals(request.getParameter("error"))) { %>
            <div class="alert alert-danger">Signup failed. Please try again ❌</div>
        <% } %>

        <form action="<%= request.getContextPath() %>/signup" method="post">
            <input type="text" name="name" class="form-control mb-3" placeholder="Enter Name" required>
            <input type="email" name="email" class="form-control mb-3" placeholder="Enter Email" required>
            <input type="password" name="password" class="form-control mb-3" placeholder="Enter Password" required>
            <button type="submit" class="btn btn-primary w-100">Sign Up</button>
        </form>

        <!-- ✅ Login link -->
        <p class="text-center mt-3">
            Already have an account? <a href="login.jsp">Login</a>
        </p>
    </div>
</div>
</body>
</html>