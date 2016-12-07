<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" 
           uri="http://www.springframework.org/tags/form"%>
           
<%@include file="/WEB-INF/views/template/header.jsp" %>

	<div class="container-wrapper">
		<div class="container">
			<div class="page-header">
				<h1>Customer Management Page</h1>


				<p class="lead">Update customer information</p>
			</div>
			
			<table class="table table-striped table-hover">
				<thead>
				<tr class="bg-success">
					<th>Customer Name</th>
					<th>Email</th>
					<th>Phone</th>
					<th>User Name</th>
					<th>Enabled</th>
					
				</tr>
				</thead>
				<c:forEach var="customer" items="${customerList}">
				<tr>
					<td>${customer.customerName}</td>
					<td>${customer.customerEmail}</td>
					<td>${customer.customerPhone}</td>
					<td>${customer.username}</td>
					<td>${customer.enabled}</td>
				</tr>
				</c:forEach>
			</table>

<%@include file="/WEB-INF/views/template/footer.jsp" %>