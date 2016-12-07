package com.luminagalleries.web.dao;

import com.luminagalleries.web.model.Cart;
import com.luminagalleries.web.model.CartItem;

public interface CartItemDao {
	void addCartItem(CartItem cartItem);
	
	void removeCartItem(CartItem cartItem);
	
	void removeAllCartItems(Cart cart);
	
	CartItem getCartItemByProductId(int productId);

}
