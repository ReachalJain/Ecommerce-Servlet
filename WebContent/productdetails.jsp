<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="navbar.jsp"%>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<div class="container mt-5">
	<div class="row">

		<!-- LEFT: Product Image -->
		<div class="col-md-5">
			<%
				String image = (String) request.getAttribute("image");

			if (image != null && image.startsWith("http")) {
			%>
			<!-- 🌐 If image is URL -->
			<img src="<%=image%>" class="img-fluid rounded shadow"
				style="width: 100%; height: 350px; object-fit: cover;">
			<%
				} else if (image != null) {
			%>
			<!-- 📁 If image is local -->
			<img src="<%=request.getContextPath()%>/images/<%=image%>"
				class="img-fluid rounded shadow"
				style="width: 100%; height: 350px; object-fit: cover;">
			<%
				} else {
			%>
			<!-- ❌ fallback -->
			<img src="<%=request.getContextPath()%>/images/default.jpg"
				class="img-fluid rounded shadow"
				style="width: 100%; height: 350px; object-fit: cover;">
			<%
				}
			%>
		</div>

		<!-- RIGHT: Product Details -->
		<div class="col-md-7">

			<!-- CATEGORY -->
			<h5 class="text-muted">
				<i><%=request.getAttribute("category") != null ? request.getAttribute("category") : "No Category"%></i>
			</h5>

			<!-- PRODUCT NAME -->
			<h2 class="fw-bold">
				<%=request.getAttribute("name") != null ? request.getAttribute("name") : "No Name"%>(ID:
				<%=request.getAttribute("id")%>)
			</h2>

			<!-- PRICE -->
			<h4 class="text-success mt-3">
				₹
				<%=request.getAttribute("price") != null ? request.getAttribute("price") : "0"%>
			</h4>

			<!-- DESCRIPTION -->
			<h5 class="mt-4">Product Details</h5>
			<p>
				<%=request.getAttribute("description") != null ? request.getAttribute("description") : "No description available"%>
			</p>

			<!-- SPECIFICATIONS -->
			<h5 class="mt-4">Specifications</h5>

			<%
				String specs = (String) request.getAttribute("specs");

			if (specs != null && !specs.trim().isEmpty()) {
				String[] details = specs.split(",");

				for (String d : details) {
			%>
			<p>
				👉
				<%=d.trim()%></p>
			<%
				}
			} else {
			%>
			<p>No specifications available</p>
			<%
				}
			%>

			<!-- BUTTONS -->
			<div class="mt-4">

				<a
					href="<%=request.getContextPath()%>/CartServlet?product_id=<%=request.getAttribute("id")%>"
					class="btn btn-success"> Add to Cart 🛒 </a>
				<button onclick="history.back()" class="btn btn-secondary">
					Back</button>

			</div>

		</div>

	</div>
</div>