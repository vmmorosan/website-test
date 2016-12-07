package com.luminagalleries.web.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

//guest domain
@Controller
public class HomeController {
	
	@RequestMapping(value= "/")
	public String showHome(){
		return "home";
	}

	@RequestMapping("/login")
	public String showLogin(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, Model model) {
		//treat the error message parameter - set by spring on failure
		if(error != null){
			model.addAttribute("error", "Invalid username or password");
		}
		//treat the logout message parameter - set by Spring on logout
		if(logout != null){
			model.addAttribute("msg", "You have been logged out successfully");
		}
		
		return "login";
	}
	
	@RequestMapping(value= "/about")
	public String showAboutUs(){
		return "about";
	}

}
