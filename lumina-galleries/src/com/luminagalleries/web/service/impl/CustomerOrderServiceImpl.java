package com.luminagalleries.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.luminagalleries.web.dao.CustomerOrderDao;
import com.luminagalleries.web.model.Cart;
import com.luminagalleries.web.model.CartItem;
import com.luminagalleries.web.model.CustomerOrder;
import com.luminagalleries.web.service.CartService;
import com.luminagalleries.web.service.CustomerOrderService;


@Service
public class CustomerOrderServiceImpl implements CustomerOrderService {

	@Autowired
	private CustomerOrderDao customerOrderDao;
	
	@Autowired
	private CartService cartService;
	
	@Override
	public void addCustomerOrder(CustomerOrder customerOrder) {
		customerOrderDao.addCustomerOrder(customerOrder);

	}

	@Override
	public double getCustomerOrderGrandTotal(int cartId) {
		double grandTotal = 0;
		Cart cart = cartService.getCartById(cartId);
		List<CartItem> cartItems = cart.getCartItems();
		
		for (CartItem cartItem : cartItems) {
			grandTotal += cartItem.getTotalPrice();
		}
		
		return grandTotal;
	}

}
