package com.luminagalleries.web.controllers;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.luminagalleries.web.model.Product;
import com.luminagalleries.web.service.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	//show all products
	@RequestMapping(value = "/productList", method = RequestMethod.GET)
	public String getProducts(Model model){
		List<Product> products = productService.getProductList();
		
		model.addAttribute("products", products);
		
		return "productList";
	}
	
	@RequestMapping("/viewProduct/{id}")
	public String viewProduct(@PathVariable("id") int id, Model model) throws IOException{
		Product product = productService.getProductById(id);
		
		model.addAttribute("product", product);
		return "viewProduct";
	}
	
	//show only selected products (by search condition)
	@RequestMapping("/productList/category")
	public String getProductByCategory(@RequestParam("searchCondition") String searchCondition, Model model){
		List<Product> products = productService.getProductList();
		
		model.addAttribute("products", products);
		model.addAttribute("searchCondition", searchCondition);
				
		return "productList";
	}
}
