package com.luminagalleries.web.service;

import com.luminagalleries.web.model.CustomerOrder;

public interface CustomerOrderService {
	
	void addCustomerOrder(CustomerOrder customerOrder);
	
	double getCustomerOrderGrandTotal(int cartId);

}
