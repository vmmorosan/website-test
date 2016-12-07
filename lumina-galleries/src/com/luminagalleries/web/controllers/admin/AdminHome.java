package com.luminagalleries.web.controllers.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.luminagalleries.web.model.Customer;
import com.luminagalleries.web.model.Product;
import com.luminagalleries.web.service.CustomerService;
import com.luminagalleries.web.service.ProductService;

//all routes are protected by admin domain
@Controller
@RequestMapping("/admin")
public class AdminHome {
	
	@Autowired
	ProductService productService;
	
	@Autowired
	private CustomerService customerService;
	
	@RequestMapping
	public String adminPage(){
		
		return "admin";
	}
	
	@RequestMapping(value = "/productInventory")
	public String viewProductInventory(Model model) {
		List<Product> products = productService.getProductList();

		model.addAttribute("products", products);

		return "productInventory";
	}
	
	@RequestMapping("/customer")
	public String customerManagement(Model model){
		
		List<Customer> customerList = customerService.getAllCustomers();
		model.addAttribute("customerList",customerList);
		
		return "customerManagement";
	}
}
