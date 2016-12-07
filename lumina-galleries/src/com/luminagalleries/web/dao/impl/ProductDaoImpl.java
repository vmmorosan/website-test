package com.luminagalleries.web.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.luminagalleries.web.dao.ProductDao;
import com.luminagalleries.web.model.Product;

@Repository
@Transactional
public class ProductDaoImpl implements ProductDao{
	
	@Autowired
	private SessionFactory sessionFactory;
	
	private Session session(){
		Session session = sessionFactory.getCurrentSession();
		return session;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Product> getProductList() {
		Query query = session().createQuery("from Product");
		List<Product> productList = query.list();
		session().flush();
		
		return productList;
	}

	@Override
	public Product getProductById(int id) {
		Product product = (Product) session().get(Product.class, id);
		session().flush();
		
		return product;
	}

	@Override
	public void addProduct(Product product) {
		session().saveOrUpdate(product);
		session().flush();
				
	}

	@Override
	public void editProduct(Product product) {
		session().saveOrUpdate(product);
		session().flush();
		
	}

	@Override
	public void deleteProduct(Product product) {
		session().delete(product);
		session().flush();
		
	}

	
}
