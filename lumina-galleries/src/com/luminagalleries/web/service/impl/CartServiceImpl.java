package com.luminagalleries.web.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.luminagalleries.web.dao.CartDao;
import com.luminagalleries.web.model.Cart;
import com.luminagalleries.web.service.CartService;

@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartDao cartDao;

	@Override
	public Cart getCartById(int cartId) {
		
		return cartDao.getCartById(cartId);
	}

	@Override
	public void update(Cart cart) {
		cartDao.update(cart);

	}

}
