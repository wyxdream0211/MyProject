package com.service.impl;

import java.util.List;

import com.beans.Product;
import com.dao.ProductDao;
import com.dao.impl.ProductDaoImpl;
import com.service.ProductService;

public class ProductServiceImpl implements ProductService {

	private ProductDao dao = new ProductDaoImpl();
	
	public int addProduct() {
		// TODO Auto-generated method stub
		return 0;
	}

	public int deleteByProductId() {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<Product> queryAll() {
		List<Product> list=null;
		try {
			list = dao.queryAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public Product queryByProductId(String id) {
		Product product=null;
		try {
			product = dao.queryByProductId(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return product;
	}

	public int updateProduct() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Product> queryAllByname(String name) {
		List list=dao.queryAllByname(name);
		return list;
	}

	@Override
	public List<Product> page(int pageindex) {
		List list=dao.page(pageindex);
		return list;
	}

}
