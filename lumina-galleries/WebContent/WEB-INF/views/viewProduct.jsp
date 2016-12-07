<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<%@include file="/WEB-INF/views/template/header.jsp"%>

<div class="container-wrapper">
	<div class="container">
		<div class="page-header">
			<h1>${product.productName}</h1>


			<p class="lead">${product.productDescription}</p>
		</div>

		<div class="container" ng-app="cartApp">
			<div class="row">
				<div class="col-md-5">
					<img style="width: 100%; height: 400px" alt="image"
						src="<c:url value="/resources/images/${product.productId}.png"/>" />
				</div>
				<div class="col-md-5">

					<p>
						<strong>Manufacturer:</strong> ${product.productManufacturer}
					</p>
					<p>
						<strong>Category:</strong> ${product.productCategory}
					</p>
					<p>
						<strong>Condition:</strong> ${product.productCondition}
					</p>
					<p>
						<strong>Price:</strong> ${product.productPrice} USD
					</p>

					<br />

					<!-- 					fetch the user role from context -->
					<c:set var="role" scope="page" value="${param.role}" />
					<c:set var="url" scope="page" value="/product/productList" />
					<c:if test="${role = 'admin'}">
						<c:set var="url" scope="page" value="/admin/productInventory" />
					</c:if>

					<!-- 					dynamic back button based on the user role -->
					<p ng-controller="cartCtrl">
						<a href="<c:url value="${url}"/>" class="btn btn-default">Back</a>
						<a href="#" class="btn btn-warning btn-large"
							ng-click="addToCart('${product.productId}')"><span class="glyphicon glyphicon-shopping-cart"></span>Add to Cart</a>
						<a href="<spring:url value="/customer/cart"/>" class="btn btn-default"><span class="glyphicon glyphicon-hand-right"></span>View Cart</a>
					</p>
				</div>
			</div>

		</div>

<script src="<c:url value="/resources/js/controller.js"/>"></script>

<%@include file="/WEB-INF/views/template/footer.jsp"%>