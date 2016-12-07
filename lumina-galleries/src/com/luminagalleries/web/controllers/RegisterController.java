package com.luminagalleries.web.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.luminagalleries.web.model.BillingAddress;
import com.luminagalleries.web.model.Customer;
import com.luminagalleries.web.model.ShippingAddress;
import com.luminagalleries.web.service.CustomerService;

@Controller
public class RegisterController {
	
	@Autowired
	CustomerService customerService;
	
	//route from guest domain
	@RequestMapping("/register")
	public String registerCustomer(Model model){
		
		Customer customer = new Customer();
		BillingAddress billingAddress = new BillingAddress();
		ShippingAddress shippingAddress = new ShippingAddress();
		customer.setBillingAddress(billingAddress);
		customer.setShippingAddress(shippingAddress);
		
		model.addAttribute("customer", customer);
		
		return "registerCustomer";
	}
	
	@RequestMapping(value="/register", method = RequestMethod.POST)
	public String registerCustomerPost(@Valid @ModelAttribute("customer") Customer customer, BindingResult result, Model model){
		
		//validate the username - cannot be more than one in the database with same name
		if(result.hasErrors()){
			return "registerCustomer";
		}
		//check existing dayabase info
		List<Customer> customerList = customerService.getAllCustomers();
		for (Customer checkCustomer : customerList) {
			if(checkCustomer.getCustomerEmail().equals(customer.getCustomerEmail())){
				model.addAttribute("emailMsg", "Email already exists!");
				return "registerCustomer";
			}
			if(checkCustomer.getUsername().equals(customer.getUsername())){
				model.addAttribute("usernameMsg", "Username already exists!");
				return "registerCustomer";
			}
		}
		
		customer.setEnabled(true);
		customerService.addCustomer(customer);
		
		return "registerCustomerSuccess";
	}
}
