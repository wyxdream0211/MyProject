package com.service;

import java.util.List;

import com.beans.Orders;

public interface OrderService {
	//1：根据主键查询
	public Orders queryByOrderId(int id) ;
	//2：查询所有用户信息
	public List<Orders> queryAll(int userid) ;
	//3：新增订单
	public boolean addOrder(Orders order);
	
	//5：删除订单
	public boolean deleteByOrderId(int id);
	public int queryOrderid();

}
