package com.dao;

import java.util.List;

import com.beans.Product;

public interface ProductDao {

	//1：根据主键查询
	public Product queryByProductId(String id) throws Exception;
	//2：查询所有商品信息
	public List<Product> queryAll() throws Exception;
	//3：新增商品信息
	public int addProduct();
	//4：更新商品信息
	public int updateProduct();
	//5：删除商品信息
	public int deleteByProductId();
	//根据名称搜索
	public List<Product> queryAllByname(String name);
	//分页
	public List<Product> page(int pageindex);
}
