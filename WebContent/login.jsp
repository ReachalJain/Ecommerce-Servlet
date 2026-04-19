<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
.box {
    width: 380px;
    margin: 80px auto;
    padding: 30px;
    box-shadow: 0 0 15px #ccc;
    border-radius: 10px;
    background: #fff;
}
</style>
</head>
<body>
<%@ include file="navbar.jsp" %>
<div class="box">
    <h3 class="text-center mb-4">Login</h3>

    <!-- ✅ Show error message if invalid credentials -->
    <% if ("invalid".equals(request.getParameter("error"))) { %>
        <div class="alert alert-danger">Invalid email or password ❌</div>
    <% } %>

    <!-- ✅ Show success message after signup -->
    <% if ("registered".equals(request.getParameter("success"))) { %>
        <div class="alert alert-success">Account created! Please login ✅</div>
    <% } %>

    <form action="login" method="post">
        <input type="email" name="email" class="form-control mb-2" placeholder="Email" required>
        <input type="password" name="password" class="form-control mb-3" placeholder="Password" required>
        <button class="btn btn-primary w-100">Login</button>
    </form>

    <!-- ✅ Signup link -->
    <p class="text-center mt-3">
        Don't have an account? <a href="signup.jsp">Sign Up</a>
    </p>
</div>
</body>
</html>