<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="/WEB-INF/views/template/header.jsp"%>
<jsp:useBean id="now" class= "java.util.Date"></jsp:useBean>

<div class="container-wrapper">
	<div class="container">
		<div class="page-header">
			<h1>Order</h1>


			<p class="lead">Order Confirmation:</p>
		</div>
		<div class="container">
			<div class="row">

				<form:form commandName="order" class="form-horizontal">

					<div
						class="well col-xs-10 col-sm-10 col-md-6 col-xs-offset-1 col-sm-offset-1 col-md-offset-3">

						<div class="text-center">
							<h1>Receipt</h1>
						</div>
						<!-- 						Show shipping address -->
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6">
								<address>
									<strong>Shipping Address</strong><br />
									${order.cart.customer.shippingAddress.streetAddress}<br />
									${order.cart.customer.shippingAddress.apartmentNumber}<br />
									${order.cart.customer.shippingAddress.city},
									${order.cart.customer.shippingAddress.state}
									${order.cart.customer.shippingAddress.zipCode}<br />
									${order.cart.customer.shippingAddress.country}<br />
								</address>
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6 text-right">
								<p>
									Shipping Date:
									<fmt:formatDate type="date" value="${now}" />
								</p>
							</div>
						</div>
						<!-- 						show billing address -->
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6">
								<address>
									<strong>Billing Address</strong><br />
									${order.cart.customer.billingAddress.streetAddress}<br />
									${order.cart.customer.billingAddress.apartmentNumber}<br />
									${order.cart.customer.billingAddress.city},
									${order.cart.customer.billingAddress.state}
									${order.cart.customer.billingAddress.zipCode}<br />
									${order.cart.customer.billingAddress.country}<br />
								</address>
							</div>
							
						</div>
						<!-- 						Show order details -->
						<div class="row">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>Product</th>
										<th>#</th>
										<th class="text-center">Price</th>
										<th class="text-center">Total</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="cartItem" items="${order.cart.cartItems}">
										<tr>
											<td class="col-md-9"><em>${cartItem.product.productName}</em></td>
											<td class="col-md-1" style="text-allign: center;">${cartItem.quantity}</td>
											<td class="col-md-1" style="text-allign: center;">${cartItem.product.productPrice}</td>
											<td class="col-md-1" style="text-allign: center;">${cartItem.totalPrice}</td>
										</tr>
									</c:forEach>
										<tr>
											<td></td>
											<td></td>
											<td class="text-right">
												<h4><strong>Grand Total:</strong></h4>
											</td>
											<td class="text-center text-danger">
												<h4><strong>${order.cart.grandTotal}</strong></h4>
											</td>
										</tr>
								</tbody>
							</table>
						</div>

						<!-- 			spring web-flow handlers -->
						<input type="hidden" name="_flowExecutionKey" /> <br /> <br />
						
						<button class="btn btn-default"
							name="_eventId_backToCollectShippingDetail">Back</button>
						<input class="btn btn-default" type="submit" value="Submit Order"
							name="_eventId_orderConfirmed">
						<button class="btn btn-default" name="_eventId_cancel">Cancel</button>
					</div>
				</form:form>
			</div>
		</div>


		<%@include file="/WEB-INF/views/template/footer.jsp"%>