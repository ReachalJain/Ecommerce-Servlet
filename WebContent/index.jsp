<%@ page import="java.util.*" %>
<%@ include file="navbar.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
.product-img {
    width: 100%;
    height: 180px;
    object-fit: contain;
    background-color: #f8f9fa;
    padding: 10px;
}
.card {
    border-radius: 10px;
    height: 100%;
}
.card-body {
    display: flex;
    flex-direction: column;
}
</style>

<div class="container mt-4">
    <div class="row">

<%
List<String[]> products = (List<String[]>) request.getAttribute("products");

if(products != null && !products.isEmpty()){
    for(String[] p : products){

        String id = p[0];
        String name = p[1];
        String price = p[2];
        String image = p[3];
%>

    <div class="col-lg-3 col-md-4 col-sm-6 mb-4">

        <div class="card shadow-sm d-flex flex-column">

            <!-- ✅ IMAGE FROM DB -->
            <img src="<%= request.getContextPath() %>/images/<%= image %>"
                 class="card-img-top product-img">

            <div class="card-body text-center">

                <h5 class="card-title">
                    <%= name.substring(0,1).toUpperCase() + name.substring(1).toLowerCase() %>
                </h5>

                <p class="text-success fw-bold">₹ <%= price %></p>

                <div class="mt-auto">

                    <a href="ProductDetailsServlet?id=<%= id %>" 
                       class="btn btn-primary btn-sm w-100 mb-2">
                        View Details
                    </a>

                    <form action="CartServlet" method="post">
                        <input type="hidden" name="product_id" value="<%= id %>">
                        <input type="hidden" name="quantity" value="1">

                        <button class="btn btn-success btn-sm w-100">
                            Add to Cart
                        </button>
                    </form>

                </div>

            </div>

        </div>

    </div>

<%
    }
} else {
%>
    <div class="text-center mt-5">
        <h4>No products found ❌</h4>
        <p>Try searching something else</p>
    </div>
<%
}
%>

    </div>
</div>