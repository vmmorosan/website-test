package com.luminagalleries.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.luminagalleries.web.dao.CustomerDao;
import com.luminagalleries.web.model.Customer;
import com.luminagalleries.web.service.CustomerService;

@Service
public class CustomerServiceImpl implements CustomerService{
	
	@Autowired
	private CustomerDao customerDao;

	@Override
	public void addCustomer(Customer customer) {
		customerDao.addCustomer(customer);
		
	}

	@Override
	public Customer getCustomerById(int id) {
		Customer customer = customerDao.getCustomerById(id);
		return customer;
	}
	
	@Override
	public void editCustomer(Customer customer) {
		customerDao.editCustomer(customer);
		
	}

	@Override
	public void deleteCustomer(Customer customer) {
		customerDao.deleteCustomer(customer);
		
	}

	@Override
	public List<Customer> getAllCustomers() {
		List<Customer> customers = customerDao.getAllCustomers();
		return customers;
	}

	@Override
	public Customer getCustomerByUsername(String username) {
		
		return customerDao.getCustomerByUsername(username);
	}

}
