package com.luminagalleries.web.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.bind.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.luminagalleries.web.model.Customer;
import com.luminagalleries.web.service.CustomerService;

@Controller
//to access this controller you have to be logged in
@RequestMapping("/customer/cart")
public class CartController {
	
	@Autowired
	CustomerService customerService;
	
	@RequestMapping
	public String getCart(@AuthenticationPrincipal User activeUser){
		Customer customer = customerService.getCustomerByUsername(activeUser.getUsername());
		int cartId = customer.getCart().getCartId();
		return "redirect:/customer/cart/" + cartId;
	}
	
	@RequestMapping("/{cartId}")
	public String getCartRedirect(@PathVariable(value  = "cartId") int cartId, Model model){
		model.addAttribute("cartId", cartId);
		
		return "cart";
	}
}
