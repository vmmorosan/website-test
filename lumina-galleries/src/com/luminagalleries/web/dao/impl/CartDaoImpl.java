package com.luminagalleries.web.dao.impl;

import java.io.IOException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.luminagalleries.web.dao.CartDao;
import com.luminagalleries.web.model.Cart;
import com.luminagalleries.web.service.CustomerOrderService;

@Repository
@Transactional
public class CartDaoImpl implements CartDao {
	
	@Autowired
	private CustomerOrderService customerOrderService;
	
	@Autowired
	private SessionFactory sessionFactory;
	
	private Session session(){
		Session session = sessionFactory.getCurrentSession();
		return session;
	}


	@Override
	public Cart getCartById(int cartId) {
		Cart cart = (Cart) session().get(Cart.class, cartId);
		session().flush();
		
		return cart;
	}

	@Override
	public void update(Cart cart) {
		int cartId = cart.getCartId();
		double grandTotal = customerOrderService.getCustomerOrderGrandTotal(cartId);
		cart.setGrandTotal(grandTotal);
		
		session().saveOrUpdate(cart);
		session().flush();
	}


	@Override
	public Cart validate(int cartId) throws IOException {
		Cart cart = getCartById(cartId);
		//cannot validate not existing or empty cart
		if(cart == null || cart.getCartItems().size()==0){
			throw new IOException(cartId+"");
		}
		
		update(cart);
		return cart;
	}


}
