<%-- <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%> --%>
<%-- <%@ taglib prefix="form"  --%>
<%--            uri="http://www.springframework.org/tags/form"%> --%>

<%@include file="/WEB-INF/views/template/header.jsp"%>

<div class="container-wrapper">
	<div class="container">
		<div class="page-header">
			<h1>Admin Page</h1>

			<p class="lead">This is the admin page</p>
		</div>
		<!-- 		based on current loged-in user from the Spring security context-->
		<c:if test="${pageContext.request.userPrincipal.name != null}">
			<h2>
				Welcome:${pageContext.request.userPrincipal.name} | <a
					href="<c:url value="j_spring_security_logout"/>">Logout</a>
			</h2>
		</c:if>

		<h3>
			<a href="<c:url value="/admin/productInventory"/>">Product
				Inventory</a>
		</h3>

		<p>View and modify product</p>

		<br> <br>

		<h3>
			<a href="<c:url value="/admin/customer"/>">Customer
				Management</a>
		</h3>

		<p>View and modify customer information</p>

		<%@include file="/WEB-INF/views/template/footer.jsp"%>