package com.luminagalleries.web.service;

import com.luminagalleries.web.model.Cart;

public interface CartService {
	Cart getCartById(int cartId);
	
	void update(Cart cart);

}
