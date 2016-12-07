package com.luminagalleries.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.luminagalleries.web.dao.ProductDao;
import com.luminagalleries.web.model.Product;
import com.luminagalleries.web.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductDao productDao;

	@Override
	public List<Product> getProductList() {
		
		return productDao.getProductList();
	}

	@Override
	public Product getProductById(int id) {
		
		return productDao.getProductById(id);
	}

	@Override
	public void addProduct(Product product) {
		
		productDao.addProduct(product);

	}

	@Override
	public void editProduct(Product product) {
		
		productDao.editProduct(product);

	}

	@Override
	public void deleteProduct(Product product) {
		
		productDao.deleteProduct(product);

	}

}
