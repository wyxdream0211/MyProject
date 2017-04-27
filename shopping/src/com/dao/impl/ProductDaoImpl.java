package com.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.beans.Product;
import com.dao.ProductDao;
import com.util.JdbcUtil;

public class ProductDaoImpl implements ProductDao {

	public int addProduct() {
		// TODO Auto-generated method stub
		return 0;
	}

	public int deleteByProductId() {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<Product> queryAll() throws Exception{
		List<Product> list = new ArrayList<Product>();
		JdbcUtil util = new JdbcUtil();
		util.getConnection();
		String sql = "select productid,name,baseprice from product";
		ResultSet rs = util.queryByPreparedStatement(sql, null);
		
		while(rs.next()){
			Product product = new Product();
			product.setProductid(rs.getInt("productid"));
			product.setName(rs.getString("name"));
			//product.setDescription(rs.getString("description"));
			product.setBaseprice(rs.getString("baseprice"));
			//product.setWriter(rs.getString("writer"));
			//product.setPublish(rs.getString("publish"));
			//product.setPages(rs.getString("pages"));
			//product.setImages(rs.getString("images"));
			
			list.add(product);
		}
		util.close();
		return list;
	}

	public Product queryByProductId(String id) throws Exception{
		JdbcUtil util = new JdbcUtil();
		util.getConnection();
		String sql = "select productid,name,description,baseprice,writer,publish,pages,images from product where productid=?";
		List params = new ArrayList();
		params.add(id);
		ResultSet rs = util.queryByPreparedStatement(sql, params);
		Product product = new Product();
		if(rs.next()){
			product.setProductid(rs.getInt("productid"));
			product.setName(rs.getString("name"));
			product.setDescription(rs.getString("description"));
			product.setBaseprice(rs.getString("baseprice"));
			product.setWriter(rs.getString("writer"));
			product.setPublish(rs.getString("publish"));
			product.setPages(rs.getString("pages"));
			product.setImages(rs.getString("images"));
		}
		return product;
	}

	public int updateProduct() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Product> queryAllByname(String name) {
		List<Product> list = new ArrayList<Product>();
		JdbcUtil util = new JdbcUtil();
		util.getConnection();
		String sql = "select productid,name,baseprice from product where name like(?)";
		List<Object> params = new ArrayList<Object>();
		params.add("%"+name+"%");
		ResultSet rs = util.queryByPreparedStatement(sql, params);
		
		try {
			while(rs.next()){
				Product product = new Product();
				product.setProductid(rs.getInt("productid"));
				product.setName(rs.getString("name"));
				
				product.setBaseprice(rs.getString("baseprice"));
				
				
				list.add(product);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		util.close();
		return list;
	}

	@Override
	public List<Product> page(int pageindex) {
		int pagesize=5;  //每页行数
		int allRecords=0;  //总行数
		int totalPages=0;   //总页数
		JdbcUtil util = new JdbcUtil();
		util.getConnection();
		String sql="select count(*) from product";
		ResultSet rs = util.queryByPreparedStatement(sql, null);
		List<Product> list =new ArrayList<Product>();
		try {
			//获取总行数
			if(rs.next()){
				allRecords=rs.getInt(1);	
			}
			//计算总页数
			totalPages=(allRecords % pagesize==0)?(allRecords / pagesize):(allRecords / pagesize+1);
			
			if(pageindex > totalPages){
				pageindex = totalPages;
			}
			
			String sql1="select productid,name,baseprice from (select rownum as rn,t.* from (select * from product order by productid)t where rownum<=? * ?)where rn > ? *(?-1)";
			 List<Object> params = new ArrayList<Object>();
			 params.add(pagesize); 
			params.add(pageindex);
			 params.add(pagesize);
			params.add(pageindex);
			rs = util.queryByPreparedStatement(sql1, params);
			while(rs.next()){
				Product product = new Product();
				product.setProductid(rs.getInt("productid"));
				product.setName(rs.getString("name"));
				
				product.setBaseprice(rs.getString("baseprice"));
				
				
				list.add(product);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
		
	}

}
