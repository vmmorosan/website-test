package com.luminagalleries.web.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.luminagalleries.web.model.Cart;
import com.luminagalleries.web.model.Customer;
import com.luminagalleries.web.model.CustomerOrder;
import com.luminagalleries.web.service.CartService;
import com.luminagalleries.web.service.CustomerOrderService;

@Controller
public class OrderController {

	@Autowired
	private CartService cartService;
	
	@Autowired
	private CustomerOrderService customerOrderService;
	
	@RequestMapping("/order/{cartId}")
	public String createOrder(@PathVariable("cartId") int cartId){
		CustomerOrder customerOrder = new CustomerOrder();
		Cart cart = cartService.getCartById(cartId);
		Customer customer = cart.getCustomer();
		
		customerOrder.setCart(cart);
		customerOrder.setCustomer(customer);
		customerOrder.setBillingAddress(customer.getBillingAddress());
		customerOrder.setShippingAddress(customer.getShippingAddress());
		
		customerOrderService.addCustomerOrder(customerOrder);
		
		//employ web-flow action-state addCartToOrder
		return "redirect:/checkout?cartId=" + cartId;
	}
}
