<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@include file="/WEB-INF/views/template/header.jsp"%>

<div class="container-wrapper">
	<div class="container">
		<section>
			<div class="jumbotron">
				<div class="conatiner">
					<h1 class="alert alert-danger">Checkout Cancelled!!!</h1>
					<p>Continue shopping.....</p>
				</div>
			</div>
		</section>
		<section class="container">
				<p>
					<a href="<spring:url value="/product/productList" />" class ="btn btn-default">Continue Shopping</a>
				</p>
		</section>


	</div>
</div>


<%@include file="/WEB-INF/views/template/footer.jsp"%>