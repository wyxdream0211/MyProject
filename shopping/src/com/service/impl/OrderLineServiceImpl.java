package com.service.impl;

import java.util.List;

import com.beans.OrderLine;
import com.beans.Orders;
import com.dao.OrderLineDao;
import com.dao.UserDao;
import com.dao.impl.OrderLineDaoImpl;

import com.service.OrderLineService;

public class OrderLineServiceImpl implements OrderLineService{
	private OrderLineDao dao = new OrderLineDaoImpl();
	@Override
	public boolean addOrderLine(OrderLine orderl) {
		boolean flag = true;
		try {
			flag = dao.addOrderLine(orderl);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public boolean deleteByOrderId(int id) {
		boolean flag = true;
		try {
			flag = dao.deleteByOrderId(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public List<OrderLine> queryAll()  {
		List<OrderLine> list =dao.queryAll();
		return list;
	}

	@Override
	public List<OrderLine> queryByOrderId(int id) {
		List list= dao.queryByOrderId(id);
		return list;
	}

}
