package com.service;

import java.util.List;

import com.beans.OrderLine;
import com.dao.OrderLineDao;

public interface OrderLineService {
	//1：根据主键查询
	public List<OrderLine> queryByOrderId(int id) ;
	//2：查询所有用户信息
	public List<OrderLine> queryAll() ;
	//3：新增订单
	public boolean addOrderLine(OrderLine orderl);
	
	//5：删除订单
	public boolean deleteByOrderId(int id);

}
