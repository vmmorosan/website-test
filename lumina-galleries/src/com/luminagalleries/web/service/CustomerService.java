package com.luminagalleries.web.service;

import java.util.List;

import com.luminagalleries.web.model.Customer;

public interface CustomerService {
	
	void addCustomer(Customer customer);
	
	Customer getCustomerById(int id);
	
	Customer getCustomerByUsername(String username);
	
	void editCustomer(Customer customer);
	
	void deleteCustomer(Customer customer);
	
	List<Customer> getAllCustomers();


}
