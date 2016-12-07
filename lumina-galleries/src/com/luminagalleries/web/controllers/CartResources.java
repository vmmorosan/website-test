package com.luminagalleries.web.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.bind.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.luminagalleries.web.model.Cart;
import com.luminagalleries.web.model.CartItem;
import com.luminagalleries.web.model.Customer;
import com.luminagalleries.web.model.Product;
import com.luminagalleries.web.service.CartItemService;
import com.luminagalleries.web.service.CartService;
import com.luminagalleries.web.service.CustomerService;
import com.luminagalleries.web.service.ProductService;

//REST service controller and resources provider for views = angular
@Controller
@RequestMapping("/rest/cart")
public class CartResources {
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private CartItemService cartItemService;
	
	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private ProductService productService;
	
	
	@RequestMapping("/{cartId}")
	//returns Cart in json format - Spring Response Body - jackson dependency
	public @ResponseBody Cart getCartById(@PathVariable(value="cartId") int cartId){
		
		
		return cartService.getCartById(cartId);
	}
	
	@RequestMapping(value = "/add/{productId}", method = RequestMethod.PUT)
	@ResponseStatus(value = HttpStatus.NO_CONTENT)
	public void addItem(@PathVariable(value="productId") int productId, @AuthenticationPrincipal User activeUser){
		
		Customer customer = customerService.getCustomerByUsername(activeUser.getUsername());
		Cart cart = customer.getCart();
		Product product = productService.getProductById(productId);
		List<CartItem> cartItems = cart.getCartItems();
		for (CartItem cartItem : cartItems) {
			//if the product is in the cart
			if(cartItem.getProduct().getProductId() == product.getProductId()){
				//increase quantity by 1
				cartItem.setQuantity(cartItem.getQuantity() + 1);
				//update pricing
				cartItem.setTotalPrice(product.getProductPrice()*cartItem.getQuantity());
				cartItemService.addCartItem(cartItem);//should be update here
				return;
			}			
		}
		
		CartItem cartItem = new CartItem();
		cartItem.setProduct(product);
		cartItem.setQuantity(1);
		cartItem.setTotalPrice(product.getProductPrice()*cartItem.getQuantity());
		cartItem.setCart(cart);
		cartItemService.addCartItem(cartItem);
		
	}
	
	
	@RequestMapping(value = "/remove/{productId}", method = RequestMethod.PUT)
	@ResponseStatus(value = HttpStatus.NO_CONTENT)
	public void removeItem(@PathVariable int productId){
		CartItem cartItem = cartItemService.getCartItemByProductId(productId);
		cartItemService.removeCartItem(cartItem);
	}
	
	
	@RequestMapping(value="/{cartId}", method = RequestMethod.DELETE)
	@ResponseStatus(value = HttpStatus.NO_CONTENT)
	public void clearCart(@PathVariable int cartId){
		Cart cart = cartService.getCartById(cartId);
		cartItemService.removeAllCartItems(cart);
	}
	
	@ExceptionHandler(IllegalArgumentException.class)
	@ResponseStatus(value=HttpStatus.BAD_REQUEST, reason = "Illegal request, please verify your payload")
	public void handleClientErrors(Exception e){}

	@ExceptionHandler(Exception.class)
	@ResponseStatus(value=HttpStatus.INTERNAL_SERVER_ERROR, reason = "Internal server error")
	public void handleServerErrors(Exception e){}

}
