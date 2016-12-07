<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@include file="/WEB-INF/views/template/header.jsp"%>

<div class="container-wrapper">
	<div class="container">
		<div class="page-header">
			<h1>Customer</h1>


			<p class="lead">CustomerDetails:</p>
		</div>

		<form:form commandName="order" class="form-horizontal">
						
			<h3>Shipping Info</h3>
			
			<div class="form-group">
				<label for="shippingStreetAddress">Street Address</label>
				<form:input class="form-control" path="cart.customer.shippingAddress.streetAddress" id="shippingStreetAddress" />
			</div>
			<div class="form-group">
				<label for="shippingApartmentNumber">Apartment Number</label>
				<form:input class="form-control" path="cart.customer.shippingAddress.apartmentNumber" id="shippingApartmentNumber" />
			</div>
			<div class="form-group">
				<label for="shippingCity">City</label>
				<form:input class="form-control" path="cart.customer.shippingAddress.city" id="shippingCity" />
			</div>
			<div class="form-group">
				<label for="shippingState">State</label>
				<form:input class="form-control" path="cart.customer.shippingAddress.state" id="shippingState" />
			</div>
			<div class="form-group">
				<label for="shippingCountry">Country</label>
				<form:input class="form-control" path="cart.customer.shippingAddress.country" id="shippingCountry" />
			</div>
			<div class="form-group">
				<label for="shippingZipCode">Zip Code</label>
				<form:input class="form-control" path="cart.customer.shippingAddress.zipCode" id="shippingZipCode" />
			</div>
			
<!-- 			spring web-flow handlers -->
			<input type="hidden" name="_flowExecutionKey" />
			
			<br/>
			<br/>
<!-- 			spring web-flow handlers -->
			<button class="btn btn-default" name="_eventId_backToCollectCustomerInfo">Back</button>
			<input class="btn btn-default" type="submit" value="Next" name="_eventId_shippingDetailCollected">
			<button class="btn btn-default" name="_eventId_cancel">Cancel</button>
		</form:form>



		<%@include file="/WEB-INF/views/template/footer.jsp"%>