package com.luminagalleries.web.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.luminagalleries.web.dao.CustomerOrderDao;
import com.luminagalleries.web.model.CustomerOrder;

@Repository
@Transactional
public class CustomerOrderDaoImpl implements CustomerOrderDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session session(){
		return sessionFactory.getCurrentSession();
	}
	
	@Override
	public void addCustomerOrder(CustomerOrder customerOrder) {
		session().saveOrUpdate(customerOrder);
		session().flush();

	}


}
