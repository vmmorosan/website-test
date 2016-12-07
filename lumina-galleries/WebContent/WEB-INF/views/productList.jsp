<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@include file="/WEB-INF/views/template/header.jsp"%>

<!-- configuration for the data table plugin -->
<script>
	$(document).ready(
			function() {
				var searchCondition = '${searchCondition}';

				$('.table').dataTable(
						{
							"lengthMenu" : [ [3, 5, 10, -1 ],
									[3, 5, 10, "All Products" ] ],
							"oSearch" : {
								"sSearch" : searchCondition
							}
						});
			});
</script>


<div class="container-wrapper">
	<div class="container">
		<div class="page-header">
			<h1>Product Management page</h1>


			<p class="lead">Update Product information</p>
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
			<tbody>
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
								class="glyphicon glyphicon-info-sign"></span></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<%@include file="/WEB-INF/views/template/footer.jsp"%>