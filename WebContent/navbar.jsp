<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark px-3">
    <!-- LOGO -->
    <a class="navbar-brand" href="<%=request.getContextPath()%>/ProductServlet">MyShop</a>
    <div class="collapse navbar-collapse">
        <!-- LEFT -->
        <ul class="navbar-nav me-auto">
            <!-- HOME -->
            <li class="nav-item">
                <a class="nav-link" href="<%=request.getContextPath()%>/ProductServlet">Home</a>
            </li>
            <!-- CATEGORY -->
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">
                    Categories
                </a>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item"
                        href="<%=request.getContextPath()%>/ProductServlet?category=fashion">Fashion</a></li>
                    <li><a class="dropdown-item"
                        href="<%=request.getContextPath()%>/ProductServlet?category=accessories">Accessories</a></li>
                    <li><a class="dropdown-item"
                        href="<%=request.getContextPath()%>/ProductServlet?category=music">Music</a></li>
                    <li><a class="dropdown-item"
                        href="<%=request.getContextPath()%>/ProductServlet?category=study">Study</a></li>
                    <li><a class="dropdown-item"
                        href="<%=request.getContextPath()%>/ProductServlet?category=sports">Sports</a></li>
                    <li><a class="dropdown-item"
                        href="<%=request.getContextPath()%>/ProductServlet?category=electronics">Electronics</a></li>
                </ul>
            </li>
            <!-- CART -->
            <li class="nav-item">
                <a class="nav-link" href="<%=request.getContextPath()%>/ViewCartServlet">Cart 🛒</a>
            </li>
        </ul>
        <!-- SEARCH -->
        <form class="d-flex me-3" action="<%=request.getContextPath()%>/ProductServlet" method="get">
            <input class="form-control me-2" type="search" name="search" placeholder="Search">
            <button class="btn btn-light">Search</button>
        </form>
        <!-- USER -->
        <ul class="navbar-nav">
            <%
                String user = (String) session.getAttribute("username");
                if (user == null) {
            %>
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/login.jsp">Login</a>
                </li>
            <%
                } else {
            %>
                <li class="nav-item">
                    <a class="nav-link">👤 <%=user%></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/logout">Logout</a>
                </li>
            <%
                }
            %>
        </ul>
    </div>
</nav>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>