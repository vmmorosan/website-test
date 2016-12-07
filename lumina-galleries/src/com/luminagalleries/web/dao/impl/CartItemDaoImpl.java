package com.luminagalleries.web.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.luminagalleries.web.dao.CartItemDao;
import com.luminagalleries.web.model.Cart;
import com.luminagalleries.web.model.CartItem;

@Repository
@Transactional
public class CartItemDaoImpl implements CartItemDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	private Session session(){
		Session session = sessionFactory.getCurrentSession();
		return session;
	}

	
	@Override
	public void addCartItem(CartItem cartItem) {
		session().saveOrUpdate(cartItem);
		session().flush();
	}

	@Override
	public void removeCartItem(CartItem cartItem) {
		session().delete(cartItem);
		session().flush();

	}

	@Override
	public void removeAllCartItems(Cart cart) {
		List<CartItem> cartItems = cart.getCartItems();
		
		for (CartItem cartItem : cartItems) {
			removeCartItem(cartItem);
		}

	}


	@Override
	public CartItem getCartItemByProductId(int productId) {
		Query query = session().createQuery("from CartItem where productId = ?");
		query.setInteger(0, productId);
		session().flush();
		
		return (CartItem) query.uniqueResult();
	}

}
