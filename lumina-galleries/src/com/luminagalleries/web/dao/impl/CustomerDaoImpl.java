package com.luminagalleries.web.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.luminagalleries.web.dao.CustomerDao;
import com.luminagalleries.web.model.Authorities;
import com.luminagalleries.web.model.Cart;
import com.luminagalleries.web.model.Customer;
import com.luminagalleries.web.model.Users;

@Repository
@Transactional
public class CustomerDaoImpl implements CustomerDao{
	
	@Autowired
	private SessionFactory sessionFactory;
	
	private Session session(){
		Session session = sessionFactory.getCurrentSession();
		return session;
	}


	@Override
	public void addCustomer(Customer customer) {
		//attach this customer to billingAddress object
		customer.getBillingAddress().setCustomer(customer);
		//attach this customer to shippingAddress object
		customer.getShippingAddress().setCustomer(customer);
		
		session().saveOrUpdate(customer);
		session().saveOrUpdate(customer.getBillingAddress());
		session().saveOrUpdate(customer.getShippingAddress());
		
		//security credentials
		Users newUser = new Users();
		newUser.setUsername(customer.getUsername());
		newUser.setPassword(customer.getPassword());
		newUser.setEnabled(true);
		newUser.setCustomerId(customer.getCustomerId());
		
		Authorities newAuthority = new Authorities();
		newAuthority.setUsername(customer.getUsername());
		newAuthority.setAuthority("ROLE_USER");
		
		session().saveOrUpdate(newUser);
		session().saveOrUpdate(newAuthority);
		
		//create a new cart for any new customer
		Cart newCart = new Cart();
		newCart.setCustomer(customer);
		
		customer.setCart(newCart);
		
		session().saveOrUpdate(customer);
		session().saveOrUpdate(newCart);
		
		session().flush();
	}

	@Override
	public Customer getCustomerById(int id) {
		Customer customer = (Customer) session().get(Customer.class, id);
		session().flush();
		
		return customer;
	}

	@Override
	public void editCustomer(Customer customer) {
		//to do
		
	}

	@Override
	public void deleteCustomer(Customer customer) {
		session().delete(customer);
		session().flush();
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Customer> getAllCustomers() {
		Query query = session().createQuery("from Customer");
		List<Customer> customers = query.list();
		session().flush();
		
		return customers;
	}


	@Override
	public Customer getCustomerByUsername(String username) {
		Query query = session().createQuery("from Customer where username = ?");
		query.setString(0, username);
		Customer customer = (Customer) query.uniqueResult();
		session().flush();
		
		return customer;
	}

}
