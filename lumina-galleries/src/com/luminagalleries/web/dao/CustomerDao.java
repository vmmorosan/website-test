package com.luminagalleries.web.dao;

import java.util.List;

import com.luminagalleries.web.model.Customer;

public interface CustomerDao {
	
	void addCustomer(Customer customer);
	
	Customer getCustomerById(int id);
	
	void editCustomer(Customer customer);
	
	void deleteCustomer(Customer customer);
	
	List<Customer> getAllCustomers();

	Customer getCustomerByUsername(String username);

}
