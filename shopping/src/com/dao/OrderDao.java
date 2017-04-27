package com.dao;

import java.util.List;

import com.beans.Orders;
import com.beans.User;

@SuppressWarnings("unused")
public interface OrderDao {
	//1：根据主键查询
	public Orders queryByOrderId(int id) ;
	//2：查询所有用户信息
	public List<Orders> queryAll(int userid) ;
	//3：新增订单
	public boolean addOrder(Orders order);
	
	//5：删除订单
	public boolean deleteByOrderId(int id);
	//查询订单号
	public int queryOrderid();
	
	
}
