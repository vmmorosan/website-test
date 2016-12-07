package com.luminagalleries.web.dao;

import java.io.IOException;

import com.luminagalleries.web.model.Cart;

public interface CartDao {
	
	Cart getCartById(int cartId);
	
	Cart validate(int cartId) throws IOException;
	
	void update(Cart cart);
	
}
