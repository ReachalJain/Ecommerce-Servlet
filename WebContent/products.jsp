<%@ page import="java.util.*"%>
<%@ include file="navbar.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
.product-img {
	width: 100%;
	height: 180px;
	object-fit: contain; /* 🔥 better than cover */
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

</head>

<body>

	<div class="container mt-4">
		<div class="row">

			<%
				List<String[]> products = (List<String[]>) request.getAttribute("products");

			if (products != null && !products.isEmpty()) {
				for (String[] p : products) {
					String id = p[0];
					String name = p[1];
					String price = p[2];
			%>

			<div class="col-lg-3 col-md-4 col-sm-6 mb-4">

				<div class="card shadow-sm d-flex flex-column">

					<img
						src="<%=request.getContextPath()%>/images/<%=name.toLowerCase().trim()%>.jpg"
						class="card-img-top product-img">

					<div class="card-body text-center">

						<h5 class="card-title">
							<%=name.substring(0, 1).toUpperCase() + name.substring(1).toLowerCase()%>
						</h5>

						<p class="text-success fw-bold">
							₹
							<%=price%></p>

						<!-- buttons always bottom -->
						<div class="mt-auto">

							<a
								href="<%=request.getContextPath()%>/ProductDetailsServlet?id=<%=id%>"
								class="btn btn-primary btn-sm"> View Details </a>
							<form action="CartServlet" method="post">
								<input type="hidden" name="product_id" value="<%=id%>">
								<input type="hidden" name="quantity" value="1">
								
							</form>

						</div>

					</div>

				</div>

			</div>

			<%
				}
			} else {
			%>
			<p>No products found ❌</p>
			<%
				}
			%>

		</div>
	</div>

</body>
</html>