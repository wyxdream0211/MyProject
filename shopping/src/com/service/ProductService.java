package com.service;

import java.util.List;

import com.beans.Product;

public interface ProductService {
	
	//1������������ѯ
	public Product queryByProductId(String id);
	//2����ѯ������Ʒ��Ϣ
	public List<Product> queryAll();
	//3��������Ʒ��Ϣ
	public int addProduct();
	//4��������Ʒ��Ϣ
	public int updateProduct();
	//5��ɾ����Ʒ��Ϣ
	public int deleteByProductId(); 
	//������������
	public List<Product> queryAllByname(String name);
	//��ҳ
	public List<Product> page(int pageindex);
}
