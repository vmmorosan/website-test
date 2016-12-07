<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@include file="/WEB-INF/views/template/header.jsp"%>

<!-- configuration for the data table plug-in -->
<script>
	$(document).ready(
			function() {
				$('.table').dataTable(
						{
							"lengthMenu" : [ [3, 5, 10, -1 ],
									[3, 5, 10, "All Products" ] ]
						});
			});
</script>


<div class="container-wrapper">
	<div class="container">
		<div class="page-header">
			<h1>Product Inventory</h1>


			<p class="lead">Check all the lamps available now</p>
		</div>

		<table class="table table-striped table-hover">
			<thead>
				<tr class="bg-success">
					<th>Photo Thumb</th>
					<th>Product Name</th>
					<th>Category</th>
					<th>Description</th>
					<th>Manufacturer</th>
					<th>Price</th>
					<th></th>
				</tr>
			</thead>
			<c:forEach var="product" items="${products}">
				<tr>
					<td><img alt="image"
						src="<c:url value="/resources/images/${product.productId}.png"/>"
						style="width: 100px;" /></td>
					<td>${product.productName}</td>
					<td>${product.productCategory}</td>
					<td>${product.productDescription}</td>
					<td>${product.productManufacturer}</td>
					<td>${product.productPrice}USD</td>
					<td><a
						href="<spring:url value="/product/viewProduct/${product.productId}" />"><span
							class="glyphicon glyphicon-info-sign"></span>  </a> <a
						href="<spring:url value="/admin/product/deleteProduct/${product.productId}" />"><span
							class="glyphicon glyphicon-remove"></span>  </a> <a
						href="<spring:url value="/admin/product/editProduct/${product.productId}" />"><span
							class="glyphicon glyphicon-pencil"></span></a></td>
				</tr>
			</c:forEach>
		</table>

		<a class="btn btn-primary"
			href='<spring:url value="/admin/product/addProduct"></spring:url>'>Add
			Product</a>

		<%@include file="/WEB-INF/views/template/footer.jsp"%>