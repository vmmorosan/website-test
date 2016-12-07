<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@include file="/WEB-INF/views/template/header.jsp"%>

<div class="container-wrapper">
	<div class="container">
		<div class="page-header">
			<h1>Customer</h1>


			<p class="lead">CustomerDetails:</p>
		</div>

		<form:form commandName="order" class="form-horizontal">
			
			<h3>Basic Info</h3>
			
			<div class="form-group">
				<label for="name">Name</label>
				<form:input class="form-control" path="cart.customer.customerName" id="name" />
			</div>
			<div class="form-group">
				<label for="email">Email Address</label>
				<form:input class="form-control" path="cart.customer.customerEmail" id="email" />
			</div>
			<div class="form-group">
				<label for="phone">Phone Number</label>
				<form:input class="form-control" path="cart.customer.customerPhone" id="phone" />
			</div>
			
			<h3>Billing Info</h3>
			
			<div class="form-group">
				<label for="billingStreetAddress">Street Address</label>
				<form:input class="form-control" path="cart.customer.billingAddress.streetAddress" id="billingStreetAddress" />
			</div>
			<div class="form-group">
				<label for="billingApartmentNumber">Apartment Number</label>
				<form:input class="form-control" path="cart.customer.billingAddress.apartmentNumber" id="billingApartmentNumber" />
			</div>
			<div class="form-group">
				<label for="billingCity">City</label>
				<form:input class="form-control" path="cart.customer.billingAddress.city" id="billingCity" />
			</div>
			<div class="form-group">
				<label for="billingState">State</label>
				<form:input class="form-control" path="cart.customer.billingAddress.state" id="billingState" />
			</div>
			<div class="form-group">
				<label for="billingCountry">Country</label>
				<form:input class="form-control" path="cart.customer.billingAddress.country" id="billingCountry" />
			</div>
			<div class="form-group">
				<label for="billingZipCode">Zip Code</label>
				<form:input class="form-control" path="cart.customer.billingAddress.zipCode" id="billingZipCode" />
			</div>
			
<!-- 			spring web-flow handlers -->
			<input type="hidden" name="_flowExecutionKey" />
			
			<br/>
			<br/>
			<input class="btn btn-default" type="submit" value="Next" name="_eventId_customerInfoCollected">
			<button class="btn btn-default" name="_eventId_cancel">Cancel</button>
		</form:form>



		<%@include file="/WEB-INF/views/template/footer.jsp"%>