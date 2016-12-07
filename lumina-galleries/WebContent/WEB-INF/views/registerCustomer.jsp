<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@include file="/WEB-INF/views/template/header.jsp"%>

<div class="container-wrapper">
	<div class="container">
		<div class="page-header">
			<h1>Customer Registration</h1>


			<p class="lead">Please enter the required information:</p>
		</div>

		<form:form action="${pageContext.request.contextPath}/register"
			method="post" commandName="customer">

			<h3>Basic Info</h3>

			<div class="form-group">
				<label for="name">Name</label>
				<form:errors path="customerName" cssStyle="color:#ff0000" />
				<form:input class="form-control" path="customerName" id="name" />
			</div>
			<div class="form-group">
				<label for="email">Email Address</label><span style="color: #ff0000">${emailMsg}</span>
				<form:errors path="customerEmail" cssStyle="color:#ff0000" />
				<form:input class="form-control" path="customerEmail" id="email" />
			</div>
			<div class="form-group">
				<label for="phone">Phone Number</label>
				<form:input class="form-control" path="customerPhone" id="phone" />
			</div>
			<div class="form-group">
				<label for="username">User Name</label><span style="color: #ff0000">${usernameMsg}</span>
				<form:errors path="username" cssStyle="color:#ff0000" />
				<form:input class="form-control" path="username" id="username" />
			</div>
			<div class="form-group">
				<label for="password">Password</label><form:errors path="password" cssStyle="color:#ff0000"/>
				<form:password class="form-control" path="password" id="password" />
			</div>

			<h3>Billing Info</h3>

			<div class="form-group">
				<label for="billingStreetAddress">Street Address</label>
				<form:input class="form-control" path="billingAddress.streetAddress"
					id="billingStreetAddress" />
			</div>
			<div class="form-group">
				<label for="billingApartmentNumber">Apartment Number</label>
				<form:input class="form-control"
					path="billingAddress.apartmentNumber" id="billingApartmentNumber" />
			</div>
			<div class="form-group">
				<label for="billingCity">City</label>
				<form:input class="form-control" path="billingAddress.city"
					id="billingCity" />
			</div>
			<div class="form-group">
				<label for="billingState">State</label>
				<form:input class="form-control" path="billingAddress.state"
					id="billingState" />
			</div>
			<div class="form-group">
				<label for="billingCountry">Country</label>
				<form:input class="form-control" path="billingAddress.country"
					id="billingCountry" />
			</div>
			<div class="form-group">
				<label for="billingZipCode">Zip Code</label>
				<form:input class="form-control" path="billingAddress.zipCode"
					id="billingZipCode" />
			</div>

			<h3>Shipping Info</h3>

			<div class="form-group">
				<label for="shippingStreetAddress">Street Address</label>
				<form:input class="form-control"
					path="shippingAddress.streetAddress" id="shippingStreetAddress" />
			</div>
			<div class="form-group">
				<label for="shippingApartmentNumber">Apartment Number</label>
				<form:input class="form-control"
					path="shippingAddress.apartmentNumber" id="shippingApartmentNumber" />
			</div>
			<div class="form-group">
				<label for="shippingCity">City</label>
				<form:input class="form-control" path="shippingAddress.city"
					id="shippingCity" />
			</div>
			<div class="form-group">
				<label for="shippingState">State</label>
				<form:input class="form-control" path="shippingAddress.state"
					id="shippingState" />
			</div>
			<div class="form-group">
				<label for="shippingCountry">Country</label>
				<form:input class="form-control" path="shippingAddress.country"
					id="shippingCountry" />
			</div>
			<div class="form-group">
				<label for="shippingZipCode">Zip Code</label>
				<form:input class="form-control" path="shippingAddress.zipCode"
					id="shippingZipCode" />
			</div>


			<br />
			<input class="btn btn-default" type="submit" value="Submit">
			<a class="btn btn-default" href="<c:url value="/"/>">Cancel</a>
		</form:form>



		<%@include file="/WEB-INF/views/template/footer.jsp"%>